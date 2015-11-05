data:extend(
{
  {
    type = "electric-turret",
    name = "tesla-turret",
    icon = "__mocombat__/graphics/icons/tesla-turret.png",
    flags = { "placeable-player", "player-creation"},
    minable = { mining_time = 0.5, result = "tesla-turret" },
    max_health = 2000,
    corpse = "small-remnants",
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
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
	  type = "beam",
      ammo_category = "combat-robot-beam",
      cooldown = 100,
      range = 30,
      projectile_creation_distance = 0.6,
	  sound =
      {
        {
          filename = "__mocombat__/sound/tesla_tower_pew.ogg",
          volume = 0.5
        }
      },
	  ammo_type =
		{
			category = "combat-robot-beam",
			action = 
			{
				{
					type = "area",
					perimeter = 40,
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
									  type = "direct",
									  action_delivery =
									  {
										type = "beam",
										beam = "lightning-bolt",
										max_length = 50,
										duration = 40,
										source_offset = {0.15, -0.5},
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
	type = "beam",
    name = "lightning-bolt",
    flags = {"not-on-map"},
    width = 30,
    damage_interval = 20,
    working_sound =
    {
      {
        filename = "__base__/sound/fight/electric-beam.ogg",
        volume = 0.7
      }
    },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = { amount = 30, type = "electric"}
          }
        }
      }
    },
    head =
    {
      filename = "__base__/graphics/entity/beam/beam-head.png",
      line_length = 16,
      width = 45,
      height = 39,
      frame_count = 16,
      animation_speed = 0.5,
      blend_mode = beam_blend_mode,
    },
    tail =
    {
      filename = "__base__/graphics/entity/beam/beam-tail.png",
      line_length = 16,
      width = 45,
      height = 39,
      frame_count = 16,
      blend_mode = beam_blend_mode,
    },
    body =
    {
      {
        filename = "__base__/graphics/entity/beam/beam-body-1.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-2.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-3.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-4.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-5.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
      {
        filename = "__base__/graphics/entity/beam/beam-body-6.png",
        line_length = 16,
        width = 45,
        height = 39,
        frame_count = 16,
        blend_mode = beam_blend_mode,
      },
    }
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
