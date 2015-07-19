data:extend({
	{
		type = "ammo-category",
		name = "bfg-energy-cell"
	},
	{
		type = "explosion",
		name = "bfg-plasma-boom",
		flags = {"not-on-map"},
		animation_speed = 3,
		animations =
		{
			{
				filename = "__mocombat__/graphics/weapons/bfg/explosion-1.png",
				priority = "extra-high",
				width = 64,
				height = 59,
				frame_count = 16
			}
		},
		light = {intensity = 1, size = 20},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			{
			filename = "__mocombat__/sound/bfg_explosion.ogg",
			volume = 0.8
			}
		}
	},
	{
		type = "explosion",
		name = "bfg-barrel-boom",
		flags = {"not-on-map"},
		animation_speed = 3,
		animations =
		{
			{
				filename = "__mocombat__/graphics/weapons/bfg/explosion-1.png",
				priority = "extra-high",
				width = 64,
				height = 59,
				frame_count = 16
			}
		},
		light = {intensity = 1, size = 20},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
	{
		type = "projectile",
		name = "bfg-plasma",
		flags = {"not-on-map"},
		acceleration = 0.005,
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "explosion"
					},
					{
						type = "nested-result",
						action =
						{
							type = "area",
							perimeter = 15,
							action_delivery =
							{	
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = 2000, type = "plasma"}
									},
									{
										type = "create-entity",
										entity_name = "bfg-plasma-boom"
									}
								}
							}
						},
					}
				}
			}
		},
		light = {intensity = 1, size = 10},
		animation =
		{
		  filename = "__mocombat__/graphics/weapons/bfg/plasma.png",
		  frame_count = 1,
		  width = 30,
		  height = 30,
		  priority = "high"
		}
	},
	{
		type = "gun",
		name = "bfg-10k",
		icon = "__mocombat__/graphics/icons/BFG9000.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "d[bfg10k]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bfg-energy-cell",
			movement_slow_down_factor = 0.9,
			cooldown = 60,
			projectile_creation_distance = 0.6,
			range = 70,
			sound =
			{
				{
					filename = "__mocombat__/sound/bfg_shooting_effect.ogg",
					volume = 1
				}
			}
		},
		stack_size = 4
	},
	{
		type = "ammo",
		name = "bfg-ammo",
		icon = "__mocombat__/graphics/icons/battery-equipment.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "bfg-energy-cell",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "bfg-plasma",
			  starting_speed = 0.1,
			  source_effects =
			  {
				type = "create-entity",
				entity_name = "bfg-barrel-boom"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "d[bfg10k]-a[adv]",
		stack_size = 40
	},
	{
		type = "item",
		name = "hvywep-frame",
		icon = "__base__/graphics/icons/space-module-wreck.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[hvywep-frame]",
		stack_size = 20
	},
	{
		type = "item",
		name = "plasma-casing",
		icon = "__base__/graphics/icons/small-pump.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[plasma-casing]",
		stack_size = 124
	},
	{
		type = "item",
		name = "infused-solid-fuel",
		icon = "__mocombat__/graphics/icons/solid-fuel.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "54MJ",
		subgroup = "raw-resource",
		order = "c[infused-solid-fuel]",
		stack_size = 64
	},	
	{
		type = "recipe",
		name = "bfg-10k",
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"hvywep-frame", 1},
			{"processing-unit", 50},
			{"productivity-module-2", 10},
			{"fusion-reactor-equipment", 1}
		},
		result = "bfg-10k"
	},
	{
		type = "recipe",
		name = "bfg-ammo",
		enabled = "false",
		energy_required = 3,
		ingredients =
		{
			{"plasma-casing", 1},
			{"infused-solid-fuel", 8},
			{"processing-unit", 10}
		},
		result = "bfg-ammo"
	},
	{
		type = "recipe",
		name = "hvywep-frame",
		enabled = "false",
		energy_required = 3,
		ingredients =
		{
			{"steel-plate", 50},
			{"processing-unit", 10},
			{"effectivity-module", 5},
			{"plastic-bar", 20}
		},
		result = "hvywep-frame"
	},
	{
		type = "recipe",
		name = "plasma-casing",
		enabled = "false",
		energy_required = 3,
		ingredients =
		{
			{"steel-plate", 20},
			{"iron-plate", 40}
		},
		result = "plasma-casing"
	},
	{
		type = "recipe",
		name = "infused-solid-fuel",
		category = "chemistry",
		energy_required = 1,
		enabled = "false",
		ingredients =
		{
			{type="fluid", name="sulfuric-acid", amount=6},
			{type="item", name="solid-fuel", amount=2}
		},
		results=
		{
			{type="item", name="infused-solid-fuel", amount=1}
		}
	}
})
