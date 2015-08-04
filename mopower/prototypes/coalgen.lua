data:extend(
{
	{
		type = "accumulator",
		name = "basic-coalgen",
		icon = "__base__/graphics/icons/stone-furnace.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "basic-coalgen"},
		max_health = 300,
		corpse = "medium-remnants",
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-0.8, -1}, {0.8, 1}},
		energy_source =
		{
		  type = "electric",
		  buffer_capacity = "100MJ",
		  usage_priority = "primary-output",
		  input_flow_limit = "0kW",
		  output_flow_limit = "500kW"
		},
		picture =
		{
			filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
			priority = "extra-high",
			width = 81,
			height = 64,
			shift = {0.5, 0.05 }
		},
		charge_animation =
		{
			filename = "__base__/graphics/entity/stone-furnace/stone-furnace.png",
			priority = "extra-high",
			width = 81,
			height = 64,
			frame_count = 1,
			shift = {0.5, 0.05 }
		},
		charge_cooldown = 30,
		charge_light = {intensity = 0, size = 0},
		discharge_animation =
		{
			filename = "__mopower__/graphics/coalgen/coalgenrunning.png",
			priority = "extra-high",
			width = 81,
			height = 64,
			frame_count = 12,
			shift = {0.5, 0.05}
		},
		discharge_cooldown = 60,
		discharge_light = {intensity = 0.7, size = 7},
	},
	{
		type = "item",
		name = "basic-coalgen",
		icon = "__base__/graphics/icons/stone-furnace.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "e[accumulator]-a[adv-accumulator]",
		place_result = "basic-coalgen",
		stack_size = 32
	},
	{
		type = "container",
		name = "fuel-storage",
		icon = "__base__/graphics/icons/wooden-chest.png",
		flags = {"placeable-neutral", "player-creation","placeable-off-grid"},
		minable = {hardness = 0.2, mining_time = 1},
		max_health = 100000,
		corpse = "small-remnants",
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		inventory_size = 4,
		open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
		close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
		picture =
		{
		  filename = "__mopower__/graphics/empty_dot.png",
		  priority = "extra-high",
		  width = 1,
		  height = 1
		}
	},
	{
		type = "item",
		name = "fuel-storage",
		icon = "__base__/graphics/icons/wooden-chest.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "e[accumulator]-a[adv-accumulator]",
		place_result = "fuel-storage",
		stack_size = 32
	},
  {
    type = "recipe",
    name = "basic-coalgen",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"battery", 2},
	  {"steel-plate",20},
	  {"copper-plate",40},
	  {"iron-plate",30}
    },
    result = "basic-coalgen"
  },
  {
    type = "technology",
    name = "thermal-power",
    icon = "__base__/graphics/icons/stone-furnace.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "basic-coalgen"
      }
    },
    prerequisites = {"battery"},
    unit =
    {
      count = 70,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "a-h-c",
  }
})