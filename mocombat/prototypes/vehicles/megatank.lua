data:extend({
  {
    type = "ammo-category",
    name = "mega-cannon-shell"
  },
{
    type = "car",
    name = "mega-tank",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"pushable", "placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = "mega-tank"},
    max_health = 6000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 0.015,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 20,
        percent = 50
      },
      {
        type = "impact",
        percent = 100
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 50
      },
      {
        type = "acid",
        decrease = 15,
        percent = 60
      }
    },
    collision_box = {{-2.7, -3.9}, {2.7, 3.9}},
    selection_box = {{-2.7, -3.9}, {2.7, 3.9}},
    effectivity = 0.6,
    braking_power = "400kW",
    burner =
    {
      effectivity = 0.75,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 4.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "1800kW",
    terrain_friction_modifier = 0.2,
    friction = 0.003,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6
      }
    },
    animation =
    {
      layers =
      {
        {
          width = 139,
          height = 110,
		  scale = 3,
          frame_count = 2,
          direction_count = 64,
          shift = {-0.421875, -0.84375},
          animation_speed = 8,
          max_advance = 1,
          stripes =
          {
            {
             filename = "__base__/graphics/entity/tank/base-1.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-2.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-3.png",
             width_in_frames = 2,
             height_in_frames = 16,
            },
            {
             filename = "__base__/graphics/entity/tank/base-4.png",
             width_in_frames = 2,
             height_in_frames = 16,
            }
          }
        },
        {
          width = 109,
          height = 88,
		  scale = 3,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.421875, -1.96875},
          max_advance = 1,
          line_length = 2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/tank/base-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/base-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22,
            },
            {
              filename = "__base__/graphics/entity/tank/base-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20,
            },
          })
        },
        {
          width = 154,
          height = 99,
		  scale = 3,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {1.78125, 0.984375},
          max_advance = 1,
          stripes = util.multiplystripes(2,
          {
           {
            filename = "__base__/graphics/entity/tank/base-shadow-1.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-2.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-3.png",
            width_in_frames = 1,
            height_in_frames = 16,
           },
           {
            filename = "__base__/graphics/entity/tank/base-shadow-4.png",
            width_in_frames = 1,
            height_in_frames = 16,
           }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/tank/turret.png",
          line_length = 8,
          width = 92,
          height = 69,
		  scale = 3,
          frame_count = 1,
          direction_count = 64,
          shift = {-0.46875, -3.23436},
          animation_speed = 8,
        },
        {
          filename = "__base__/graphics/entity/tank/turret-mask.png",
          line_length = 8,
          width = 38,
          height = 29,
		  scale = 3,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = {-0.46875, -3.70314},
        },
        {
          filename = "__base__/graphics/entity/tank/turret-shadow.png",
          line_length = 8,
          width = 95,
          height = 67,
		  scale = 3,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {5.10936, 1.921875},
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    stop_trigger_speed = 0.2,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.6
      },
    },
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    sound_minimum_speed = 0.08;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/tank-engine.ogg",
        volume = 0.8
      },
      activate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-start.ogg",
        volume = 0.8
      },
      deactivate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-stop.ogg",
        volume = 0.8
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.001,
    tank_driving = true,
    weight = 60000,
    inventory_size = 120,
    guns = { "mega-tank-cannon", "tank-machine-gun" },
  },
  {
    type = "item",
    name = "mega-tank",
    icon = "__base__/graphics/icons/tank.png",
    flags = {"goes-to-quickbar"},
    subgroup = "transport",
    order = "b[personal-transport]-b[mega-tank]",
    place_result = "mega-tank",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "mega-tank",
    enabled = false,
    ingredients =
    {
      {"engine-unit", 200},
      {"steel-plate", 500},
      {"advanced-circuit", 100},
	  {"alien-artifact", 400}
    },
    result = "mega-tank"
  },
  {
    type = "gun",
    name = "mega-tank-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon-mega]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "mega-cannon-shell",
      cooldown = 90,
      movement_slow_down_factor = 0,
      projectile_creation_distance = 4.8,
      projectile_center = {-0.46875, -0.23436},
      range = 75,
      sound =
      {
        {
          filename = "__base__/sound/fight/tank-cannon.ogg",
          volume = 3.0
        }
      },
    },
    stack_size = 5
  }
})

data:extend({
	{
		type = "projectile",
		name = "mega-cannon-projectile",
		flags = {"not-on-map"},
		collision_box = {{-0.15, -3.3}, {0.15, 3.3}},
		acceleration = 0,
		direction_only = true,
		piercing_damage = 500,
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
				damage = { amount = 1000 , type = "physical"}
			  },
			  {
				type = "damage",
				damage = { amount = 500 , type = "explosion"}
			  }
			}
		  }
		},
		final_action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				entity_name = "small-scorchmark",
				check_buildability = true
			  }
			}
		  }
		},
		animation =
		{
		  filename = "__base__/graphics/entity/bullet/bullet.png",
		  frame_count = 1,
		  width = 3,
		  height = 50,
		  scale = 3,
		  priority = "high"
		},
	  },	
})


function GenerateAmmo(Data)
	data:extend({
	  {
		type = "ammo",
		name = Data.Name,
		icon = "__base__/graphics/icons/cannon-shell.png",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
		  category = "mega-cannon-shell",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = Data.Projectile,
			  starting_speed = 1,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = Data.Range,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "explosion-gunshot"
			  },
			}
		  },
		},
		subgroup = "ammo",
		order = "d[cannon-shell]-a[basic]",
		stack_size = Data.StackSize
	  },
	  {
		type = "recipe",
		name = Data.Name,
		enabled = false,
		energy_required = 8,
		ingredients = Data.Recipe,
		result = Data.Name
	  }
	})
end

GenerateAmmo({
	Name = "mega-cannon-shell",
	Projectile = "mega-cannon-projectile",
	StackSize = 50,
	Range = 60,
	Recipe = {{"steel-plate", 40},{"plastic-bar", 20},{"explosives", 10},{"alien-artifact", 1}}
})

data:extend({
{
    type = "technology",
    name = "mega-tanks",
    icon = "__base__/graphics/technology/tanks.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mega-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "mega-cannon-shell"
      }
    },
    prerequisites = {"tanks", "military-4"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 2},
        {"science-pack-3", 1},
		{"alien-science-pack", 5}
      },
      time = 40
    },
    order = "e-c-c-b"
  }
})




















