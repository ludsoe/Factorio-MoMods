local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction

--[[
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
end]]

function ProtectArea(O)
	local Scan = game.findnearestenemy{position=O.C, maxdistance=O.R}
	if Scan~=nil and Scan.valid then
		O.Command = {P=Scan.position,C={type=DefC.attack,target=Scan,distraction=DefD.byenemy}}
		return true
	end
	return false
end

function AssistPlayer(O)
	local Scan = game.findnearestenemy{position=O.PE.position, maxdistance=20}
	if Scan~=nil and Scan.valid then
		O.Command = {P=Scan.position,C={type=DefC.attack,target=Scan,distraction=DefD.byenemy}}
	end
	O.Command = {P=O.PE.position,C={type=DefC.gotolocation,destination=P.position,radius=10,distraction=DefD.byenemy}}
	return true
end


