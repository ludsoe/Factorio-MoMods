
function SpawnDeathChest(player)
	if not global.DeathChestEnabled and not MoConfig.DeathChest then return end --Enable it first.
	
	local Chest = player.surface.create_entity{name = "death-chest", position= player.position}
	Chest.force = player.force --Set the chests force to the players force.
	local ChestInv = Chest.get_inventory(1)
	
	for i,d in pairs(player.get_inventory(defines.inventory.player_main).get_contents()) do ChestInv.insert({name=i,count=d}) end
	for i,d in pairs(player.get_inventory(defines.inventory.player_quickbar).get_contents()) do ChestInv.insert({name=i,count=d}) end	
	for i,d in pairs(player.get_inventory(defines.inventory.player_guns).get_contents()) do ChestInv.insert({name=i,count=d}) end	
	for i,d in pairs(player.get_inventory(defines.inventory.player_tools).get_contents()) do ChestInv.insert({name=i,count=d}) end	
	for i,d in pairs(player.get_inventory(defines.inventory.player_ammo).get_contents()) do ChestInv.insert({name=i,count=d}) end	
	for i,d in pairs(player.get_inventory(defines.inventory.player_armor).get_contents()) do ChestInv.insert({name=i,count=d}) end
end

MoEntity.SubscribeOnDeath("player","death-chest",SpawnDeathChest)



-- /c remote.call("MoCombat","enabledeathchest")
ModInterface.enabledeathchest = function()
	MoMisc.Print("Enabling DeathChest!")
	global.DeathChestEnabled = true
end

ModInterface.disabledeathchest = function()
	MoMisc.Print("Disabling DeathChest!")
	global.DeathChestEnabled = false
end