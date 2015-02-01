local M = MoConfig

if M.DepletedRounds and data.mopower then
	require("depletedrounds")
end

if M.BFG or M.RailGun then
	require("research")
end

if M.LaserRifle then
	require("laser-rifle")
end

if M.Ranger then
	require("rescue-ranger")
end

if M.BFG then
	require("bfg")
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "bfg-10k"})
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "bfg-ammo"})
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "hvywep-frame"})
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "plasma-casing"})
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "infused-solid-fuel"})
end

if M.RailGun then
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "railgun"})
	table.insert(data.raw["technology"]["bfg-weapon"].effects,{type = "unlock-recipe",recipe = "railgun-dart"})
end
