data:extend({
  {
    type = "technology",
    name = "logistic-robot-speed-6",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "0.75"
      }
    },
    prerequisites = {
      "logistic-robot-speed-5"
    },
    unit = {
      count = 600,
      ingredients = {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-7",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "1.4"
      }
    },
    prerequisites = {
      "logistic-robot-speed-6"
    },
    unit = {
      count = 1200,
      ingredients = {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "logistic-robot-speed-8",
    icon = "__base__/graphics/technology/logistic-robot-speed.png",
    effects = {
      {
        type = "logistic-robot-speed",
        modifier = "2.4"
      }
    },
    prerequisites = {
      "logistic-robot-speed-7"
    },
    unit = {
      count = 2400,
      ingredients = {
        {"alien-science-pack", 1},
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1}
      },
      time = 60
    },
    upgrade = "true",
    order = "c-k-f-e"
  },
  {
    type = "technology",
    name = "extended-ghosts",
    icon = "__base__/graphics/technology/automated-construction.png",
    effects =
    {
      {
        type = "ghost-time-to-live",
        modifier = 60 * 60 * 10
      }
    },
    prerequisites = {"automated-construction"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "c-k-b",
  }
})