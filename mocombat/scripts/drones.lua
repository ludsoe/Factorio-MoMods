local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD,DefS = defines.command,defines.distraction,defines.groupstate

local Random = MoMisc.Random --Localise the psuedo random function.

local MaxDrones = 20
local DroneName = "attack-drone"

function OnCRPBuilt(entity)
	MoEntity.AddToLoop("croboport",entity,{G={}})
end

MoEntity.SubscribeOnBuilt("combat-roboport","combatroboport",OnCRPBuilt)

function PosOrNeg(Seed)
	local X = Random(Seed,1,10)
	if X>=5then
		return -1
	end
	return 1
end

function SpawnDrone(E,G,A)
	local Drones = E.getitemcount(DroneName)
	if Drones > 0 then
		local V = game.findnoncollidingposition(DroneName, E.position, 10, 1)
		
		local Drone=game.createentity{name = DroneName, position=V}
		Drone.force=game.player.force
		table.insert(G,RegKey(Drone))
		E.getinventory(1).remove({name=DroneName,count=1})
	end
end

function CommandDrones(G,C)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		D.setcommand(C)
		return true
	end)
end

function GetOrders(P)
	local Rad = 40+(P.getitemcount("drone-orders-rangeboost")*10)
	if P.getitemcount("drone-orders-player") > 0 then
		return "Player",Rad
	end
	return false,Rad
end

function ProtectArea(G,V,R)
	local Scan = game.findnearestenemy{position=V, maxdistance=R}
	if Scan~=nil and Scan.valid then
		CommandDrones(G,{type=DefC.attack,target=Scan,distraction=DefD.byenemy})
	else--Return to base nothing nearby for us to kill.
		CommandDrones(G,{type=DefC.gotolocation,destination=V,radius=10,distraction=DefD.byenemy})
	end
end

function ManageDrones(P,E)
	local G = E.G

	if #G < MaxDrones then-- Add Drone usage
		SpawnDrone(P,G)
	end
	
	local Orders,Radius = GetOrders(P)
	if Orders ~= false then -- If some other orders
		if Orders == "Player" then
			ProtectArea(G,game.player.position,Radius)
		end
	else
		ProtectArea(G,P.position,Radius)
	end
end

MoTimers.CreateTimer("Combat-RobotPorts",1,0,false,function()
	MoEntity.CallLoop("croboport",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		--if data.G==nil or not data.G.valid then return false end
		ManageDrones(DE,data.extra)
		return true
	end)
end)