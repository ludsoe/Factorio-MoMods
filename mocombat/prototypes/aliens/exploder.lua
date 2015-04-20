function exploderexplode(scale,tint1,tint2)
	return
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
		range = 1,
		cooldown = 35,
		animation = biterattackanimation(scale, tint1, tint2)
	}
end

local smallexploder_scale = 0.5
local smallexploder_tint1 = {r=0.78, g=0.4, b=0.15, a=0.6}
local smallexploder_tint2 = {r=0.9, g=0.4, b=0.1, a=0.8}

data:extend(
{
	 {
    type = "unit",
    name = "small-exploder",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 50,
    order="b-b-b",
    subgroup="enemies",
    resistances = 
    {
      {
        type = "physical",
        decrease = 4,
      },
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.7, -1.5}, {0.7, 0.3}},
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    attack_parameters = exploderexplode(smallexploder_scale,smallexploder_tint1,smallexploder_tint2),
    vision_distance = 30,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 400,
    corpse = "medium-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound = enemydyingsound(),
    run_animation = biterrunanimation(smallexploder_scale, smallexploder_tint1, smallexploder_tint2)
  }
})
