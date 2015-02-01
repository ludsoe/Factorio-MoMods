local KTE = MoEntity.KeyToEnt

MoTimers.CreateTimer("NuclearPower",0,0,false,function()
	
	MoEntity.CallLoop("NuclearReactors",function(ent)
		local E = KTE(ent.entity)
		if E.valid then
			local F = E.fluidbox[2]
			if F and F.type then
				--game.player.print("BLEH "..F.type.." "..F.amount)
				E.fluidbox[2]={
					type = F.type,
					amount = F.amount,
					temperature = 180
				}
			end
			return true
		end	
		return false		
	end)
end)

MoEntity.SubscribeOnBuilt("nuclear-reactor","nuclearreactspawn",function(entity)
	MoEntity.AddToLoop("NuclearReactors",entity,{})
end)
