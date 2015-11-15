local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local Drones = Drones --Localise

--Ease function to help synchronise changes across all drone spawning.
function Drones.SetupDrone(E,O)
	local Pos = E.position
	MoEntity.AddToLoop("advcomdrones",E,{T=0,CMD=O or {F="Idle",D={}}})
end

--None player spawning of drones.
function Drones.SpawnDrone(E,T,O)
	local V = E.surface.find_non_colliding_position(T, E.position, 10, 1)
	
	local Drone=E.surface.create_entity{name = T, position=V}
	Drone.force=E.force
	Drones.SetupDrone(Drone,O)
end

function Drones.ContainsDrones(E)
	for i,d in pairs(Drones.DroneTypes) do
		local Drones = E.get_item_count(d)
		if Drones > 0 then
			return {T=d,A=Drones}
		end
	end
end

--For Each drone type we want to spawn and act as a drone.
for i,d in pairs(Drones.DroneTypes) do
	MoEntity.SubscribeOnBuilt(d,"dronedetectspawn",Drones.SetupDrone)
end

--For each storage type we want to act as a combat robotics port.
MoEntity.SubscribeOnBuilt("combat-roboport-smart","combatroboport",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)
MoEntity.SubscribeOnBuilt("combat-drone-wagon","combatrobowagon",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)

if MoConfig.MegaTank then
	MoEntity.SubscribeOnBuilt("mega-tank","megatankcombatroboport",function(entity) MoEntity.AddToLoop("combatroboticspost",entity) end)
end