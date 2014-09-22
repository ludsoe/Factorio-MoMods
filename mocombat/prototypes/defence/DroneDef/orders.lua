data:extend(
{
  {
    type = "item",
    name = "drone-orders-player",
    icon = "__mocombat__/graphics/icons/player.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "drone-combat",
    order = "b-a",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "drone-orders-player",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"advanced-circuit", 5}
    },
    result = "drone-orders-player"
  },
   {
    type = "item",
    name = "drone-orders-rangeboost",
    icon = "__mocombat__/graphics/icons/range.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "drone-combat",
    order = "b-b",
    stack_size = 10
  },
  {
    type = "recipe",
    name = "drone-orders-rangeboost",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"advanced-circuit", 10}
    },
    result = "drone-orders-rangeboost"
  },
  {
    type = "item",
    name = "drone-orders-artifact",
    icon = "__mocombat__/graphics/icons/artifact.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "drone-combat",
    order = "b-c",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "drone-orders-artifact",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"advanced-circuit", 5}
    },
    result = "drone-orders-artifact"
  }
}
)
