local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction
local Drones = Drones --Localise

--Returns a formatted attack command for the engine to handle.
function Drones.GetAttackCommand(Target,Start)
	return {F="AttackEnemy",P=Target.position,D={T=RegKey(Target)},C={type=DefC.go_to_location,destination=Target.position,radius=10,distraction=DefD.byenemy}}
end

--Returns a formatted goto command for the engine to handle.
function Drones.GetGotoOrder(Position,MaxDist)
	return {type=DefC.go_to_location,destination=Position,radius=MaxDist,distraction=DefD.byenemy}
end

function Drones.SetDroneOrder(Data,Command,Now)
	Data.NewCMD = Command
	Data.NewThk = Now or false
end

Drones.CreateCommandFunc("Idle",function(Drone,Data) 
	--Run Check for enemies.
	local Scan = Drones.NearbyEnemy(Drone.surface,Drone.position,150)
	if Scan and Scan.valid then
		Drones.SetDroneOrder(Data,Drones.GetAttackCommand(Scan,Drone.position),true)
		return
	end
	
	--Ok nobody to shoot.... Well lets try to find a empty port to go to.
	local Port = Drones.FindClosestEmptyPort(Drone)
	if Port and Port.valid then
		if Port.can_insert({name=Drone.name,count=1}) then
			if util.distance(Port.position,Drone.position) < 10 then
				Port.insert({name=Drone.name,count=1})
				Drone.destroy()
				Data.Removed = true
			else
				Drones.SetDroneOrder(Data,{F="Idle",P=Port.position,D={},C=Drones.GetGotoOrder(Port.position,20)},false)
			end
			return
		end
	end
	
	--Well no ports at all.... Time to stalk a player until we find enemies or a port we can go to.
	local Pos = Drone.position
	local Ply = MoEntity.closestplayer(Pos.x,Pos.y).position
	Drones.SetDroneOrder(Data,{F="Idle",P=Ply,D={},C=Drones.GetGotoOrder(Ply,20)},false)
end)

Drones.CreateCommandFunc("AttackEnemy",function(Drone,Data) 
	local Targ = KTE(Data.T)
	if not Targ or not Targ.valid then
		local Scan = Drones.NearbyEnemy(Drone.surface,Drone.position,100)
		if Scan and Scan.valid then
			Drones.SetDroneOrder(Data,Drones.GetAttackCommand(Scan,Drone.position),true)
			return
		end
		Drones.SetDroneOrder(Data,{F="Idle",D={}},false)	
	end
end)








