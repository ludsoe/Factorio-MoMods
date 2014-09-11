for index, force in pairs(game.forces) do
  force.resettechnologies()
  force.resetrecipes()
end

for index, force in pairs(game.forces) do
	if force.technologies["land-mine"].researched then
		force.recipes["poison-landmine"].enabled = true
	end
end