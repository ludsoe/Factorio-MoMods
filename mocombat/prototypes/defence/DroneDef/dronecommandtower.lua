data:extend(
{
 {
    type = "smart-container",
    name = "combat-command-tower-smart",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "combat-command-tower"},
	order="a-c",
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
      filename = "__mocombat__/graphics/defenses/combat-command/cmdc.png",
      width = 145,
      height = 110,
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
    name = "combat-command-tower",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"goes-to-quickbar"},
	order="a-b",
	subgroup="drone-combat",
    place_result = "combat-command-tower-smart",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "combat-command-tower",
	enabled = "false",
    energy_required = 4,
    ingredients =
    {
      {"steel-plate", 40},
	  {"combat-roboport",1},
	  {"radar",5}
    },
    result = "combat-command-tower"
  }
}
)
