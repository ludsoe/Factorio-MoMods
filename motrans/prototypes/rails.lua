data:extend(
{
	{
		type = "straight-rail",
		name = "straight-rail-bridge",
		icon = "__base__/graphics/icons/straight-rail.png",
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
		minable = {mining_time = 1, result = "straight-rail-bridge"},
		max_health = 100,
		corpse = "straight-rail-remnants",
		collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
		selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
		bending_type = "straight",
		rail_category = "regular",
		pictures = railpictures(),
		collision_mask = {"object-layer"}
	},
  {
    type = "item",
    name = "straight-rail-bridge",
    icon = "__base__/graphics/icons/straight-rail.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "a[train-system]-a[straight-rail]",
    place_result = "straight-rail-bridge",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "straight-rail-bridge",
    enabled = "false",
    ingredients =
    {
      {"straight-rail", 1}
    },
    result = "straight-rail-bridge",
    result_count = 1
  },
  {
    type = "recipe",
    name = "straight-rail-bridge-reverse",
    enabled = "false",
    ingredients =
    {
      {"straight-rail-bridge", 1}
    },
    result = "straight-rail",
    result_count = 1
  }
}
)