data:extend(
{
  {
    type = "ammo",
    name = "depleted-bullet-magazine",
    icon = "__mocombat__/graphics/icons/depleted-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
              type = "create-entity",
              entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-gunshot"
            },
            {
              type = "damage",
              damage = { amount = 8 , type = "armor-piercing"}
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-b[adv-piercing-bullet-magazine]",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "depleted-bullet-magazine",
    enabled = "false",
    energy_required = 6,
    ingredients =
    {
      {"uranium-depleted", 1},
      {"steel-plate", 2}
    },
    result = "depleted-bullet-magazine"
  }
}
)
