for index, force in pairs(game.forces) do
  force.resettechnologies()
  force.resetrecipes()
end

for index, force in pairs(game.forces) do
	if force.technologies["nuclear-power-generation"].researched then
		force.recipes["disposal-plant"].enabled = true
	end
end