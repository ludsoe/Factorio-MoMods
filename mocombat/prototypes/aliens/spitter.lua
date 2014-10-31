data:extend(
{
  {
    type = "unit",
    name = "medium-spitter",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 160,
    order="b-b-b",
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
    attack_parameters =
    {
      ammo_category = "rocket",
      ammo_type ={
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "acid-projectile-purple",
            starting_speed = 0.5,
			max_range = 20,
          }
        }
      },
      range = 12,
      cooldown = 35,
      animation =
      {
        width = 200,
        height = 132,
        frame_count = 11,
        direction_count = 16,
        axially_symmetrical = false,
        shift = {1.25719, -0.464063},
        stripes =
        {
          {
            filename = "__mocombat__/graphics/enemys/spitter/medium-biter-attack-1.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__mocombat__/graphics/enemys/spitter/medium-biter-attack-2.png",
            width_in_frames = 5,
            height_in_frames = 8
          },
          {
            filename = "__mocombat__/graphics/enemys/spitter/medium-biter-attack-3.png",
            width_in_frames = 6,
            height_in_frames = 8
          },
          {
            filename = "__mocombat__/graphics/enemys/spitter/medium-biter-attack-4.png",
            width_in_frames = 5,
            height_in_frames = 8
          }
        }
      }
    },
    vision_distance = 24,
    movement_speed = 0.185,
    distance_per_frame = 0.15,
    -- in pu
    pollution_to_join_attack = 1200,
    corpse = "medium-spitter-corpse",
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
      filename = "__mocombat__/graphics/enemys/spitter/medium-biter-run.png",
      still_frame = 4,
      width = 122,
      height = 84,
      frame_count = 16,
      direction_count = 16,
      axially_symmetrical = false,
      shift = {0.514688, -0.219375},
    }
  },
  {
    type = "corpse",
    name = "medium-spitter-corpse",
    icon = "__base__/graphics/icons/medium-biter-corpse.png",
    selectable_in_game = false,
    selection_box = {{-1, -1}, {1, 1}},
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way"},
    order = "c[corpse]-a[spitter]-b[medium]",
    dying_speed = 0.04,
    final_render_layer = "corpse",
    animation =
    {
      width = 204,
      height = 138,
      frame_count = 17,
      direction_count = 16,
      axially_symetric = false,
      shift = {0.4725, -0.118125},
      stripes =
      {
        {
          filename = "__mocombat__/graphics/enemys/spitter/medium-biter-die-1.png",
          width_in_frames = 9,
          height_in_frames = 8
        },
        {
          filename = "__mocombat__/graphics/enemys/spitter/medium-biter-die-2.png",
          width_in_frames = 8,
          height_in_frames = 8
        },
        {
          filename = "__mocombat__/graphics/enemys/spitter/medium-biter-die-3.png",
          width_in_frames = 9,
          height_in_frames = 8
        },
        {
          filename = "__mocombat__/graphics/enemys/spitter/medium-biter-die-4.png",
          width_in_frames = 8,
          height_in_frames = 8
        }
      },
    }
  }
})
