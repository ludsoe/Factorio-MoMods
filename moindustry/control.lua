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
require "config"

MoIndustry = {}
MoIndustry.Data = {BotForce=""}
local Save=function(T) DefaultSaveLoad(MoIndustry,T) end
RegisterSaveTable("MoIndustry",MoIndustry,Save,true)

require "scripts.miningdrones"

remote.add_interface("MoIndustry", ModInterface)

function Intialize()
	if not game.forces["miningrobots"] then
		MoIndustry.Data.BotForce = game.create_force("miningrobots")
	end
	
	MoTimers.CreateTimer("BotManageTechs",1,0,false,BotManageTechs)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 
