data.mosurvival = true

MoConfig = MoConfig or {} --Create a empty table to store our config in

require("config")

data:extend({
  {
	type = "damage-type",
	name = "survival"
  },
  {
    type = "explosion",
    name = "stomach-growl",
    flags = {"not-on-map"},
    animation_speed = 1,
    animations =
    {
      {
        filename = "__mosurvival__/graphics/empty.png",
        priority = "low",
        width = 32,
        height = 32,
        frame_count = 1
      }
    },   
	sound =
    {
      {
        filename = "__mosurvival__/sound/hunger_warning.ogg",
        volume = 0.6
      }
    },
    light = {intensity = 0, size = 0},
    smoke = "smoke-fast",
    smoke_count = 0,
    smoke_slow_down_factor = 1
  }
})