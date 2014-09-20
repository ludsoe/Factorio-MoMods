local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD,DefS = defines.command,defines.distraction,defines.groupstate

local MaxDrones = 20
local DroneName = "attack-drone"

function OnCRPBuilt(entity)
	MoEntity.AddToLoop("croboport",entity,{G={},C=1})
end

MoEntity.SubscribeOnBuilt("combat-roboport","combatroboport",OnCRPBuilt)
MoEntity.SubscribeOnBuilt("combat-drone-wagon","combatrobowagon",OnCRPBuilt)

function SpawnDrone(E,G)
	local Drones = E.getitemcount(DroneName)
	if Drones > 0 and not E.tobedeconstructed(E.force) then
		local V = game.findnoncollidingposition(DroneName, E.position, 10, 1)
		
		local Drone=game.createentity{name = DroneName, position=V}
		Drone.force=E.force
		table.insert(G,RegKey(Drone))
		E.getinventory(1).remove({name=DroneName,count=1})
		
		return true
	else
		return false
	end
end

function StoreDrone(E,G)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		if E.caninsert({name=DroneName,count=1}) then
			if util.distance(D.position,E.position) < 5 then
				D.destroy()
				E.insert({name=DroneName,count=1})
				return false --We stored the drone, lets remove it from the table.
			end
		end
		return true
	end)	
end

function CommandDrones(G,C)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		D.setcommand(C)
		return true
	end)
end

function ProtectArea(P,E,V,R)
	local G = E.G
	if E.C==nil then E.C = 1 else E.C=E.C+1 end

	local Scan = game.findnearestenemy{position=V, maxdistance=R}
	if Scan~=nil and Scan.valid then
		while #G < MaxDrones do 
			if not SpawnDrone(P,G) then break end 
		end
		if E.C > 6 then E.C=1
			CommandDrones(G,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
		end
	else--Return to base nothing nearby for us to kill.
		if E.C > 8 then E.C=1	
			CommandDrones(G,{type=DefC.gotolocation,destination=V,radius=10,distraction=DefD.byenemy})
		end
		StoreDrone(P,G)
	end
end

function AssistPlayer(P,E,O)
	local G = E.G
	if E.C==nil then E.C = 1 else E.C=E.C+1 end
	
	while #G < MaxDrones do 
		if not SpawnDrone(P,G) then break end 
	end
	
	local Scan = game.findnearestenemy{position=O.position, maxdistance=20}
	if Scan~=nil and Scan.valid then
		if E.C > 6 then E.C=1
			CommandDrones(G,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
		end
	else
		if E.C > 4 then E.C=1	
			CommandDrones(G,{type=DefC.gotolocation,destination=O.position,radius=10,distraction=DefD.byenemy})
		end
	end
end

function GetOrders(P,E)
	local Rad = 40+(P.getitemcount("drone-orders-rangeboost")*10)
	if P.getitemcount("drone-orders-player") > 0 then
		--Find closest player, store inside table.
		E.P=game.player
		return "Player",Rad
	end
	return false,Rad
end

function ManageDrones(P,E)
	local Orders,Radius = GetOrders(P,E)
	
	if Orders then
		if Orders == "Player" then
			if util.distance(P.position,E.P.position) < Radius then
				AssistPlayer(P,E,E.P)
			else
				ProtectArea(P,E,P.position,Radius)
			end
		end
	else
		ProtectArea(P,E,P.position,Radius)
	end
end

MoTimers.CreateTimer("Combat-RobotPorts",0.5,0,false,function()
	MoEntity.CallLoop("croboport",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		--if data.G==nil or not data.G.valid then return false end
		ManageDrones(DE,data.extra)
		return true
	end)
end)