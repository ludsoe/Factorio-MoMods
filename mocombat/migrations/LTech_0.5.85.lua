for index, force in pairs(game.forces) do
  force.reset_technologies()
end

for index, force in pairs(game.forces) do
	if force.technologies["adv-com-drones"].researched then
		force.recipes["attack-drone-rover"].enabled = true
	end
end
