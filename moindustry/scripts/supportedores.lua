function RegisterOre(name,result)
	Ores[name]=result
end

RegisterOre("copper-ore","copper-ore")
RegisterOre("iron-ore","iron-ore")
RegisterOre("coal","coal")
RegisterOre("stone","stone")

ModInterface.RegisterOre = function(name,result)
	RegisterOre(name,result)
end
