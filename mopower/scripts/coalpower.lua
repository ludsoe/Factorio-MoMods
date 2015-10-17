Fuels = {}

require "fuels" --Load the fuels lua

function CoalToPower(Genr,Tank)
	local PLvl = Genr.energy or 0
	--game.player.print("Inv "..Inv)
	local MJAmount = MoMath.GetMJ()
	local MaxEnergy = 100*MJAmount
	local surface = Genr.surface
	
	for i,d in pairs(Fuels) do
		local Inv = Tank.get_item_count(i)
		--game.player.print("Fuel "..i.." : "..Inv)
		if Inv>0 then
			local FLvl = PLvl+((d*MJAmount)*Inv)
			--game.player.print("Ener "..i.." : "..FLvl.." o "..MaxEnergy )
			if FLvl<=MaxEnergy then
				Tank.get_inventory(1).remove({name=i,count=Inv})
				Genr.energy = FLvl
				surface.pollute(Genr.position,(d*Inv)*1.2)
				return
			else
				local Count = math.floor((MaxEnergy-PLvl)/(d*MJAmount))
				--game.player.print("Count "..i.." : "..Count)
				if Inv>=Count and Count>0 then
					local FLvl = PLvl+((d*MJAmount)*Count)
					if FLvl<=MaxEnergy then
						Tank.get_inventory(1).remove({name=i,count=Count})
						Genr.energy = FLvl
						surface.pollute(Genr.position,(d*Count)*1.2)
						return
					else
						--game.player.print("Error "..i.." : "..FLvl)
					end
				end
			end
		end
	end
end

local function PrintError(Text)
	for i,d in pairs(game.players) do
		d.print(""..Text)
	end
end

MoEntity.CreateAdvEntityHook("basic-coalgen","CoalGenSpawn",{{Type="fuel-storage",Name="FuelTank"}},{},0.2,function(ent)
	local E = ent.entity
	if E and E.valid then
		local Fuel = MoEntity.KeyToEnt(ent.bits["FuelTank"].E)
		if Fuel and Fuel.valid then
			CoalToPower(E,Fuel)
		end
		return true
	end	
	return false		
end)

function BurnerGeneratorThink()
	local KTE = MoEntity.KeyToEnt
	MoEntity.CallLoop("FuelStorages",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			local Pos = E.position
			local Chest=game.create_entity{name = "wooden-chest", position={x=Pos.x or 0,y=Pos.y or 0}}
			
			Chest.force = ent.extra.F.force
			
			Chest.get_inventory(1).insert({name="basic-coalgen",count=1})
			for i,d in pairs(E.get_inventory(1).get_contents()) do
				Chest.get_inventory(1).insert({name=i,count=d})
			end
			Chest.order_deconstruction(Chest.force)
			
			if ent.extra.F.valid then ent.extra.F.die() end				
			E.destroy()
		end	
		return false		
	end)
end

MoTimers.CacheFunction("BurnerGeneratorThink",BurnerGeneratorThink)