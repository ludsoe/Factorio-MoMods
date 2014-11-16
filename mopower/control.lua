require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=false,
	Entity=true,
	Debug=true
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt

require "scripts.coalpower"
require "scripts.nuclearpower"

--Lets Register into the MoToolBar :D
if remote.interfaces.MoToolBar and remote.interfaces.MoToolBar.addbutton then
	MoTimers.CreateTimer("RegisterToolBar",0,1,false,function()
		remote.call("MoToolBar", "addbutton","calcturbines","Detect Turbines","MoPower","calcturbines","MoPower","Detect Wind Turbines")
	end)
end

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
