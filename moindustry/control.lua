require "util"
require "defines"

MLC = {
	Math=true,
	Timers=true,
	Misc=true,
	Entity=true,
	Debug=false
}

MoSave = require "mologiccore.base"
ModInterface,MoConfig = {},{} local M = MoConfig

require "scripts.miningdrones"

remote.add_interface("MoIndustry", ModInterface)

function Intialize()
	MoTimers.CreateTimer("MiningTowersThink",1,0,false,MiningTowersThink)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 
