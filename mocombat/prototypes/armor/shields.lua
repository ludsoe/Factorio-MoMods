local function CreateModule(Data)
data:extend({
	{
		type = "energy-shield-equipment",name = Data.Name,
		sprite = {filename = "__mocombat__/graphics/equipment/"..Data.Name..".png",width = 64,height = 64,priority = "medium"},
		shape = {width = 2,height = 2,type = "full"},
		energy_source = {type = "electric",buffer_capacity = Data.EnergyCapacity.."kJ",input_flow_limit = Data.EnergyFlowRate.."kW",usage_priority = "primary-input"},
		max_shield_value=Data.ShieldCapacity,energy_per_shield=Data.EnergyPerShield.."kJ"
	},
	{
		type = "item",name = Data.Name,
		icon = "__mocombat__/graphics/icons/"..Data.Name..".png",
		placed_as_equipment_result = Data.Name,
		flags = {"goes-to-main-inventory"},subgroup = "equipment",
		order = "b[shield]-b["..Data.Name.."]",
		stack_size = 50,default_requiest_amount = 10
	},
	{
		type = "recipe",name = Data.Name,
		enabled = false,energy_required = 10,
		ingredients = Data.RecipeIngrediants,
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
	Name="energy-shield-mk3-equipment",
	EnergyCapacity="54",
	EnergyFlowRate="108",
	ShieldCapacity=450,
	EnergyPerShield=4,
	RecipeIngrediants= { {"energy-shield-mk2-equipment", 10}, {"processing-unit", 20}, {"alien-artifact", 2}},
	PreRequisites={"energy-shield-mk2-equipment"},
	TechReqItems={count = 200,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},time = 30},
	TechOrder="g-e-c"
})

CreateModule({
	Name="energy-shield-mk4-equipment",
	EnergyCapacity="162",
	EnergyFlowRate="324",
	ShieldCapacity=1350,
	EnergyPerShield=5,
	RecipeIngrediants= { {"energy-shield-mk3-equipment", 10}, {"processing-unit", 20}, {"alien-artifact", 3}},
	PreRequisites={"energy-shield-mk3-equipment"},
	TechReqItems={count = 300,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}},time = 40},
	TechOrder="g-e-d"
})

CreateModule({
	Name="energy-shield-mk5-equipment",
	EnergyCapacity="486",
	EnergyFlowRate="972",
	ShieldCapacity=4050,
	EnergyPerShield=6,
	RecipeIngrediants= { {"energy-shield-mk4-equipment", 10}, {"processing-unit", 20}, {"alien-artifact", 4}},
	PreRequisites={"energy-shield-mk4-equipment"},
	TechReqItems={count = 300,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 50},
	TechOrder="g-e-e"
})

CreateModule({
	Name="energy-shield-mk6-equipment",
	EnergyCapacity="1458",
	EnergyFlowRate="2916",
	ShieldCapacity=12150,
	EnergyPerShield=7,
	RecipeIngrediants= { {"energy-shield-mk5-equipment", 10}, {"processing-unit", 20}, {"alien-artifact", 20}},
	PreRequisites={"energy-shield-mk5-equipment"},
	TechReqItems={count = 400,ingredients = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1},{"alien-science-pack", 1}},time = 60},
	TechOrder="g-e-f"
})















