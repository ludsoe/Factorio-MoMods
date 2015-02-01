--Load the vanilla settings.
require("vanilla")

--Lets use some detection tricks to figure out what mods we are dealing with.

if data.raw["technology"]["combat-robotics-2"] == nil then
	if data.raw["technology"]["capsule-4"] ~= nil then
		require("cartmenover")
	end
end
