local ControlTower = {
	filename = "__base__/graphics/entity/steel-furnace/steel-furnace-idle.png",
	priority = "extra-high",
	width = 140,
	height = 76,
	frame_count = 1,
	shift = {1, 0}--	shift = {0.5, 0}
}

data:extend({
{
    type = "accumulator",
    name = "mining-drone-controller",
    icon = "__moindustry__/graphics/icons/miningdrone.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "mining-drone-controller"},
    max_health = 1200,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1MJ",
      usage_priority = "secondary-input",
      input_flow_limit = "1MJ",
      output_flow_limit = "0kW"
    },
    picture = ControlTower,
    charge_animation = ControlTower,
    charge_cooldown = 30,
    charge_light = {intensity = 0, size = 0},
    discharge_animation = ControlTower,
    discharge_cooldown = 0,
    discharge_light = {intensity = 0, size = 0}
  },
  {
    type = "item",
    name = "mining-drone-controller",
    icon = "__moindustry__/graphics/icons/miningdrone.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "c[signal]-a[miningcontrol]",
    place_result = "mining-drone-controller",
    stack_size = 40
  },
  {
    type = "recipe",
    name = "mining-drone-controller",
	enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 50},
      {"advanced-circuit", 50}
    },
    result = "mining-drone-controller"
  },
{
    type = "technology",
    name = "construction-drone-mining",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mining-drone-controller"
      }
    },
    prerequisites = {
      "construction-robotics"
    },
    unit = {
      count = 25,
      ingredients = {
        {"science-pack-1", 4},
        {"science-pack-2", 3},
        {"science-pack-3", 1},
      },
      time = 50
    },
    order = "c-k-c",
  }
})