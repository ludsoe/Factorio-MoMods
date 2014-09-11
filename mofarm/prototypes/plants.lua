data:extend(
{
 {
    type = "resource",
    name = "greenleaf-ore",
    icon = "__mofarm__/graphics/icons/greenleaf-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-d",
    minable =
    {
      hardness = 0.1,
      mining_particle = "stone-particle",
      mining_time = 8,
      result = "greenleaf"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    stage_counts = {8, 7, 6, 5, 4, 3, 2, 1},
    stages =
    {
      filename = "__mofarm__/graphics/greenleaf/greenleaf-ore.png",
      priority = "extra-high",
      frame_width = 38,
      frame_height = 38,
      frame_count = 4,
      direction_count = 8
    },
    map_color = {r=0, g=0.6, b=0}
  },
  {
    type = "item",
    name = "greenleaf",
    icon = "__mofarm__/graphics/icons/greenleaf-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "h",
    stack_size = 64
  },
  {
    type = "capsule",
    name = "salad",
    icon = "__mofarm__/graphics/icons/greenleaf-ore.png",
    flags = {"goes-to-quickbar"},
    subgroup = "raw-resource",
	fuel_value = "3MJ",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects = 
              {
                type = "damage",
                damage = {type = "physical", amount = -30}
              }
            }
          }
        }
      }
    },
    order = "f-e-a",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "salad",
    enabled = "true",
    ingredients =
    {
      {"greenleaf", 2}
    },
    result = "salad"
  }
}
)