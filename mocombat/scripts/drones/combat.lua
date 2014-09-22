local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction

function ProtectArea(P,E,V,R)
	local G = E.G

	local Scan = game.findnearestenemy{position=V, maxdistance=R}
	if Scan~=nil and Scan.valid then
		while #G < MaxDrones do 
			if not SpawnDrone(P,G) then break end 
		end
		CommandDrones(G,Scan.position,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
		return true
	end
	return false
end

function AssistPlayer(P,E,O)
	local G = E.G
	
	while #G < MaxDrones do 
		if not SpawnDrone(P,G) then break end 
	end
	
	local Scan = game.findnearestenemy{position=O.position, maxdistance=20}
	if Scan~=nil and Scan.valid then
		CommandDrones(G,Scan.position,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
		return true
	end
	return false
end


