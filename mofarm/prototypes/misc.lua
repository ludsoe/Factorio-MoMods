data:extend(
{
	{
		type = "recipe",
		name = "fish-from-water",
		enabled = "true",
		icon = "__base__/graphics/icons/fish.png",
		category="crafting-with-fluid",
		subgroup = "farming-raw-food",
		energy_required = 5,
		ingredients =
		{
		  {type="fluid", name="water", amount=1}
		},
		result= "raw-fish",
		order = "c"
	}
}
)