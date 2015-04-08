for index, force in pairs(game.forces) do
  force.resettechnologies()
end

for index, force in pairs(game.forces) do
	if force.technologies["military-4"].researched then
		force.recipes["depleted-bullet-magazine"].enabled = true
	end
end
