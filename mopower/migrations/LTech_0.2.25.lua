
for index, force in pairs(game.forces) do
	if force.technologies["nuclear-power-generation"].researched then
		force.recipes["depleted-uranium-enrichment"].enabled = true
	end
end