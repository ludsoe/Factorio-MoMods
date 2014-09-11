data:extend(
{
  {
    type = "car",
    name = "boat",
    icon = "__motrans__/graphics/icons/boat.png",
    flags = {"pushable", "placeable-neutral", "player-creation","placeable-off-grid", "not-on-map", "not-repairable"},
	collision_mask =
    {
	  "ground-tile"
    },
    minable = {mining_time = 1, result = "boat"},
    max_health = 2000,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "physical",
        percent = 10
      }
    },
    collision_box = {{-0.7, -1}, {0.7, 1}},
    selection_box = {{-0.7, -1}, {0.7, 1}},
    acceleration_per_energy = 0.000002,
    breaking_speed = 0.01,
    burner =
    {
      effectivity = 1,
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1.5},
          slow_down_factor = 0.9,
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5
        }
      }
    },
    consumption = "600kW",
    friction = 0.04,
    light =
    {
      {
        minimum_darkness = 0.3,
        intensity = 0.5,
        size = 40,
      }
    },
    pictures =
    {
      filename = "__motrans__/graphics/entity/boat-sheet.png",
      line_length = 6,
      frame_width = 88,
      frame_height = 83,
      scale=1.4,
      axially_symmetrical = false,
      direction_count = 36
    },
    rotation_speed = 0.008,
    weight = 1500,
    inventory_size = 80
  },
  {
    type = "item",
    name = "boat",
    icon = "__motrans__/graphics/icons/boat.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "f[transport]-e[boat]",
    place_result = "boat",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "boat",
    enabled = "false",
    ingredients =
    {
      {"engine-unit", 8},
      {"iron-plate", 10},
      {"steel-plate", 15}
    },
    result = "boat"
  },
  {
    type = "technology",
    name = "boating",
    icon = "__motrans__/graphics/technology/boating.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "boat"
      },
    },
    prerequisites = {"logistics-2", "engine"},
    unit =
    {
      count = 75,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1}
      },
      time = 20
    },
    order = "e-b"
  }
}
)