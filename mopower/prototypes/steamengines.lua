data:extend(
{
 {
    type = "generator",
    name = "octo-steam-engine",
    icon = "__mopower__/graphics/icons/octo-steam-engine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 3, result = "octo-steam-engine"},
    max_health = 2400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 0.8,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-2.7, -4.7}, {2.7, 4.7}},
    selection_box = {{-3, -5}, {3, 5}},
    fluid_box =
    {
      base_area = 8,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-0.5, 5.5} },
		{ position = {0.5, 5.5} },
        { position = {-0.5, -5.5} },
		{ position = {0.5, -5.5} },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-horizontal.png",
      width = 246,
      height = 137,
      frame_count = 32,
      line_length = 8,
      shift = {2.68, -0.12},
	  scale = 2
    },
    vertical_animation =
    {
      filename = "__base__/graphics/entity/steam-engine/steam-engine-vertical.png",
      width = 155,
      height = 186,
      frame_count = 32,
      line_length = 8,
      shift = {1.624, 0.062},
	  scale = 2
    },
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {1.8, 0.0},
        east_position = {-4.0, -4.0},
        frequency = 40 / 32,
        starting_vertical_speed = 0.08,
        slow_down_factor = 1,
        starting_frame_deviation = 60
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    min_perceived_performance = 0.25,
    performance_to_sound_speedup = 0.5
  },
  {
    type = "item",
    name = "octo-steam-engine",
    icon = "__mopower__/graphics/icons/octo-steam-engine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-b[octo-steam-engine]",
    place_result = "octo-steam-engine",
    stack_size = 8
  },
  {
    type = "recipe",
    name = "octo-steam-engine",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steam-engine", 8}
    },
    result = "octo-steam-engine"
  },
  {
    type = "technology",
    name = "octo-steam-engine",
    icon = "__mopower__/graphics/technology/octo_steam_engines.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "octo-steam-engine"
      }
    },
    prerequisites = {"electric-energy-distribution-1"},
    unit =
    {
      count = 80,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-h-c",
  }
}
)