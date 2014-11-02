require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=false,
	Entity=true,
	Debug=true
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt
Fuels = {}

require("fuels")

local Fuels = Fuels

remote.addinterface("MoPower", {
	calcturbines = function()
		game.player.print("Detecting Turbines!")
		local Turbines=MoEntity.findentinsquareradius(MoEntity.getplayerpos(),300,"wind-turbine")
		MoEntity.LoopThis(Turbines,function(ent)
			MoEntity.AddToLoop("Turbines",ent)
		end)
	end,
})

--Lets Register into the MoToolBar :D
if remote.interfaces.MoToolBar and remote.interfaces.MoToolBar.addbutton then
	MoTimers.CreateTimer("RegisterToolBar",0,1,false,function()
		remote.call("MoToolBar", "addbutton","calcturbines","Detect Turbines","MoPower","calcturbines","MoPower","Detect Wind Turbines")
	end)
end

function AddFuelStorage(entity)
	local Pos = entity.position
	local Fuel=game.createentity{name = "fuel-storage", position={x=Pos.x-1.5,y=Pos.y}}
	
	MoEntity.AddToLoop("FuelStorages",Fuel,{F=entity})
end

function CoalToPower(Genr,Tank)
	
	local PLvl = Genr.energy or 0
	local MaxEnergy = 100000000
	local FuelERatio = 1000000
	--game.player.print("Inv "..Inv)
	
	for i,d in pairs(Fuels) do
		local Inv = Tank.getitemcount(i)
		--game.player.print("Fuel "..i.." : "..Inv)
		if Inv>0 then
			local FLvl = PLvl+((d*FuelERatio)*Inv)
			--game.player.print("Ener "..i.." : "..FLvl.." o "..MaxEnergy )
			if FLvl<=MaxEnergy then
				Tank.getinventory(1).remove({name=i,count=Inv})
				Genr.energy = FLvl
				game.pollute(Genr.position,(d*Inv)*1.5)
				return
			else
				local Count = math.floor((MaxEnergy-PLvl)/(d*FuelERatio))
				--game.player.print("Count "..i.." : "..Count)
				if Inv>=Count and Count>0 then
					local FLvl = PLvl+((d*FuelERatio)*Count)
					if FLvl<=MaxEnergy then
						Tank.getinventory(1).remove({name=i,count=Count})
						Genr.energy = FLvl
						game.pollute(Genr.position,(d*Count)*1.5)
						return
					else
						--game.player.print("Error "..i.." : "..FLvl)
					end
				end
			end
		end
	end
end

MoEntity.SubscribeOnBuilt("wind-turbine","TurbineSpawn",function(entity)
	MoEntity.AddToLoop("Turbines",entity)
end)

MoEntity.SubscribeOnBuilt("basic-coalgen","CoalGenSpawn",function(entity)
	AddFuelStorage(entity)
end)

local CoalThink = false
MoTimers.CreateTimer("CoalGenThink",0.2,0,false,function()
	if CoalThink then--Alternate between the fuel storage and the generators per think. (Saves processor time and lags less.)
		CoalThink = false
		MoEntity.CallLoop("CoalGens",function(ent)
			local E = KTE(ent.entity)
			if E.valid then
				if ent.extra.F.valid then
					CoalToPower(E,ent.extra.F)
				else
					AddFuelStorage(E)--Give the generator a fuel tank, as its storage died or something.
				end
				return true
			end	
			return false		
		end)
	else
		CoalThink = true
		MoEntity.CallLoop("FuelStorages",function(ent)
		local E = KTE(ent.entity)
			if E.valid then
				if ent.extra.F.valid then
					CoalToPower(ent.extra.F,E)
				else
					E.die()--Selfdestruct a useless fuel storage.
				end
				return true
			end	
			return false		
		end)	
	end
end)

MoTimers.CreateTimer("TurbineThink",0,0,false,function()
	MoEntity.CallLoop("Turbines",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			local energy = game.windspeed*100000
			E.energy = energy
			return true
		end	
		return false
	end)
end)
