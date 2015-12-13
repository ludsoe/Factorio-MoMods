local ControlTower = {
	filename = "__base__/graphics/entity/steel-furnace/steel-furnace-idle.png",
	priority = "extra-high",
	width = 140,
	height = 76,
	frame_count = 1,
	shift = {1, 0}--	shift = {0.5, 0}
}

local ZeroTable = {{0, 0}, {0, 0}}
local BlankImage = {filename = "__momining__/graphics/empty_dot.png",priority = "low",width = 1,height = 1,frame_count = 1,animation_speed = 0.5}

local MiningPortRange = 12

data:extend({
{
    type = "roboport",
    name = "mining-drone-placer",
    icon = "__momining__/graphics/icons/miningdrone.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "mining-drone-placer"},
    max_health = 1200,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "2MW",
      buffer_capacity = "48MJ"
    },
	
	recharge_minimum = "20MJ",
    energy_usage = "20kW",-- per one charge slot
    charging_energy = "200kW",
    logistics_radius = MiningPortRange,
    construction_radius = MiningPortRange,
    charge_approach_distance = 8,
    robot_slots_count = 1,
    material_slots_count = 0,
    stationing_offset = {0, 0},
    charging_offsets = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},
    base = ControlTower,
	base_patch = BlankImage,
    base_animation = BlankImage,
    door_animation_up = BlankImage,
    door_animation_down = BlankImage,
    recharging_animation = {filename = "__base__/graphics/entity/roboport/roboport-recharging.png", priority = "high",width = 37, height = 35,frame_count = 16,scale = 1.5,animation_speed = 0.5},
    working_sound = {sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },max_sounds_per_type = 3},
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 1,
    spawn_and_station_height = 0.33,
    radius_visualisation_picture = { filename = "__momining__/graphics/roboport-mining-radius-visualization.png",width = 12, height = 12},
    construction_radius_visualisation_picture = {filename = "__momining__/graphics/roboport-mining-radius-visualization.png", width = 12, height = 12 },
    open_door_trigger_effect = {{type = "play-sound", sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }},},
    close_door_trigger_effect = {{type = "play-sound",sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }},},
  },
  {
    type = "roboport",
    name = "mining-drone-roboport",
    icon = "__momining__/graphics/icons/miningdrone.png",
    flags = {"placeable-player", "player-creation"},
	order = "z[hideme]",
    max_health = 1200,
    collision_box = {{-0, -0}, {0, 0}},
    selection_box =  {{0, 0}, {0, 0}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "2MW",
      buffer_capacity = "48MJ"
    },
    recharge_minimum = "20MJ",
    energy_usage = "20kW",-- per one charge slot
    charging_energy = "200kW",
    logistics_radius = 1,
    construction_radius = MiningPortRange,
    charge_approach_distance = 8,
    robot_slots_count = 1,
    material_slots_count = 0,
    stationing_offset = {0, 0},
    charging_offsets = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}},
    base = BlankImage,
	base_patch = BlankImage,
    base_animation = BlankImage,
    door_animation_up = BlankImage,
    door_animation_down = BlankImage,
    recharging_animation = {filename = "__base__/graphics/entity/roboport/roboport-recharging.png", priority = "high",width = 37, height = 35,frame_count = 16,scale = 1.5,animation_speed = 0.5},
    working_sound = {sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },max_sounds_per_type = 3},
    recharging_light = {intensity = 0.4, size = 5},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = -0.1,
    radius_visualisation_picture = { filename = "__base__/graphics/entity/roboport/roboport-radius-visualization.png",width = 12, height = 12},
    construction_radius_visualisation_picture = {filename = "__base__/graphics/entity/roboport/roboport-construction-radius-visualization.png", width = 12, height = 12 },
    open_door_trigger_effect = {{type = "play-sound", sound = { filename = "__base__/sound/roboport-door.ogg", volume = 1.2 }},},
    close_door_trigger_effect = {{type = "play-sound",sound = { filename = "__base__/sound/roboport-door.ogg", volume = 0.75 }},},
  },
  {
    type = "logistic-container",
    name = "mining-drone-dropoff",
    icon = "__base__/graphics/icons/logistic-chest-storage.png",
    flags = {"placeable-player", "player-creation"},
	order = "z[hideme]",
    max_health = 150,
    collision_box = ZeroTable,
    selection_box = ZeroTable,
    inventory_size = 10,
    logistic_mode = "storage",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture = BlankImage,
    circuit_wire_max_distance = 7.5
  },
  {
    type = "container",
    name = "mining-roboport-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"placeable-neutral", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "mining-drone-placer"},
	order = "z[hideme]",
    max_health = 1200,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    inventory_size = 48,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture = ControlTower
  },
  {
    type = "item",
    name = "mining-drone-placer",
    icon = "__momining__/graphics/icons/miningdrone.png",
    flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "c[signal]-a[miningcontrol]",
    place_result = "mining-drone-placer",
    stack_size = 40
  },
  {
    type = "recipe",
    name = "mining-drone-controller",
	enabled = "false",
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 50},
      {"advanced-circuit", 50}
    },
    result = "mining-drone-placer"
  },
{
    type = "technology",
    name = "construction-drone-mining",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mining-drone-controller"
      }
    },
    prerequisites = {
      "construction-robotics"
    },
    unit = {
      count = 25,
      ingredients = {
        {"science-pack-1", 4},
        {"science-pack-2", 3},
        {"science-pack-3", 1},
      },
      time = 50
    },
    order = "c-k-c",
  },
  {
    type = "item",
    name = "mrobot-inventory-space-tester",
    icon = "__momining__/graphics/icons/miningdrone.png",
    flags = {"goes-to-quickbar","hidden"},
    subgroup = "logistic-network",
    order = "c[signal]-a[miningcontrol]",
    place_result = "mining-drone-placer",
    stack_size = 1
  }
})
