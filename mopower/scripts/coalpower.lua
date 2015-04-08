Fuels = {}

require("fuels") --Load the fuel values

function CoalToPower(Genr,Tank)
	local PLvl = Genr.energy or 0
	--game.player.print("Inv "..Inv)
	local MJAmount = MoMath.GetMJ()
	local MaxEnergy = 100*MJAmount

	for i,d in pairs(Fuels) do
		local Inv = Tank.getitemcount(i)
		--game.player.print("Fuel "..i.." : "..Inv)
		if Inv>0 then
			local FLvl = PLvl+((d*MJAmount)*Inv)
			--game.player.print("Ener "..i.." : "..FLvl.." o "..MaxEnergy )
			if FLvl<=MaxEnergy then
				Tank.getinventory(1).remove({name=i,count=Inv})
				Genr.energy = FLvl
				game.pollute(Genr.position,(d*Inv)*1.2)
				return
			else
				local Count = math.floor((MaxEnergy-PLvl)/(d*MJAmount))
				--game.player.print("Count "..i.." : "..Count)
				if Inv>=Count and Count>0 then
					local FLvl = PLvl+((d*MJAmount)*Count)
					if FLvl<=MaxEnergy then
						Tank.getinventory(1).remove({name=i,count=Count})
						Genr.energy = FLvl
						game.pollute(Genr.position,(d*Count)*1.2)
						return
					else
						--game.player.print("Error "..i.." : "..FLvl)
					end
				end
			end
		end
	end
end

local function PrintError(Text)
	for i,d in pairs(game.players) do
		d.print(""..Text)
	end
end

MoEntity.CreateAdvEntityHook("basic-coalgen","CoalGenSpawn",{{Type="fuel-storage",Name="FuelTank"}},{},0.2,function(ent)
	local E = ent.entity
	if E and E.valid then
		local Fuel = MoEntity.KeyToEnt(ent.bits["FuelTank"].E)
		if Fuel and Fuel.valid then
			CoalToPower(E,Fuel)
		end
		return true
	end	
	return false		
end)

MoTimers.CreateTimer("CoalGenUpgrade",0.2,1,false,function()
	local KTE = MoEntity.KeyToEnt
	MoEntity.CallLoop("FuelStorages",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			local Pos = E.position
			local Chest=game.createentity{name = "wooden-chest", position={x=Pos.x or 0,y=Pos.y or 0}}
			
			Chest.force = ent.extra.F.force
			
			Chest.getinventory(1).insert({name="basic-coalgen",count=1})
			for i,d in pairs(E.getinventory(1).getcontents()) do
				Chest.getinventory(1).insert({name=i,count=d})
			end
			Chest.orderdeconstruction(Chest.force)
			
			if ent.extra.F.valid then ent.extra.F.die() end				
			E.destroy()
		end	
		return false		
	end)
end)