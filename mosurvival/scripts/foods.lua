
function RegisterFoodItem(name,amount)
	Foods[name]=amount
end
RegisterFoodItem("raw-fish",MoConfig.MaxHunger/10)

function IsFood(item)
	--MoMisc.PrintTable(MoSurvival.Foods)
	if Foods[item] then
		return true
	end
	return false
end

function HasFood(ply,Dat)
	local inv = ply.getinventory(defines.inventory.playermain)
	--MoMisc.Print("Checking for food!")
	for trys=1,2 do
		for i,d in pairs(inv.getcontents()) do
			if IsFood(i) then
				if Foods[i]<MoConfig.MaxHunger-Dat.H then
					return true, i
				end
			end
		end
		
		inv = ply.getinventory(defines.inventory.playerquickbar)
	end
	
	return false,""
end

function EatFoodItem(ply,dat,food)
	local inv = ply.getinventory(defines.inventory.playermain)
	--MoMisc.Print("Eating food! "..tostring(food))
	for trys=1,2 do
		if inv.getitemcount(food) >= 1 then
			inv.remove{name=food, count=1}
			dat.H=dat.H+Foods[food]
			return
		end
		inv = ply.getinventory(defines.inventory.playerquickbar)
	end
end

function GetTotalFoodPoints(ply)
	local inv = ply.getinventory(defines.inventory.playermain)
	local FoodPoints = 0
	
	for trys=1,2 do
		for i,d in pairs(inv.getcontents()) do
			if IsFood(i) then
				FoodPoints = FoodPoints+(Foods[i]*d)
			end
		end
		
		inv = ply.getinventory(defines.inventory.playerquickbar)
	end
	
	return FoodPoints
end

ModInterface.RegisterFoodItem = function(name,amount)
	RegisterFoodItem(name,amount)
end
