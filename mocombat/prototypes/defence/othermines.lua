data:extend(
{
  {
    type = "item",
    name = "poison-landmine",
    icon = "__mocombat__/graphics/icons/poison-landmine.png",
    flags = {"goes-to-quickbar"},
	damage_radius = 5,
    subgroup = "gun",
    order = "f[land-mine]",
    place_result = "poison-landmine",
    stack_size = 20,
	trigger_radius = 1
  },
  {
    type = "land-mine",
    name = "poison-landmine",
    icon = "__mocombat__/graphics/icons/poison-landmine.png",
    flags =
    {
      "placeable-player",
      "player-creation",
      "placeable-off-grid"
    },
    minable = {mining_time = 1, result = "poison-landmine"},
    max_health = 15,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-gunshot",
    picture_safe =
    {
      filename = "__mocombat__/graphics/defenses/mines/poison-safe.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__mocombat__/graphics/defenses/mines/poison-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 2.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "poison-cloud"
        }
      }
    },
  },
  {
    type = "recipe",
    name = "poison-landmine",
    enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 2},
	  {"poison-capsule", 2}
	},
    result = "poison-landmine",
    result_count = 4
  }
}
)
