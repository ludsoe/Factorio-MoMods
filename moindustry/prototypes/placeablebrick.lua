local BrickImage = {
	filename = "__moindustry__/graphics/stone-brick.png",
	priority = "extra-high",
	width = 32,
	height = 32,
	scale = 0.8
}

data:extend({
{
    type = "wall",
    name = "placed-stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    flags = {"placeable-neutral", "player-creation","placeable-off-grid"},
	collision_mask = {"item-layer"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "stone-brick"},
    max_health = 60,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    pictures =
    {
      single = BrickImage,
      straight_vertical = BrickImage,
      straight_vertical_under_ending = BrickImage,
      straight_horizontal = BrickImage,
      corner_right_up = BrickImage,
      corner_right_down = BrickImage,
      corner_left_down = BrickImage,
      corner_left_up = BrickImage,
      t_up = BrickImage,
      t_down = BrickImage,
      t_right = BrickImage,
      t_left = BrickImage,
      cross = BrickImage,
      ending_up = BrickImage,
      ending_down = BrickImage,
      ending_right = BrickImage,
      ending_left = BrickImage
    }
  }
})