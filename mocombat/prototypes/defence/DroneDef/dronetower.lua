data:extend(
{
 {
    type = "smart-container",
    name = "combat-roboport-smart",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "combat-roboport"},
	order="a",
	subgroup="drone-combat",
    max_health = 600,
	dying_explosion = "medium-explosion",
    corpse = "big-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    inventory_size = 6,
    picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base.png",
      width = 143,
      height = 135,
      shift = {0.5, 0.25}
    },
    connection_point =
    {
      shadow =
      {
        red = {0.7, -0.3},
        green = {0.7, -0.3}
      },
      wire =
      {
        red = {0.3, -0.8},
        green = {0.3, -0.8}
      }
    }
  },
  {
    type = "item",
    name = "combat-roboport",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar"},
	order="a",
	subgroup="drone-combat",
    place_result = "combat-roboport-smart",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "combat-roboport",
	enabled = "false",
    energy_required = 10,
    ingredients =
    {
      {"steel-plate", 100},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 60}
    },
    result = "combat-roboport"
  }
}
)
