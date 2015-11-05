local Glow = {
G={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
V={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_vert.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
H={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_hor.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
VU={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_vert_Uend.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
VD={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_vert_Dend.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
HL={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_hor_Lend.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}},
HR={{filename = "__mocombat__/graphics/defenses/forcefields/fieldglow_hor_Rend.png",priority = "extra-high",width = 32,height = 32,shift = {0, 0}}}
}

local Post = {
	filename = "__mocombat__/graphics/defenses/forcefields/post.png",
	priority = "extra-high",
	width = 64,
	height = 100,
	width = 64,
	height = 100,
	frame_count = 1,
	shift = {0.5, 0}
}

data:extend(
{
{
    type = "accumulator",
    name = "forcefield-post",
    icon = "__mocombat__/graphics/icons/ffpost.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "forcefield-post"},
    max_health = 1200,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
	resistances = {{type = "physical",decrease = 3,percent = 60},{type = "electric",percent = 100}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1MJ",
      usage_priority = "primary-input",
      input_flow_limit = "1MJ",
      output_flow_limit = "0kW"
    },
    picture = Post,
    charge_animation = Post,
    charge_cooldown = 30,
    charge_light = {intensity = 0, size = 0},
    discharge_animation = Post,
    discharge_cooldown = 0,
    discharge_light = {intensity = 0, size = 0}
  },
  {
    type = "item",
    name = "forcefield-post",
    icon = "__mocombat__/graphics/icons/ffpost.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[wall]-a[wall]",
    place_result = "forcefield-post",
    stack_size = 40
  },
  {
    type = "wall",
    name = "forcefieldwall",
    icon = "__mocombat__/graphics/icons/ffpost.png",
    flags = {"placeable-neutral", "player-creation", "not-repairable","placeable-off-grid"},
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	subgroup = "defensive-structure",
	order = "a[wall]-a[wall]",
    max_health = 600,
    corpse = "wall-remnants",
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 90
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "laser",
        percent = 70
      }
    },
	attack_reaction ={{
        range = 4,
        damage_type = "physical",
        reaction_modifier = 0.04,
        action ={
          type = "direct",
          action_delivery ={
            type = "instant",
            target_effects ={type = "damage",damage = {amount = 20, type = "electric"}}}
			}
		}
	},
    pictures =
    {
      single = Glow.G,
      straight_vertical = Glow.V,
      straight_vertical_under_ending = Glow.V,
      straight_horizontal = Glow.H,
      corner_right_up = Glow.G,
      corner_right_down = Glow.G,
      corner_left_down = Glow.G,
      corner_left_up = Glow.G,
      t_up = Glow.G,
      t_down = Glow.G,
      t_right = Glow.G,
      t_left = Glow.G,
      cross = Glow.G,
      ending_up = Glow.VD,
      ending_down = Glow.VU,
      ending_right = Glow.HL,
      ending_left = Glow.HR
    }
  },
  {
    type = "recipe",
    name = "forcefield-post",
	enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {"steel-plate", 40},
      {"electronic-circuit", 20},
	  {"processing-unit", 10},
	  {"medium-electric-pole",4}
    },
    result = "forcefield-post",
	result_count = 4
  },
  {
    type = "technology",
    name = "forcefield-post",
    icon = "__mocombat__/graphics/icons/ffpost.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "forcefield-post"
      }
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 2},
      },
      time = 45
    },
    order = "a-h-c",
  }
}
)
