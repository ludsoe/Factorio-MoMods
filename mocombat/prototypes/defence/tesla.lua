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
    dying_explosion = "huge-explosion",
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
    folded_animation = (function()
                          local res = util.table.deepcopy(laser_turret_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
    preparing_animation = laser_turret_extension,
    prepared_animation =
    {
      filename = "__base__/graphics/entity/laser-turret/laser-turret.png",
      priority = "medium",
      width = 131,
      height = 72,
      direction_count = 64,
      frame_count = 1,
      line_length = 8,
      axially_symmetrical = false,
      shift = {1.328125, -0.375}
    },
    folding_animation = (function()
                          local res = util.table.deepcopy(laser_turret_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
    base_picture =
    {
      filename = "__mocombat__/graphics/defenses/tesla-turret/base.png",
      priority = "high",
      width = 43,
      height = 28,
      shift = { 0.109375, 0.03125 }
    },
    attack_parameters =
    {
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
