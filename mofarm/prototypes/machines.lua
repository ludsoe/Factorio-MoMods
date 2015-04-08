data:extend(
{
  {
    type = "accumulator",
    name = "greenleafplanter",
    icon = "__base__/graphics/icons/basic-accumulator.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "greenleafplanter"},
    max_health = 150,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1200kW",
      usage_priority = "secondary-input",
      input_flow_limit = "300kW",
      output_flow_limit = "0kW"
    },
    picture =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.7, -0.2}
    },
    charge_animation =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-charge-animation.png",
      width = 138,
      height = 135,
      line_length = 8,
      frame_count = 24,
      shift = {0.482, -0.638},
      animation_speed = 0.5
    },
    charge_cooldown = 30,
    charge_light = {intensity = 0, size = 0},
    discharge_animation =
    {
      filename = "__base__/graphics/entity/basic-accumulator/basic-accumulator-discharge-animation.png",
      width = 147,
      height = 128,
      line_length = 8,
      frame_count = 24,
      shift = {0.395, -0.525},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0, size = 0}
  },
  {
    type = "item",
    name = "greenleafplanter",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "farming-machines",
    order = "a[items]-b[iron-chest]",
    place_result = "greenleafplanter",
    stack_size = 64
  },
  {
    type = "recipe",
    name = "greenleafplanter",
	enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {"iron-gear-wheel", 4},
      {"steel-plate", 40},
      {"electronic-circuit", 10}
    },
    result = "greenleafplanter"
  }
}
)