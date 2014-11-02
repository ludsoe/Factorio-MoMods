data:extend(
{
{
    type = "fluid",
    name = "steam",
    default_temperature = 150,
    max_temperature = 150,
    heat_capacity = "2KJ",
    base_color = {r=0, g=0.34, b=0.6},
    flow_color = {r=0.7, g=0.7, b=0.7},
    icon = "__base__/graphics/icons/fluid/water.png",
    order = "steam",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.8
  },
  {
    type = "technology",
    name = "nuclear-power-generation",
    icon = "__mopower__/graphics/icons/uranium-depleted.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "uranium-refinement"
      },
	  {
        type = "unlock-recipe",
        recipe = "uranium-reaction"
      },
	  {
        type = "unlock-recipe",
        recipe = "uranium-disposal"
      },
	  {
        type = "unlock-recipe",
        recipe = "nuclear-reactor"
      },
	  {
        type = "unlock-recipe",
        recipe = "uranium-disposal"
      }
    },
    prerequisites = {"electric-energy-accumulators-1"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2},
		{"science-pack-3", 2},
		{"alien-science-pack", 1}
      },
      time = 20
    },
    order = "z",
  },
  {
    type = "noise-layer",
    name = "nuclear-ores"
  },
  {
    type = "autoplace-control",
    name = "nuclear-ores",
    richness = true,
    order = "z"
  },
  {
    type = "recipe-category",
    name="nuclear-power",
  },
  {
    type = "recipe-category",
    name="uranium-refine",
  },
  {
    type = "item-group",
    name = "nuclear-power",
    order = "z",
    inventory_order = "z",
    icon = "__mopower__/graphics/icons/ne-icon.png",
  },
  {
    type = "item-subgroup",
    name = "nuclear-resouces",
    group = "nuclear-power",
    order = "02"
  },
  {
    type = "item-subgroup",
    name = "nuclear-buildings",
    group = "nuclear-power",
    order = "01"
  }
}
)

require "disposalplant"
require "reactor"
require "uranium"