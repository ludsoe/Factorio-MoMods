for index, force in pairs(game.forces) do
	if force.technologies["adv-com-drones"].researched then
		force.recipes["drone-orders-artifact"].enabled = true
	end
end