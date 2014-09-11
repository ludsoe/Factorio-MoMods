data.mopower = true

require("prototypes.wind")
require("prototypes.storage")
require("prototypes.coalgen")

if data.motrans then
	require("prototypes.aquapower")
end