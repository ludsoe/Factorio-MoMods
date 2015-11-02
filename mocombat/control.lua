MLC = {
	Math=true, --Load the Math Module?
	Timers=true, --Load the Timer Module?
	Misc=true, --Load the Misc Module?
	Entity=true, --Load the entity module?
	Debug=false --Load the debug module?
}

MoSave = require "mologiccore.base"
ModInterface,MoConfig = {},{} local M = MoConfig

require "config"

require "scripts.deathchest"

if M.ForceFields then --We only need forcefield logic if the forcefields are enabled.
	require "scripts.forcefields"
end

if M.AttackDrones then
	require "scripts.dronescore"
end

if M.BFG then
	if remote.interfaces.MoPower then
		remote.call("MoPower", "RegisterFuel", "infused-solid-fuel", 54)
	end
end
	
remote.add_interface("MoCombat", ModInterface)

function Intialize()
	if M.ForceFields then
		MoTimers.CreateTimer("ManageForceFields",0.2,0,false,ManageForceFields)
	end
	
	if M.AttackDrones then
		MoTimers.CreateTimer("ManageCombatDronePosts",1,0,false,ManageCombatDronePosts)
		MoTimers.CreateTimer("ManageCombatDroneAi",1,0,false,ManageCombatDroneAi)
	end
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 
