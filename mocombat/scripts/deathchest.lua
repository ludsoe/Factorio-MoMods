
function PortInventory(Inv,ChestInv,Amt)
	for I=1, #Inv do
		local Stack = Inv[I]
		if Stack.valid_for_read then
			ChestInv[Amt].set_stack(Stack)
			Amt=Amt+1
		end
	end
	
	return Amt
end

function SpawnDeathChest(player)
	if not global.DeathChestEnabled and not MoConfig.DeathChest then return end --Enable it first.
	
	local Chest = player.surface.create_entity{name = "death-chest", position= player.position}
	Chest.force = player.force --Set the chests force to the players force.
	local ChestInv = Chest.get_inventory(1)
	local Amount = 1
	
	local PlayerInventorys = {defines.inventory.player_main,defines.inventory.player_quickbar,defines.inventory.player_guns,defines.inventory.player_tools,defines.inventory.player_ammo,defines.inventory.player_armor}
	
	for I=1, #PlayerInventorys do
		Amount = PortInventory(player.get_inventory(PlayerInventorys[I]),ChestInv,Amount)
	end
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