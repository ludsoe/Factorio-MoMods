data:extend({
 {
    type = "roboport",
    name = "roborecharger",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "roborecharger"},
    max_health = 300,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "2MW",
      buffer_capacity = "48MJ"
    },
    recharge_minimum = "20MJ",
    energy_usage = "20kW",
    -- per one charge slot
    charging_energy = "200kW",
    logistics_radius = 0,
    construction_radius = 0,
    charge_approach_distance = 8,
    robot_slots_count = 0,
    material_slots_count = 0,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}
    },
    base =
    {
      filename = "__moindustry__/graphics/recharger.png",
      width = 138,
      height = 122,
      shift = {1.3, -1.1}
    },
	base_patch =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "medium",
      width = 1,
      height = 1,
      frame_count = 1,
      shift = {0.03125, 0.203125}
    },
    base_animation =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    door_animation_up =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    door_animation_down =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3
    },
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 1,
    spawn_and_station_height = 0.33,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-radius-visualization.png",
      width = 12,
      height = 12
    },
    construction_radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-construction-radius-visualization.png",
      width = 12,
      height = 12
    },
    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
      },
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      },
    },
  },
  {
    type = "item",
    name = "roborecharger",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar", "hidden"},
    subgroup = "logistic-network",
    order = "c[signal]-a[roborecharger]",
    place_result = "roborecharger",
    stack_size = 15
  },
  {
    type = "recipe",
    name = "roborecharger",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 30},
      {"iron-gear-wheel", 10},
      {"advanced-circuit", 25}
    },
    result = "roborecharger"
  },
 {
    type = "roboport",
    name = "robologisticsextender",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "robologisticsextender"},
    max_health = 300,
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "1MW",
      buffer_capacity = "2MJ"
    },
    recharge_minimum = "1MJ",
    energy_usage = "40kW",
    -- per one charge slot
    charging_energy = "200kW",
    logistics_radius = 25,
    construction_radius = 45,
    charge_approach_distance = 0,
    robot_slots_count = 0,
    material_slots_count = 0,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {0, 0},
	  {0, 0}
    },
    base =
    {
      filename = "__moindustry__/graphics/recharger.png",
      width = 138,
      height = 122,
      shift = {1.3, -1.1}
    },
	base_patch =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "medium",
      width = 1,
      height = 1,
      frame_count = 1,
      shift = {0.03125, 0.203125}
    },
    base_animation =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    door_animation_up =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    door_animation_down =
    {
      filename = "__moindustry__/graphics/empty_dot.png",
      priority = "low",
      width = 1,
      height = 1,
      frame_count = 1,
      animation_speed = 0.5
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
      max_sounds_per_type = 3
    },
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 1,
    spawn_and_station_height = 0.33,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-radius-visualization.png",
      width = 12,
      height = 12
    },
    construction_radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/roboport/roboport-construction-radius-visualization.png",
      width = 12,
      height = 12
    },
    open_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }
      },
    },
    close_door_trigger_effect =
    {
      {
        type = "play-sound",
        sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }
      },
    },
  },
  {
    type = "item",
    name = "robologisticsextender",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "c[signal]-a[robologisticsextender]",
    place_result = "robologisticsextender",
    stack_size = 15
  },
  {
    type = "recipe",
    name = "robologisticsextender",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 30},
      {"iron-gear-wheel", 10},
      {"advanced-circuit", 25}
    },
    result = "robologisticsextender"
  },
{
    type = "technology",
    name = "extended-robonetwork",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "robologisticsextender"
      }
    },
    prerequisites = {
      "construction-robotics",
      "logistic-robotics"
    },
    unit = {
      count = 100,
      ingredients = {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 30
    },
    order = "c-k-c",
  }
})