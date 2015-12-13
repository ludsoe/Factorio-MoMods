function RegisterOre(name,result,min,norm,yield)
	Ores[name]={result=result,min=(min or 0),norm=(norm or 1),yield = (yield or 1)}
end

ModInterface.RegisterOre = function(name,result,min,norm,yield)
	RegisterOre(name,result,min,norm,yield)
end

for i,d in pairs(MoConfig.DMO) do
	RegisterOre(d.OreName,d.ItemResult,d.MiniumCount,d.NormalCount,d.Yield)
end

-- remote.call("MoIndustry","RegisterOre","coal","coal",100,150,1)

--Sticking tech registration here also.

function RegisterTech(name)
	Techs[name]=name
end

ModInterface.RegisterTech = function(name)
	RegisterTech(name)
end

for i,d in pairs(MoConfig.Techs) do
	RegisterTech(d)
end