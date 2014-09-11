for index, force in pairs(game.forces) do
  force.resettechnologies()
  force.resetrecipes()
end

for index, force in pairs(game.forces) do
	if force.technologies["military-2"].researched then
		force.recipes["rescue-ranger"].enabled = true
		force.recipes["ranger-cart"].enabled = true
	end
end