data:extend(
{
  {
    type = "electric-turret",
    name = "tesla-turret",
    icon = "__mocombat__/graphics/icons/tesla-turret.png",
    flags = { "placeable-player", "player-creation"},
    minable = { mining_time = 0.5, result = "tesla-turret" },
    max_health = 600,
    corpse = "small-remnants",
    collision_box = {{ -1.4, -0.4}, {1.4, 1.4}},
    selection_box = {{ -1.4, -0.4}, {1.4, 1.4}},
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    dying_explosion = "medium-explosion",
    folding_speed = 0.05,
	resistances =
    {
      {
        type = "laser",
        percent = 70
      },
	  {
		type = "electric",
		percent = 100
	  }
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "2MJ",
      input_flow_limit = "1200kW",
      drain = "20kW",
      usage_priority = "primary-input"
    },
    folded_animation =
    {
      layers =
      {
        laser_turret_extension{frame_count=1, line_length = 1},
        laser_turret_extension_shadow{frame_count=1, line_length=1},
        laser_turret_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        laser_turret_extension{},
        laser_turret_extension_shadow{},
        laser_turret_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
          line_length = 8,
          width = 68,
          height = 68,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          shift = {0.0625, -1}
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
          line_length = 8,
          width = 54,
          height = 44,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {0.0625, -1.3125},
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
          line_length = 8,
          width = 88,
          height = 52,
          frame_count = 1,
          axially_symmetrical = false,
          direction_count = 64,
          draw_as_shadow = true,
          shift = {1.59375, 0}
        }
      }
    },
    folding_animation = 
    {
      layers =
      {
        laser_turret_extension{run_mode = "backward"},
        laser_turret_extension_shadow{run_mode = "backward"},
        laser_turret_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base.png",
          priority = "high",
          width = 98,
          height = 82,
          axially_symmetrical = false,
          direction_count = 1,
          shift = { 0.109375, 0.03125 }
        },
        {
          filename = "__base__/graphics/entity/laser-turret/laser-turret-base-mask.png",
          line_length = 1,
          width = 54,
          height = 46,
          frame_count = 1,
          axially_symmetrical = false,
          apply_runtime_tint = true,
          direction_count = 1,
          shift = {0.046875, -0.109375},
        },
      }
    },
    attack_parameters =
    {
	  type = "projectile",
      ammo_category = "electric",
      cooldown = 200,
      projectile_creation_distance = 0.6,
      range = 25,
	  sound =
      {
        {
          filename = "__mocombat__/sound/tesla_tower_pew.ogg",
          volume = 0.5
        }
      },
	  ammo_type =
		{
			type = "projectile",
			category = "electric",
			energy_consumption = "200KJ",
			speed = 1,
			action = 
			{
				{
					type = "area",
					perimeter = 25,
					force = "enemy",
					action_delivery =
					{
						{
							type = "instant",
							target_effects =
							{
								type = "nested-result",
								action =
								{
									{
										type = "line",
										range = 25,
										width = 1.5,

										source_effects =
										{
											type = "create-entity",
											entity_name = "lightning-bolt"
										},
										action_delivery =
										{
											type = "instant",
											target_effects =
											{
												type = "damage",
												damage = { amount = 50, type="electric"}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}  
    }
  },
  {
    type = "explosion",
    name = "lightning-bolt",
    flags = {"not-on-map"},
    animation_speed = 3,
    rotate = true,
    beam = true,
    animations =
    {
	  {
        filename = "__mocombat__/graphics/defenses/tesla/zap.png",
        priority = "extra-high",
        width = 50,
        height = 50,
        frame_count = 6,
      },
      {
        filename = "__mocombat__/graphics/defenses/tesla/zap2.png",
        priority = "extra-high",
        width = 50,
        height = 50,
        frame_count = 6,
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
  },
  {
    type = "item",
    name = "tesla-turret",
    icon = "__mocombat__/graphics/icons/tesla-turret.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-b[tesla-turret]",
    place_result = "tesla-turret",
    stack_size = 8
  },
  {
    type = "recipe",
    name = "tesla-turret",
    enabled = "false",
    energy_required = 10,
    ingredients =
    {
      {"processing-unit", 10},
      {"steel-plate", 40},
      {"laser-turret", 4}
    },
    result = "tesla-turret"
  }
}
)
