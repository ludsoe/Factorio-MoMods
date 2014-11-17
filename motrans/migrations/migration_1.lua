
for index, force in pairs(game.forces) do
	if force.technologies["railway"].researched then
		force.recipes["straight-rail-bridge"].enabled = true
		force.recipes["straight-rail-bridge-reverse"].enabled = true
	end
end