local function CreateModule(Data)
data:extend({
	{
		type = "battery-equipment",name = Data.Name,
		sprite = {filename = "__mocombat__/graphics/equipment/"..Data.Name..".png",width = 32,height = 64,priority = "medium"},
		shape = {width = 1,height = 2,type = "full"},
		energy_source = {type = "electric",buffer_capacity = Data.Capacity.."MJ",input_flow_limit = Data.FlowRate.."MW",output_flow_limit = Data.FlowRate.."MW",usage_priority = "terciary"}
	},
	{
		type = "item",name = Data.Name,
		icon = "__mocombat__/graphics/icons/"..Data.Name..".png",
		placed_as_equipment_result = Data.Name,
		flags = {"goes-to-main-inventory"},subgroup = "equipment",
		order = "c[battery]-b["..Data.Name.."]",
		stack_size = 50,default_requiest_amount = 10
	},
	{
		type = "recipe",name = Data.Name,
		enabled = false,energy_required = 10,
		ingredients = { {Data.RecipeIngrediant, 10}, {"processing-unit", 20}},
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
	Name="battery-mk3-equipment",
	Capacity="2.5",
	FlowRate="25",
	RecipeIngrediant="battery-mk2-equipment",
	PreRequisites={"battery-mk2-equipment"},
	TechReqItems={count = 200,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},time = 30},
	TechOrder="g-i-c"
})

CreateModule({
	Name="battery-mk4-equipment",
	Capacity="12.5",
	FlowRate="125",
	RecipeIngrediant="battery-mk3-equipment",
	PreRequisites={"battery-mk3-equipment"},
	TechReqItems={count = 300,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},time = 40},
	TechOrder="g-i-d"
})

CreateModule({
	Name="battery-mk5-equipment",
	Capacity="62.5",
	FlowRate="625",
	RecipeIngrediant="battery-mk4-equipment",
	PreRequisites={"battery-mk4-equipment"},
	TechReqItems={count = 300,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 50},
	TechOrder="g-i-e"
})

CreateModule({
	Name="battery-mk6-equipment",
	Capacity="312.5",
	FlowRate="3125",
	RecipeIngrediant="battery-mk5-equipment",
	PreRequisites={"battery-mk5-equipment"},
	TechReqItems={count = 400,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 60},
	TechOrder="g-i-f"
})

















