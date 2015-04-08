data.mofarm = true

data:extend(
{
  {
    type = "item-group",
    name = "food-production",
    order = "z",
    inventory_order = "z",
    icon = "__base__/graphics/icons/fish.png",
  },
  {
    type = "item-subgroup",
    name = "farming-high-level",
    group = "food-production",
    order = "04"
  },
  {
    type = "item-subgroup",
    name = "farming-med-level",
    group = "food-production",
    order = "03"
  },
  {
    type = "item-subgroup",
    name = "farming-low-level",
    group = "food-production",
    order = "02"
  },
  {
    type = "item-subgroup",
    name = "farming-raw-food",
    group = "food-production",
    order = "012"
  },
  {
    type = "item-subgroup",
    name = "farming-machines",
    group = "food-production",
    order = "01"
  }
}
)

require("prototypes.plants")
require("prototypes.machines")
require("prototypes.misc")
