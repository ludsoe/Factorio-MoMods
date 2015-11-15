function CreateDrone(Data)
	data:extend(
	{
		{
			type = "unit",
			name = Data.Name,
			icon = Data.Icon,
			flags = {"placeable-player", "player-creation", "placeable-off-grid"},
			minable = {hardness = 0.2, mining_time = 0.5, result = Data.Name},
			max_health = Data.Health,
			resistances = Data.Resists,
			order="c",
			subgroup="drone-combat",
			healing_per_tick = 0.01,
			collision_mask = Data.Collisions,
			collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
			selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
			attack_parameters = Data.Attack,
			vision_distance = 30,
			movement_speed = Data.MovementSpeed,
			distance_per_frame = 0.1,
			pollution_to_join_attack = 20000000,
			distraction_cooldown = 300,
			corpse = "small-remnants",
			destroy_action =
			{
			  type = "direct",
			  action_delivery =
			  {
				type = "instant",
				source_effects =
				{
					type = "create-entity",
					entity_name = "explosion"
				}
			  }
			},
			run_animation = Data.RunAnimation,
			working_sound = Data.WorkSound
		},
	  {
		type = "item",
		name = Data.Name,
		icon = Data.Icon,
		flags = {"goes-to-quickbar"},
		order="c",
		subgroup="drone-combat",
		place_result = Data.Name,
		stack_size = 20
	  },
	  {
		type = "recipe",
		name = Data.Name,
		enabled = "false",
		energy_required = 5,
		ingredients = Data.Recipe,
		result = Data.Name
	  }
	}
	)
end


local CombatDroneLazerAttack = {
	type = "projectile",
	ammo_category = "combat-robot-laser",
	cooldown = 20, damage_modifier = 3,
	projectile_center = {0, 0}, projectile_creation_distance = 0.6,
	range = 18,
	ammo_type =
	{
		category = "combat-robot-laser",
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "projectile",
				projectile = "laser",
				starting_speed = 0.3
			}
		}
	},
	sound = { { filename = "__base__/sound/fight/old/laser.ogg", volume = 0.4 } },
	animation =
	{
		filename = "__base__/graphics/entity/combat-robot/distractor.png",
		priority = "high",
		still_frame = 1,
		width = 37,
		height = 34,
		frame_count = 1,
		direction_count = 1,
		shift = {0, 0}
	}
}

local CombatDroneGunAttack = {
  type = "projectile",
  ammo_category = "bullet",
  cooldown = 20,
  projectile_center = {0, 1},
  projectile_creation_distance = 0.6,
  range = 15,
  sound = make_light_gunshot_sounds(),
  ammo_type =
  {
	category = "bullet",
	action =
	{
	  type = "direct",
	  action_delivery =
	  {
		type = "instant",
		source_effects =
		{
		  type = "create-explosion",
		  entity_name = "explosion-gunshot-small"
		},
		target_effects =
		{
		  {
			type = "create-entity",
			entity_name = "explosion-hit"
		  },
		  {
			type = "damage",
			damage = { amount = 5 , type = "physical"}
		  }
		}
	  }
	}
  },
	animation = {
	  width = 102,
	  height = 86,
	  scale=0.3,
	  frame_count = 2,
	  direction_count = 64,
	  shift = {0, -0.05625},
	  animation_speed = 8,
	  max_advance = 0.2,
	  stripes =
	  {
		{filename = "__base__/graphics/entity/car/car-1.png",width_in_frames = 2,height_in_frames = 22,},
		{filename = "__base__/graphics/entity/car/car-2.png",width_in_frames = 2,height_in_frames = 22,},
		{filename = "__base__/graphics/entity/car/car-3.png",width_in_frames = 2,height_in_frames = 20,},
	  }
	}
}

CreateDrone({
	Name = "attack-drone",
	Icon = "__base__/graphics/icons/logistic-robot.png",
	Health = 320,
	Resists = {{type = "physical",percent = 10},{type = "acid",percent = 50},{type = "electric",percent = 90}},
	Attack = CombatDroneLazerAttack,
	MovementSpeed = 0.24,
	Recipe = {{"distractor-capsule", 2},{"flying-robot-frame", 1}},
	Collisions = {"ghost-layer"},
	RunAnimation = {
		filename = "__base__/graphics/entity/combat-robot/distractor.png",
		still_frame = 1,
		width = 37,
		height = 34,
		frame_count = 1,
		priority = "high",
		direction_count = 1,
		shift = {0, 0}
	}
})

CreateDrone({
	Name = "attack-drone-rover",
	Icon = "__base__/graphics/icons/car.png",
	Health = 120,
	Resists = {{type = "physical",percent = 30},{type = "acid",percent = 20},{type = "electric",percent = 90}},
	Attack = CombatDroneGunAttack,
	MovementSpeed = 0.20,
	Recipe = {{"submachine-gun", 1},{"engine-unit", 2},{"iron-plate", 24},{"electronic-circuit", 5}},
	RunAnimation = {layers =
      {
        {
          width = 102,height = 86,scale=0.3,
          frame_count = 2,direction_count = 64,shift = {0, -0.05625},
          animation_speed = 8,max_advance = 0.2,
          stripes =
          {
            {filename = "__base__/graphics/entity/car/car-1.png",width_in_frames = 2,height_in_frames = 22,},
            {filename = "__base__/graphics/entity/car/car-2.png",width_in_frames = 2,height_in_frames = 22,},
			{filename = "__base__/graphics/entity/car/car-3.png",width_in_frames = 2,height_in_frames = 20,},
          }
        },
        {
          width = 100,height = 75,scale=0.3,
          frame_count = 2,apply_runtime_tint = true,
          direction_count = 64,max_advance = 0.2,
          line_length = 2,shift = {0, -0.0515625},
          stripes = util.multiplystripes(2,
          {
            {filename = "__base__/graphics/entity/car/car-mask-1.png",width_in_frames = 1,height_in_frames = 22,},
            {filename = "__base__/graphics/entity/car/car-mask-2.png",width_in_frames = 1,height_in_frames = 22,},
            {filename = "__base__/graphics/entity/car/car-mask-3.png",width_in_frames = 1,height_in_frames = 20,},
          })
        },
        {
          width = 114,height = 76,scale=0.3,
          frame_count = 2,draw_as_shadow = true,
          direction_count = 64,shift = {0.084375, 0.075},max_advance = 0.2,
          stripes = util.multiplystripes(2,
          {
           {filename = "__base__/graphics/entity/car/car-shadow-1.png",width_in_frames = 1,height_in_frames = 22,},
           {filename = "__base__/graphics/entity/car/car-shadow-2.png",width_in_frames = 1,height_in_frames = 22,},
		   {filename = "__base__/graphics/entity/car/car-shadow-3.png",width_in_frames = 1,height_in_frames = 20,},
          })
        }
      }
	}
})