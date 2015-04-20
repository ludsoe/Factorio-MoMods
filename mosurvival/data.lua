data.mosurvival = true

MoConfig = MoConfig or {} --Create a empty table to store our config in

require("config")

data:extend({
  {
	type = "damage-type",
	name = "survival"
  }
})