local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction

local ArtifactName = "alien-artifact"

function PickupArtifact(T,P,G)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		if T~=nil and T.valid then
			if util.distance(D.position,T.position) < 5 then
				P.insert({name=ArtifactName,count=1})
				T.destroy()
				return true
			end
		end
		return true
	end)
end

function ArtifactScan(P,E,V,R)
	local G = E.G
	
	if P.caninsert({name=ArtifactName,count=1}) then
		local Scan = MoEntity.findentinsquareradius(V,R,"item-on-ground")
		for s,d in pairs(Scan) do
			if d~=nil and d.valid and d.stack.name==ArtifactName then
				while #G < MaxDrones do 
					if not SpawnDrone(P,G) then break end 
				end
				CommandDrones(G,P.position,{type=DefC.gotolocation,destination=d.position,radius=5,distraction=DefD.byenemy})
				PickupArtifact(d,P,G)
			end
			return true
		end
	end
	return false
end

function ReturnToBase(P,E)
	local G = E.G

	CommandDrones(G,P.position,{type=DefC.gotolocation,destination=P.position,radius=10,distraction=DefD.byenemy})
	StoreDrone(P,G)
end


