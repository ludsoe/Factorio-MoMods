data:extend(
{
  {
    type = "technology",
    name = "bfg-weapon",
    icon = "__mocombat__/graphics/icons/BFG9000.png",
    effects =
    {

    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 40
    },
    order = "e-a-c"
  }
}
)
