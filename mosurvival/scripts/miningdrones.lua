local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local MiningPortRange = 10
local MiningPortMaxitems = 50

Ores = {}--Empty Ore table
Techs = {}--Empty Techs table

require "supportedores"

function MiningRobotPortThink(ent)
	local E = ent.entity
	--MoMisc.Print("Thinking....")
	if E and E.valid then
		local RoboPort = KTE(ent.bits["RoboPort"].E)
		local ABots = RoboPort.get_item_count("construction-robot")
		local BBots = E.get_item_count("construction-robot")
		
		if not ent.extra.Items then ent.extra.Items={} end
		local ItemList = ent.extra.Items
		
		if ABots<30 then
			if BBots>0 then
				local Needed = 30-ABots
				if BBots>Needed then
					local Stack = {name = "construction-robot", count=Needed}
					E.get_inventory(1).remove(Stack)
					RoboPort.get_inventory(1).insert(Stack)
				else
					local Stack = {name = "construction-robot", count=BBots}
					E.get_inventory(1).remove(Stack)
					RoboPort.get_inventory(1).insert(Stack)					
				end
				ABots = RoboPort.get_item_count("construction-robot")
			end
		elseif ABots>30 then
			local Over = ABots-30
			local Stack = {name = "construction-robot", count=Over}
			local Inv = E.get_inventory(1)
			if Inv.can_insert(Stack) then
				Inv.insert(Stack)
				RoboPort.get_inventory(1).remove(Stack)
				ABots = RoboPort.get_item_count("construction-robot")
			end
		end
		
		local DropOff = KTE(ent.bits["OreDropOff"].E)
		
		for i,d in pairs(DropOff.get_inventory(1).get_contents()) do
			local Inv = E.get_inventory(1)
			local Stack = {name=i,count=d}
			if Inv.can_insert(Stack) then
				Inv.insert(Stack) 
				DropOff.get_inventory(1).remove(Stack)
			end
		end
		
		RoboPort.force = MoMining.Data.BotForce
		DropOff.force = MoMining.Data.BotForce
		
		for i,d in pairs(ItemList) do
			if not KTE(d) or not KTE(d).valid then
				table.remove(ItemList,i)
			end
		end
		
		local Inv = E.get_inventory(1)
		local Stack = {name="mrobot-inventory-space-tester",count=1}

		if Inv.can_insert(Stack) then			
			for i,d in pairs(Ores) do
				local Finds = MoEntity.findentinsquareradius(E.surface,E.position,MiningPortRange,i) --Make the radius changable via config
				if #Finds > 0 and #ItemList<MiningPortMaxitems then
					MoEntity.LoopThis(Finds,function(ore)
						if #ItemList>MiningPortMaxitems then return end --Exit out of the loop if we cant mine anymore
						if ABots>0 then
							for bot=1,MoMath.Clamp(ABots/#Finds,1,30) do
								if ore.valid then
									--local Check = MoEntity.findentinsquareradius(E.surface,ore.position,1,"item-on-ground")
									local Check = E.surface.find_non_colliding_position("item-on-ground", ore.position, 1.5, 0.1)
									--if #Check<5 then
									if Check then
										local Check2 = MoEntity.counttypeinsquareradius(E.surface,Check,0.4,"transport-belt")
										if Check2 <=0 then
											if d.min > 0 then
												local chance = MoMath.Clamp(((ore.amount-d.min)/d.norm)*100,0.01,100)
												local roll = math.random(0,100)
												
												--MoMisc.Print("O "..ore.amount.." "..d.norm.." Chance.. "..chance.." "..roll)
												
												if roll<chance then
													local Loot = ore.surface.create_entity{name = "item-on-ground", position= Check, stack = {name = d.result, count=d.yield}}
													Loot.order_deconstruction(RoboPort.force)
													ABots = ABots - 1
													
													table.insert(ItemList,RegKey(Loot))
													
													if ore.amount>d.min then
														ore.amount=ore.amount-1
													end
												end
											else
												local Loot = ore.surface.create_entity{name = "item-on-ground", position= Check, stack = {name = d.result, count=d.yield}}
												Loot.order_deconstruction(RoboPort.force)
												ABots = ABots - 1
												
												table.insert(ItemList,RegKey(Loot))
												
												if ore.amount>1 then
													ore.amount=ore.amount-1
												else
													ore.destroy()
												end
											end
										end
									end
								end
							end
						end
					end)
				end
			end
		end
		return true
	end	
	return false	
end
MoEntity.CreateAdvEntityRawFuncCache("MiningRoboPort",MiningRobotPortThink)


function OnTowerBuilt(entity)
	local Pforce,Bforce = entity.force,MoMining.Data.BotForce
	Pforce.set_cease_fire(Bforce,true) Bforce.set_cease_fire(Pforce,true)
	
	local Port = entity.surface.create_entity{name = "mining-roboport-chest", position= entity.position} entity.destroy()--Destroy the fake placer entity.
	Port.force = Pforce
		
	MoEntity.CreateAdvEntityRaw(Port,"MiningRoboPort",{{Type="mining-drone-roboport",Name="RoboPort"},{Type="mining-drone-dropoff",Name="OreDropOff"}},{Items={}},1)
end

MoEntity.SubscribeOnBuilt("mining-drone-placer","DroneControllerDetect",OnTowerBuilt)

function BotManageTechs()
	for i,d in pairs(Techs) do
		game.forces["miningrobots"].technologies[d].researched = game.forces["player"].technologies[d].researched
	end
end
MoTimers.CacheFunction("BotManageTechs",BotManageTechs)


