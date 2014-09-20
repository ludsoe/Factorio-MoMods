for index, force in pairs(game.forces) do
  force.resettechnologies()
  force.resetrecipes()
end

for index, force in pairs(game.forces) do
	if force.technologies["adv-com-drones"].researched then
		force.recipes["combat-drone-wagon"].enabled = true
	end
end