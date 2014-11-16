data.mopower = true

require("prototypes.wind")
require("prototypes.storage")
require("prototypes.coalgen")
require("prototypes.nuclear.base") --Nuclearpower is not possible yet, atleast not the way i want it so ill just disable it for now

if data.motrans then
	require("prototypes.aquapower")
end