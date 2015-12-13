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

if remote.interfaces.MoMining then
	local Techs = {"logistic-robot-speed-6","logistic-robot-speed-7","logistic-robot-speed-8"}
	for i,d in pairs(Techs) do
		remote.call("MoMining", "RegisterTech", d)
	end
end

