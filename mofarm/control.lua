require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=true,
	Entity=true
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt
local Plant = "greenleaf-ore"

local PlanterCost = 500

remote.add_interface("MoFarm", {
	addfarms = function() 
		local Turbines=MoEntity.findentinsquareradius(MoEntity.getplayerpos(),300,"greenleafplanter")
		MoEntity.LoopThis(Turbines,function(ent)
			MoEntity.AddToLoop("Planters",ent)
		end)
	end,
})

if remote.interfaces.MoPower then
	remote.call("MoPower", "RegisterFuel", "greenleaf", 1.5)
	remote.call("MoPower", "RegisterFuel", "salad", 3)
end
	
if remote.interfaces.MoSurvival then
	local MaxHunger = remote.call("MoSurvival", "GetMaxHunger")
	remote.call("MoSurvival", "RegisterFoodItem", "salad", MaxHunger/15)
end

MoEntity.SubscribeOnBuilt("greenleafplanter","FarmSpawn",function(entity)
	MoEntity.AddToLoop("Planters",entity)
end)

function PosOrNeg(Seed)
	local X = math.random(1,10)
	if X>=5then
		return -1
	end
	return 1
end

function MoFarmPlanterThink()
	MoEntity.CallLoop("Planters",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			if E.energy >= PlanterCost then
				local P = E.position
				local V = {x=P.x+math.random(1,4)*PosOrNeg(P.x),y=P.y+math.random(1,4)*PosOrNeg(P.y)}
				local Plants = MoEntity.findentinsquareradius(E.surface,V,1,Plant) 
				if #Plants <= 0 then
					local NewPlant = game.createentity({name = Plant, position= V})
					NewPlant.amount=math.random(1,3)
				else
					MoEntity.LoopThis(Plants,function(plnt)
						if plnt.amount < 20 then
							plnt.amount=plnt.amount+math.random(1,3)
						end
					end)
				end
				E.energy=E.energy-PlanterCost
			end
			return true
		end	
		return false
	end)
end

MoTimers.CacheFunction("MoFarmPlanterThink",MoFarmPlanterThink)

function Intialize()
	MoTimers.CreateTimer("MoFarmPlanterThink",1,0,false,MoFarmPlanterThink) 
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 



