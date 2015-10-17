local Random = MoMisc.Random --Localise the psuedo random function.

local FDist=1.5
local DrainRate = function(Seed) return Random(Seed,40,160) end
local EnergyCost,RunCost,RegenRate = 10000,120,3
local PostH,FieldH = 1200,600
local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey

function SuckEnergy(P1,P2,Amt)
	if not P1.valid or not P2.valid then return false end
	if P1.energy >= Amt then
		P1.energy=P1.energy-Amt
		return true
	end
	if P2.energy >= Amt then
		P2.energy=P2.energy-Amt
		return true
	end
	return false
end

function OnPostBuilt(entity,fix)
	fix = fix or false
	local Connected = {}
	local Posts=MoEntity.findentinsquareradius(entity.surface,entity.position,30,"forcefield-post")
	local MKey = RegKey(entity)
	MoEntity.LoopThis(Posts,function(ent)
		local v1,v2 = entity.position,ent.position
		if not MoEntity.inline(v1,v2) or util.distance(v1,v2) < 5 then return end
		local P1,P2 = {x=MoMath.Approach(v1.x,v2.x,FDist),y=MoMath.Approach(v1.y,v2.y,FDist)},{x=MoMath.Approach(v2.x,v1.x,FDist),y=MoMath.Approach(v2.y,v1.y,FDist)}
		if MoEntity.traceline(ent.surface,P1,P2,"forcefieldwall") then
			local EKey = RegKey(ent)
			Connected[EKey]={E=EKey,P={P1=P1,P2=P2}}
			local Res = MoEntity.GetDataFromLoop("forcefields",ent)
			if not Res then MoEntity.AddToLoop("forcefields",entity,Connected) if fix then OnPostBuilt(ent,true) end return end
			Res.extra[MKey]={E=MKey,P={P1=P2,P2=P1}}
		end
	end)
	MoEntity.AddToLoop("forcefields",entity,Connected)
end

MoEntity.SubscribeOnBuilt("forcefield-post","ForceFieldDetection",OnPostBuilt)

--Lets Register into the MoToolBar :D
if remote.interfaces.MoToolBar and remote.interfaces.MoToolBar.addbutton then
	remote.call("MoToolBar", "addbutton","calcffps","Detect FF Posts","MoCombat","detectforcefields","MoCombat","Detect Force Field Posts")
end

ModInterface.detectforcefields = function()
	MoMisc.Print("Detecting ForceFields!")
	for i,d in pairs(game.players) do
		MoEntity.LoopThis(MoEntity.findentinsquareradius(d.surface,MoEntity.getplayerpos(i),20,"forcefield-post"),OnPostBuilt)
	end
end

function ManageForceFields()
	MoEntity.CallLoop("forcefields",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		if DE.health < PostH then
			if DE.energy >= EnergyCost then 
				DE.health=DE.health+RegenRate
				DE.energy=DE.energy-EnergyCost
			end
		end
		MoEntity.LoopThis(data.extra,function(d)
			local dE = KTE(d.E)
			if dE==nil or not dE.valid then return false end
			MoEntity.functraceline(DE.surface,d.P.P1,d.P.P2,"forcefieldwall",function(V)
				if DE.energy>=EnergyCost then
					local Wall=DE.surface.create_entity{name = "forcefieldwall", position= V}
					MoEntity.AddToLoop("fields",Wall,{P1=data.entity,P2=d.E})
					DE.energy=DE.energy-EnergyCost
				end
				return true
			end)
			return true
		end)
		return true
	end)
	
	MoEntity.CallLoop("fields",function(ent)
		local f,d = KTE(ent.entity),ent.extra
		if f~=nil and f.valid then
			local PD1,PD2 = KTE(d.P1),KTE(d.P2)
			local Valid = false
			if PD1~=nil and PD2~=nil then Valid = PD1.valid and PD2.valid end
			if not Valid or not SuckEnergy(PD1,PD2,RunCost) then
				local DR = DrainRate(math.modf(f.position.x+f.position.y))
				if f.health>DR then
					f.health=f.health-DR 
				else
					f.destroy()
					return false
				end
			else
				if f.health < FieldH then
					if SuckEnergy(PD1,PD2,EnergyCost*0.5) then
						f.health=f.health+RegenRate
					end
				end
			end
			return true
		end	
		return false
	end)
end
MoTimers.CacheFunction("ManageForceFields",ManageForceFields)

