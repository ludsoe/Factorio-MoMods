data:extend(
{
 {
    type = "accumulator",
    name = "octo-accumulator",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "octo-accumulator"},
    max_health = 2000,
    corpse = "medium-remnants",
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2, -2}, {2, 2}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "40MJ",
      usage_priority = "terciary",
      input_flow_limit = "2400kW",
      output_flow_limit = "2400kW"
    },
    picture =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      priority = "extra-high",
      width = 248,
      height = 206,
      shift = {1.4, -0.4}
    },
    charge_animation =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      width = 248,
      height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 14},
    discharge_animation =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      width = 248,
      height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 14}
  },
  {
    type = "item",
    name = "octo-accumulator",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[octo-accumulator]",
    place_result = "octo-accumulator",
    stack_size = 32
  },
  {
    type = "recipe",
    name = "octo-accumulator",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"basic-accumulator", 8}
    },
    result = "octo-accumulator"
  },
  {
    type = "technology",
    name = "electric-energy-accumulators-octo",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "octo-accumulator"
      }
    },
    prerequisites = {"electric-energy-accumulators-1"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-h-c",
  },
   {
    type = "accumulator",
    name = "energy-devourer",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "energy-devourer"},
    max_health = 2000,
    corpse = "medium-remnants",
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2, -2}, {2, 2}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "40000GJ",
      usage_priority = "terciary",
      input_flow_limit = "5GJ",
      output_flow_limit = "2400kW"
    },
    picture =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      priority = "extra-high",
      width = 248,
      height = 206,
      shift = {1.4, -0.4}
    },
    charge_animation =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      width = 248,
      height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 14},
    discharge_animation =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      width = 248,
      height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 14}
  },
  {
    type = "item",
    name = "energy-devourer",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[energy-devourer]",
    place_result = "energy-devourer",
    stack_size = 32
  }
}
)