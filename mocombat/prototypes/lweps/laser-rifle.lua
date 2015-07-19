data:extend(
{
	{
		type = "ammo-category",
		name = "laser-combat-player"
	},
	{
		type = "gun",
		name = "laser-rifle",
		icon = "__base__/graphics/icons/rocket-launcher.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "d[laser-rifle]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "laser-combat-player",
			movement_slow_down_factor = 0.3,
			cooldown = 20,
			projectile_creation_distance = 0.6,
			range = 25,
			sound =
			{
				{
					filename = "__base__/sound/fight/old/laser.ogg",
					volume = 0.3
				}
			}
		},
		stack_size = 4
	},
	{
		type = "ammo",
		name = "laser-cell",
		icon = "__base__/graphics/icons/battery.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "laser-combat-player",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "blue-laser",
			  starting_speed = 0.1,
			  source_effects =
			  {
				type = "create-entity",
				entity_name = "explosion-gunshot"
			  }
			}
		  }
		},
		magazine_size = 20,
		subgroup = "ammo",
		order = "d[laser-rifle]-a[basic]",
		stack_size = 80
	},
	{
		type = "recipe",
		name = "laser-rifle",
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"iron-plate", 30},
			{"iron-gear-wheel", 5},
			{"electronic-circuit", 15},
			{"battery", 8}
		},
		result = "laser-rifle"
	},
	{
		type = "recipe",
		name = "laser-cell",
		enabled = "false",
		energy_required = 3,
		ingredients =
		{
			{"battery", 2}
		},
		result = "laser-cell",
		result_count = 4
	},
	{
		type = "technology",
		name = "lasercombat",
		icon = "__base__/graphics/technology/military.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "laser-rifle"
			},
			{
				type = "unlock-recipe",
				recipe = "laser-cell"
			}
		},
		prerequisites = {"military-3"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"alien-science-pack", 1}
			},
			time = 40
		},
		order = "e-a-c"
	},
	{
		type = "technology",
		name = "laser-combat-damage-1",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-combat-player",
				modifier = "0.1"
			}
		},
		prerequisites = {"lasercombat"},
		unit =
		{
		count = 80,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		},
		time = 30
		},
		upgrade = "true",
		order = "e-l-a"
	},
	{
		type = "technology",
		name = "laser-combat-damage-2",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-combat-player",
				modifier = "0.2"
			}
		},
		prerequisites = {"laser-combat-damage-1"},
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
		upgrade = "true",
		order = "e-l-a"
	},
	{
		type = "technology",
		name = "laser-combat-damage-3",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-combat-player",
				modifier = "0.3"
			}
		},
		prerequisites = {"laser-combat-damage-2"},
		unit =
		{
			count = 180,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		upgrade = "true",
		order = "e-l-a"
	},
	{
		type = "technology",
		name = "laser-combat-damage-4",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "ammo-damage",
				ammo_category = "laser-combat-player",
				modifier = "0.4"
				}
		},
		prerequisites = {"laser-combat-damage-3"},
		unit =
		{
			count = 200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		upgrade = "true",
		order = "e-l-a"
	},
	{
		type = "technology",
		name = "laser-combat-speed-1",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "laser-combat-player",
				modifier = "0.1"
			}
		},
		prerequisites = {"lasercombat"},
		unit =
		{
			count = 50,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		upgrade = "true",
		order = "e-l-g"
	},
	{
		type = "technology",
		name = "laser-combat-speed-2",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "laser-combat-player",
				modifier = "0.1"
			}
		},
		prerequisites = {"laser-combat-speed-1"},
		unit =
		{
			count = 80,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		upgrade = "true",
		order = "e-l-g"
	},
	{
		type = "technology",
		name = "laser-combat-speed-3",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "laser-combat-player",
				modifier = "0.2"
			}
		},
		prerequisites = {"laser-combat-speed-2"},
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
		upgrade = "true",
		order = "e-l-g"
	},
	{
		type = "technology",
		name = "laser-combat-speed-4",
		icon = "__base__/graphics/icons/battery.png",
		effects =
		{
			{
				type = "gun-speed",
				ammo_category = "laser-combat-player",
				modifier = "0.2"
			}
		},
		prerequisites = {"laser-combat-speed-3"},
		unit =
		{
			count = 200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		upgrade = "true",
		order = "e-l-g"
	}
}
)
