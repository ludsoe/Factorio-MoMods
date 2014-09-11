
data:extend(
{
{
    type = "explosion",
    name = "sound",
    flags = {"not-on-map"},
    animation_speed = 1,
    animations =
    {
      {
        filename = "__modname__/graphics/empty.png",
        priority = "low",
        frame_width = 32,
        frame_height = 32,
        frame_count = 1
      }
    },   
	sound =
    {
      {
        filename = "__modname__/sound/sound.ogg",
        volume = 1
      }
    },
    light = {intensity = 0, size = 0},
    smoke = "smoke-fast",
    smoke_count = 0,
    smoke_slow_down_factor = 1
  },
  {
    type = "lamp",
    name = "small-lightglow",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 9999, mining_time = 9999, result = "small-lamp"},
    max_health = 9999,
    corpse = "small-remnants",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage_per_tick = "0KW",
    light = {intensity = 0.9, size = 40},
    picture_off =
    {
      filename = "__modname__/graphics/empty.png",
      priority = "low",
      width = 83,
      height = 75,
      shift = {0, -0.1}
    },
    picture_on =
    {
      filename = "__modname__/graphics/empty.png",
      priority = "low",
      width = 83,
      height = 75,
      x = 83,
      shift = {0, -0.1}
    }
  }
})
