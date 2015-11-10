local function CreateModule(Data)
data:extend({
	{
		type = "generator-equipment",name = Data.Name,
		sprite = {filename = "__mocombat__/graphics/equipment/"..Data.Name..".png",width = 128,height = 128,priority = "medium"},
		shape = Data.Shape,power=Data.PowerOutput.."kW",
		energy_source = {type = "electric",usage_priority = "primary-output"}
	},
	{
		type = "item",name = Data.Name,
		icon = "__mocombat__/graphics/icons/"..Data.Name..".png",
		placed_as_equipment_result = Data.Name,
		flags = {"goes-to-main-inventory"},subgroup = "equipment",
		order = "a[energy-source]-b["..Data.Name.."]",
		stack_size = 20
	},
	{
		type = "recipe",name = Data.Name,
		enabled = false,energy_required = 10,
		ingredients = Data.Crafting,
		result = Data.Name
	},
	{
		type = "technology",name = Data.Name,
		icon = "__mocombat__/graphics/icons/"..Data.Name..".png",
		prerequisites = Data.PreRequisites,
		effects ={{type = "unlock-recipe",recipe = Data.Name}},
		unit = Data.TechReqItems,order = Data.TechOrder
	},
})
end

CreateModule({
	Name="fusion-reactor-mk2-equipment",
	PowerOutput="150",
	Shape={width = 4,height = 4,type = "full"},
	Crafting={ {"fusion-reactor-equipment", 1}, {"processing-unit", 100}, {"alien-artifact", 60}},
	PreRequisites={"fusion-reactor-equipment"},
	TechReqItems={count = 300,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},time = 30},
	TechOrder="g-l-b"
})

CreateModule({
	Name="fusion-reactor-mk3-equipment",
	PowerOutput="150",
	Shape={width = 2,height = 2,type = "full"},
	Crafting={ {"fusion-reactor-mk2-equipment", 1}, {"processing-unit", 100}, {"alien-artifact", 60}},
	PreRequisites={"fusion-reactor-mk2-equipment"},
	TechReqItems={count = 400,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 40},
	TechOrder="g-l-c"
})

CreateModule({
	Name="fusion-reactor-mk4-equipment",
	PowerOutput="300",
	Shape={width = 2,height = 2,type = "full"},
	Crafting={ {"fusion-reactor-mk3-equipment", 1}, {"processing-unit", 100}, {"alien-artifact", 150}},
	PreRequisites={"fusion-reactor-mk3-equipment"},
	TechReqItems={count = 500,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 50},
	TechOrder="g-l-d"
})

