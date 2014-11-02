data:extend(
{
{
    type = "resource",
    name = "uranium-ore",
    icon = "__mopower__/graphics/icons/uranium-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-d",
    minable =
    {
      hardness = 0.6,
      mining_particle = "stone-particle",
      mining_time = 4,
      result = "uranium-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace =
    {
      control = "nuclear-ores",
      sharpness = 1,
      richness_multiplier = 2500,
      richness_base = 125,
      size_control_multiplier = 0.01,
      peaks = {
	    {
          influence = 0.20,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.25,
          starting_area_weight_optimal = 1,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = 0.6,
          noise_layer = "nuclear-ores",
          noise_octaves_difference = -1.5,
          noise_persistence = 0.9,
          starting_area_weight_optimal = 0,
          starting_area_weight_range = 0,
          starting_area_weight_max_range = 2,
        },
        {
          influence = -0.4,
          noise_layer = "stone",
          noise_octaves_difference = -3.5,
          noise_persistence = 0.45,
        },
        {
          influence = -0.4,
          max_influence = 0,
          noise_layer = "copper-ore",
          noise_octaves_difference = -3.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.4,
          max_influence = 0,
          noise_layer = "iron-ore",
          noise_octaves_difference = -3.3,
          noise_persistence = 0.45,
        },
        {
          influence = -0.4,
          max_influence = 0,
          noise_layer = "coal",
          noise_octaves_difference = -1.8,
          noise_persistence = 0.45,
        }
      },
    },
    stage_counts = {1000, 600, 400, 200, 100, 50, 20, 1},
    stages =
    {
      filename = "__mopower__/graphics/uranium/uranium-ore.png",
      priority = "extra-high",
      width = 38,
      height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color = {r=0.2, g=0.8, b=0.2}
  },
	{
		type = "item",
		name = "uranium-ore",
		icon = "__mopower__/graphics/icons/uranium-ore.png",
		flags = {"goes-to-quickbar"},
		subgroup = "nuclear-resouces",
		order = "a",
		stack_size = 50
	},
	{
		type = "item",
		name = "uranium-rod",
		icon = "__mopower__/graphics/icons/uranium-rod.png",
		flags = {"goes-to-quickbar"},
		subgroup = "nuclear-resouces",
		order = "a",
		stack_size = 10
	},
	{
		type = "item",
		name = "uranium-depleted",
		icon = "__mopower__/graphics/icons/uranium-depleted.png",
		flags = {"goes-to-quickbar"},
		subgroup = "nuclear-resouces",
		order = "a",
		stack_size = 80
	},
	{
		type = "item",
		name = "uranium-waste",
		icon = "__mopower__/graphics/icons/uranium-waste.png",
		flags = {"goes-to-quickbar"},
		subgroup = "nuclear-resouces",
		order = "a",
		stack_size = 10
	},
  {
    type = "recipe",
    name = "uranium-refinement",
	enabled = "false",
	icon = "__mopower__/graphics/icons/uranium-rod.png",
	category="uranium-refine",
	subgroup = "nuclear-resouces",
    energy_required = 10,
    ingredients =
    {
		{type="item", name="uranium-ore", amount=4}
    },
    results = {
		{type="item", name="uranium-rod", amount=2},
		{type="item", name="uranium-depleted", amount=3}
	},
	main_product= "",
    order = "a"
  }
}
)