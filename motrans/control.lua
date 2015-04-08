require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=false,
	Entity=true
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt

--[[
MoEntity.SubscribeOnBuilt("boat","BoatSpawn",function(entity)
	MoEntity.AddToLoop("Boats",entity)
end)

MoTimers.CreateTimer("BoatHealthRegen",1,0,false,function()
	MoEntity.CallLoop("Boats",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			if not E.health then return end
			E.health=E.health+10 
			return true
		end	
		return false
	end)
end)
]]