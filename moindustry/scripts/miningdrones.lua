local EnergyCost = 50
local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey

function OnTowerBuilt(entity)
	MoEntity.AddToLoop("mining-controller",entity)
end

MoEntity.SubscribeOnBuilt("mining-drone-controller","DroneControllerDetect",OnTowerBuilt)

Ores = {}--Empty Ore table
require "supportedores"

function MiningTowersThink()
	MoEntity.CallLoop("mining-controller",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		
		for i,d in pairs(Ores) do
			local Finds = MoEntity.findentinsquareradius(DE.surface,DE.position,5,i) --Make the radius changable via config
			MoEntity.LoopThis(Finds,function(ent)
				if DE.surface.can_place_entity({name="basic-transport-belt", position = ent.position}) then
					local Check = MoEntity.findentinsquareradius(DE.surface,ent.position,1,"item-on-ground")
					
					if #Check<4 and DE.energy >= EnergyCost then
						DE.energy=DE.energy-(EnergyCost*MoMath.GetKJ())

						DE.surface.spill_item_stack(ent.position,{name = d, count=1})
						
						local Loots = MoEntity.findentinsquareradius(DE.surface,ent.position,1,"item-on-ground")
						MoEntity.LoopThis(Loots,function(Loot)
							if Loot and Loot.valid then
								if not Loot.to_be_deconstructed(DE.force) then
									Loot.order_deconstruction(DE.force)
								end
							end
						end)
						
						--Do this bit last.
						if ent.amount>1 then
							ent.amount=ent.amount-1
						else
							ent.destroy()
						end
					end
				end
			end)
		end
		
		return true
	end)
end
MoTimers.CacheFunction("MiningTowersThink",MiningTowersThink)

