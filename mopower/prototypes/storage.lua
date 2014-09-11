data:extend(
{
 {
    type = "accumulator",
    name = "adv-accumulator",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "adv-accumulator"},
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
      frame_width = 248,
      frame_height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 14},
    discharge_animation =
    {
      filename = "__mopower__/graphics/adv-accumulator/adv-accumulator.png",
      frame_width = 248,
      frame_height = 206,
      frame_count = 1,
      shift = {1.4, -0.4},
      animation_speed = 1
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 14}
  },
  {
    type = "item",
    name = "adv-accumulator",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[adv-accumulator]",
    place_result = "adv-accumulator",
    stack_size = 32
  },
  {
    type = "recipe",
    name = "adv-accumulator",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"basic-accumulator", 8}
    },
    result = "adv-accumulator"
  },
  {
    type = "technology",
    name = "electric-energy-accumulators-2",
    icon = "__mopower__/graphics/icons/adv-accumulator.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "adv-accumulator"
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
  }
}
)