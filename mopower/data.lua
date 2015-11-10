data.mopower = true

require("prototypes.wind")
require("prototypes.storage")
require("prototypes.coalgen")
require("prototypes.nuclear.base")
require("prototypes.steamengines")

if data.motrans then
	require("prototypes.aquapower")
end