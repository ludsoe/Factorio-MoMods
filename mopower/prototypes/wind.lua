data:extend(
{
  {
    type = "accumulator",
    name = "wind-turbine",
    icon = "__mopower__/graphics/icons/windturbine.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "wind-turbine"},
    max_health = 250,
    corpse = "medium-remnants",
    --collision_box = {{-0.9, 0}, {0.9, 0.9}},
	collision_box = {{-0.95, 0}, {0.5, 0.5}},
	selection_box = {{-0.95, 0}, {0.95, 1.1}},
   --selection_box = {{-0.95, 0}, {0.95, 0.95}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "600kW",
      usage_priority = "primary-output",
      input_flow_limit = "0kW",
      output_flow_limit = "600kW"
    },
    picture =
    {
      filename = "__mopower__/graphics/turbine/idle.png",
      priority = "extra-high",
      width = 66,
      height = 139,
      shift = {0, -1.1}
    },
    charge_animation =
    {
      filename = "__mopower__/graphics/turbine/spin.png",
      width = 66,
      height = 139,
      line_length = 6,
      frame_count = 6,
      shift = {0, -1.1},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0, size = 0},
    discharge_animation =
    {
      filename = "__mopower__/graphics/turbine/spin.png",
      width = 66,
      height = 139,
      line_length = 6,
      frame_count = 6,
      shift = {0, -1.1},
      animation_speed = 0.5
    },
    discharge_cooldown = 0,
    discharge_light = {intensity = 0, size = 0}
  },
  {
    type = "item",
    name = "wind-turbine",
    icon = "__mopower__/graphics/icons/windturbine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "e[accumulator]-a[basic-accumulator]",
    place_result = "wind-turbine",
    stack_size = 32
  },
  {
    type = "recipe",
    name = "wind-turbine",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
	  --{"iron-plate",1}
      {"iron-gear-wheel", 10},
      {"steel-plate", 10},
      {"electronic-circuit", 5}
    },
    result = "wind-turbine"
  },
  {
    type = "technology",
    name = "windpower",
    icon = "__mopower__/graphics/technology/windturbine.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "wind-turbine"
      }
    },
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count = 150,
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