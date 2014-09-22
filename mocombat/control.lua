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

if M.ForceFields then --We only need forcefield logic if the forcefields are enabled.
	require "scripts.forcefields"
end

if M.AttackDrones then
	require "scripts.dronescore"
end

remote.addinterface("MoCombat", ModInterface)
