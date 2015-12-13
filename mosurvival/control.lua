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

MoMining = {}
MoMining.Data = {BotForce=""}
local Save=function(T) DefaultSaveLoad(MoMining,T) end
RegisterSaveTable("MoMining",MoMining,Save,true)

require "scripts.miningdrones"

remote.add_interface("MoMining", ModInterface)

function Intialize()
	if not game.forces["miningrobots"] then
		MoMining.Data.BotForce = game.create_force("miningrobots")
	else
		MoMining.Data.BotForce = game.forces["miningrobots"]
	end
	
	MoTimers.CreateTimer("BotManageTechs",1,0,false,BotManageTechs)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 
