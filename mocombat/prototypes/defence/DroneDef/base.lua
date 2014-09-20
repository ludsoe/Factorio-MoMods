data:extend(
{
	{
		type = "item-subgroup",
		name = "drone-combat",
		group = "combat",
		order = "g"
	},
  {
    type = "technology",
    name = "adv-com-drones",
    icon = "__base__/graphics/icons/distractor.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "combat-roboport"
      },
	  {
        type = "unlock-recipe",
        recipe = "drone-orders-player"
      },
	  {
        type = "unlock-recipe",
        recipe = "drone-orders-rangeboost"
      },
	  {
        type = "unlock-recipe",
        recipe = "attack-drone"
      },
	  {
        type = "unlock-recipe",
        recipe = "combat-drone-wagon"
      }
    },
    prerequisites = {"robotics","combat-robotics-2"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    order = "a-h-c",
  }
})

require "drones"
require "dronetower"
require "dronewagon"
require "dronecommandtower"
require "orders"
