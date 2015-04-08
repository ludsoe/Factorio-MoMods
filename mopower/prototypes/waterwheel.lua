data:extend(
{
  {
    type = "electric-pole",
    name = "big-electric-pole-water",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "big-electric-pole-water"},
    max_health = 150,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-2.8, -0.5}, {0.5, 0.5}},
    maximum_wire_distance = 30,
    supply_area_distance = 2,
	collision_mask={"ground-tile"},
    pictures =
    {
      filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole.png",
      priority = "high",
      width = 168,
      height = 165,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {1.6, -1.1}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          green = {1.8, 0},
          red = {3.6, 0}
        },
        wire =
        {
          copper = {0, -3.1},
          green = {-0.6,-3.1},
          red = {0.6,-3.1}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {2.3, -0.3},
          red = {3.8, 0.6}
        },
        wire =
        {
          copper = {-0.08, -3.15},
          green = {-0.55, -3.5},
          red = {0.3, -2.87}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.06},
          green = {3.0, -0.6},
          red = {3.0, 0.8}
        },
        wire =
        {
          copper = {-0.1, -3.1},
          green = {-0.1, -3.55},
          red = {-0.1, -2.8}
        }
      },
      {
        shadow =
        {
          copper = {3.1, 0.2},
          green = {3.8, -0.3},
          red = {2.35, 0.6}
        },
        wire =
        {
          copper = {0, -3.25},
          green = {0.45, -3.55},
          red = {-0.54, -3.0}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "high",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "high",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      priority = "high",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "high",
      width = 224,
      height = 46
    }
  },
  {
    type = "item",
    name = "big-electric-pole-water",
    icon = "__base__/graphics/icons/big-electric-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-c[big-electric-pole]",
    place_result = "big-electric-pole-water",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "mo-water-wheel",
    enabled = "false",
    ingredients =
    {
      {"iron-gear-wheel", 10},
      {"steel-plate", 10},
      {"electronic-circuit", 5}
    },
    result = "mo-water-wheel"
  },
  {
    type = "technology",
    name = "water-wheel-tech",
    icon = "__base__/graphics/technology/electric-energy-distribution.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "big-electric-pole-water"
      },
    },
    prerequisites = {"electric-energy-distribution-1"},
    unit =
    {
      count = 120,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
		{"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-b"
  }
}
)