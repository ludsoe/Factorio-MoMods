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

require "scripts.coalpower"
require "scripts.nuclearpower"

MoEntity.SubscribeOnBuilt("wind-turbine","TurbineSpawn",function(entity)
	MoEntity.AddToLoop("Turbines",entity)
end)

MoTimers.CreateTimer("TurbineThink",0,0,false,function()
	MoEntity.CallLoop("Turbines",function(ent)
		local E = MoEntity.KeyToEnt(ent.entity)
		if E.valid then
			local energy = game.windspeed*100000
			E.energy = energy
			return true
		end	
		return false
	end)
end)

MoTimers.CreateTimer("Test",0,1,false,function()
	game.removeofflineplayers()
end)