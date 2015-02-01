
data:extend(
{
	{
		type = "unit",
		name = "small-exploder",
		icon = "__base__/graphics/icons/creeper.png",
		flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
		max_health = 80,
		order="b-b-b",
		resistances = 
		{
			{
				type = "physical",
				decrease = 4,
			}
		},
		healing_per_tick = 0.01,
		collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
		selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
		distraction_cooldown = 300,
		attack_parameters =
		{
			ammo_category = "melee",
			ammo_type =
			{
				category = "biological",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "instant",
						target_effects =
						{
							{
								type = "nested-result",
								action =
								{
									type = "area",
									perimeter = 3.5,
									entity_flags = {"player-creation"},
									action_delivery =
									{
										type = "instant",
										target_effects =
										{
											{
												type = "damage",
												damage = {amount = 200, type = "explosion"}
											},
											{
												type = "create-entity",
												entity_name = "explosion"
											}
										}
									}
								},
							}
						}
					}
				}
			},
			range = 0.5,
			cooldown = 35,
			animation =
			{
				filename = "__mocombat__/graphics/enemys/exploder/attack.png",
				width = 139,
				height = 93,
				frame_count = 11,
				direction_count = 16,
				axially_symmetrical = false,
				shift = {0.84375, -0.3125}
			}
		},
		vision_distance = 30,
		movement_speed = 0.23,
		distance_per_frame = 0.11,
		-- in pu
		pollution_to_join_attack = 400,
		corpse = "small-exploder-corpse",
		dying_sound =
		{
			{
				filename = "__base__/sound/creatures/creeper-death-1.ogg",
				volume = 0.7
			},
			{
				filename = "__base__/sound/creatures/creeper-death-2.ogg",
				volume = 0.7
			},
			{
				filename = "__base__/sound/creatures/creeper-death-3.ogg",
				volume = 0.7
			},
			{
				filename = "__base__/sound/creatures/creeper-death-4.ogg",
				volume = 0.7
			}
		},
		run_animation =
		{
			filename = "__mocombat__/graphics/enemys/exploder/run.png",
			still_frame = 4,
			width = 86,
			height = 59,
			frame_count = 16,
			direction_count = 16,
			shift = {0.359375, -0.15625},
			axially_symmetrical = false
		}
	},
	{
		type = "corpse",
		name = "small-exploder-corpse",
		icon = "__base__/graphics/icons/small-biter-corpse.png",
		selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selectable_in_game = false,
		subgroup="corpses",
		order = "c[corpse]-a[exploder]-a[small]",
		flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
		dying_speed = 0.04,
		final_render_layer = "corpse",
		animation =
		{
			width = 142,
			height = 97,
			frame_count = 17,
			direction_count = 16,
			axially_symetric = false,
			shift = {0.328125, -0.09375},
			stripes =
			{
				{
					filename = "__mocombat__/graphics/enemys/exploder/die-1.png",
					width_in_frames = 9
				},
				{
					filename = "__mocombat__/graphics/enemys/exploder/die-2.png",
					width_in_frames = 8
				}
			},
		},
	}
})
