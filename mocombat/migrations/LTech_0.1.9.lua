for index, force in pairs(game.forces) do
  force.resettechnologies()
  force.resetrecipes()
end

for index, force in pairs(game.forces) do
	if force.technologies["basic-electric-discharge-defense-equipment"].researched then
		force.recipes["tesla-turret"].enabled = true
	end
end