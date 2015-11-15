local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD,DefS = defines.command,defines.distraction,defines.groupstate

Drones = {} --Create Function Table

Drones.DroneTypes = {
	"attack-drone",
	"attack-drone-rover"
}

require "drones.ai"
require "drones.core"
require "drones.utility"
require "drones.commands"





