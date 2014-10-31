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

function ArtifactScan(O,D)
	local P = KTE(O.Post)
	if P==nil or not P.valid then return false end
	
	local Artifacts = {}
	if D.Scan~=nil and D.Scan>game.tick then
		for s,d in pairs(D.Facts) do
			if d~=nil and d.valid and d.stack.name==ArtifactName then
				Artifacts[s]=d--Add the artifact to the artifacts table.
			end
		end
	else
		D.Scan=game.tick+(2*60)
		if P.caninsert({name=ArtifactName,count=1}) then
			local Scan = MoEntity.findentinsquareradius(O.C,O.R,"item-on-ground")
			for s,d in pairs(Scan) do
				if d~=nil and d.valid and d.stack.name==ArtifactName then
					Artifacts[s]=d--Add the artifact to the artifacts table.
				end
			end
		end
	end
	
	D.Facts=Artifacts
	
	if #Artifacts >= 1 then
		O.MS = 2
		O.Artifacts = Artifacts
		return true
	else
		O.MS = 10
		return false
	end
end

function ArtifactFinish(O,C)
	if O.A then
		local P = KTE(O.Post)
	
		local ArtCount = #O.Artifacts or 0
		if ArtCount >= 1 then
			local d = O.Artifacts[MoMath.Clamp(C,1,ArtCount)]
			
			if d==nil or not d.valid then ReturnToBase(O) return end
			
			O.Command = {P=P.position,C={type=DefC.gotolocation,destination=d.position,radius=5,distraction=DefD.byenemy}}
			O.ComFunc = {N="Collect",F=PickupArtifact,T=d,P=P}			
		end
	end
end

function ReturnToBase(O)
	local P = KTE(O.Post)
	
	O.S=false
	O.Command = {P=P.position,C={type=DefC.gotolocation,destination=P.position,radius=10,distraction=DefD.byenemy}}
	O.ComFunc = {N="Store",F=StoreDrone,P=P}
end


