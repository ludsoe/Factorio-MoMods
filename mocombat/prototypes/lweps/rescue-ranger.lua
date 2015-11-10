data:extend(
{
	{
		type = "ammo-category",
		name = "ranger-casing"
	},
	{
		type = "projectile",
		name = "ranger-bolt",
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
					type = "nested-result",
					action =
					{
						{
							type = "area",
							perimeter = 2,
							entity_flags = {"player-creation"},
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									type = "damage",
									damage = { amount = -30, type = "nanocloud"}
								}
							}
						},
						{
							type = "area",
							perimeter = 1,
							entity_flags = {"placeable-enemy"},
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									type = "damage",
									damage = { amount = 20, type = "nanocloud"}
								}
							}
						}					
					}
				}
			}
		},
		light = {intensity = 0.5, size = 10},
		animation =
		{
		  filename = "__mocombat__/graphics/weapons/rrbolt.png",
		  frame_count = 1,
		  width = 7,
		  height = 14,
		  priority = "high"
		},
		speed = 0.25
	},
	{
		type = "gun",
		name = "rescue-ranger",
		icon = "__mocombat__/graphics/icons/rescueranger.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "gun",
		order = "d[rescue-ranger]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "ranger-casing",
			movement_slow_down_factor = 0.5,
			cooldown = 50,
			projectile_creation_distance = 0.6,
			range = 40,
			sound =
			{
				{
					filename = "__mocombat__/sound/rescue_ranger_fire.ogg",
					volume = 0.3
				}
			}
		},
		stack_size = 4
	},
	{
    type = "ammo",
    name = "ranger-cart",
    icon = "__mocombat__/graphics/icons/nano-machine-clip.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "ranger-casing",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "ranger-bolt",
          starting_speed = 0.5,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
	magazine_size = 4,
    subgroup = "ammo",
    order = "d[laser-rifle]-a[basic]",
    stack_size = 32
  },
	{
		type = "recipe",
		name = "rescue-ranger",
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"shotgun",1},
			{"iron-plate", 15},
			{"electronic-circuit", 10},
			{"battery", 2}
		},
		result = "rescue-ranger"
	},
	{
		type = "recipe",
		name = "ranger-cart",
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"repair-pack",2},
			{"iron-plate", 5},
			{"electronic-circuit", 1}
		},
		result = "ranger-cart",
		result_count = 4
	}
}
)
