data:extend(
{
	{
		type = "container",
		name = "death-chest",
		icon = "__base__/graphics/icons/wooden-chest.png",
		flags = {"placeable-neutral", "player-creation","placeable-off-grid"},
		minable = {hardness = 0.2, mining_time = 0.5},
		max_health = 100000,
		corpse = "small-remnants",
		collision_box = {{0, 0}, {0, 0}}, --No collisons.... Might jam trains and cause issues....
		collision_mask = {"ghost-layer"},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		inventory_size = 100,
		open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
		close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
		picture =
		{
		  filename = "__mocombat__/graphics/defenses/death-chest/death-chest.png",
		  priority = "extra-high",
		  width = 38,
		  height = 32
		},
		subgroup = "energy",
		order = "e[accumulator]-a[adv-accumulator]",
		resistances = {
			{type = "electric",percent = 100},
			{type = "physical",percent = 100},
			{type = "poison",percent = 100},
			{type = "explosion",percent = 100},
			{type = "fire",percent = 100},
			{type = "laser",percent = 100},
			{type = "acid",percent = 100},
			{type = "impact",percent = 100}
		},
	}
}
)
