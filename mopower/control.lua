require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=false,
	Entity=true,
	Debug=false
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt

require "scripts.coalpower"
require "scripts.nuclearpower"

MoEntity.SubscribeOnBuilt("wind-turbine","TurbineSpawn",function(entity)
	MoEntity.AddToLoop("Turbines",entity)
end)

MoTimers.CreateTimer("TurbineThink",0,0,false,function()
	MoEntity.CallLoop("Turbines",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			local energy = game.windspeed*100000
			E.energy = energy
			return true
		end	
		return false
	end)
end)
