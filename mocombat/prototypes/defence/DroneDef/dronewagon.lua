data:extend(
{
 {
    type = "cargo-wagon",
    name = "combat-drone-wagon",
    icon = "__mocombat__/graphics/icons/crobowagon.png",
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
	order="a-b",
	subgroup="drone-combat",
    inventory_size = 5,
    minable = {mining_time = 1, result = "combat-drone-wagon"},
    max_health = 1200,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
    selection_box = {{-0.7, -2.5}, {1, 2.5}},
    weight = 1000,
    max_speed = 1.5,
    braking_force = 3,
    friction_force = 0.0015,
    air_resistance = 0.002,
    connection_distance = 3.3,
    joint_distance = 4,
    energy_per_hit_point = 5,
    back_light = rolling_stock_back_light(),
    stand_by_light = rolling_stock_stand_by_light(),
    pictures =
    {
      priority = "very-low",
      width = 285,
      height = 218,
      axially_symmetrical = false,
      back_equals_front = true,
      direction_count = 128,
      filenames =
      {
        "__mocombat__/graphics/defenses/combat-drone-wagon/1.png",
        "__mocombat__/graphics/defenses/combat-drone-wagon/2.png",
        "__mocombat__/graphics/defenses/combat-drone-wagon/3.png",
        "__mocombat__/graphics/defenses/combat-drone-wagon/4.png"
      },
      line_length = 4,
      lines_per_file = 8,
      shift={0.7, -0.45}
    },
    rail_category = "regular",
    drive_over_tie_trigger = drive_over_tie(),
    tie_distance = 50,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.5
      },
      match_volume_to_activity = true,
    },
    crash_trigger = crash_trigger(),
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    sound_minimum_speed = 0.5;
  },
  {
    type = "item",
    name = "combat-drone-wagon",
    icon = "__mocombat__/graphics/icons/crobowagon.png",
    flags = {"goes-to-quickbar"},
	order="a-b",
	subgroup="drone-combat",
    place_result = "combat-drone-wagon",
    stack_size = 5
  },
  {
    type = "recipe",
    name = "combat-drone-wagon",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"combat-roboport", 1},
	  {"cargo-wagon",1}
    },
    result = "combat-drone-wagon"
  }
}
)
