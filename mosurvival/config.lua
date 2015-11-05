local M = MoConfig

--[[==================================================
			Hunger Related Variables.
]]--==================================================

--The maximum amount of food points a player can store.
M.MaxHunger = 6000

--How fast food points decay every 0.1 seconds.
M.HungerDecay = 0.16

--[[==================================================
			Health Regen Related Variables.
]]--==================================================

--The maximum health of a player we will regen to. (Setting above the entities max health causes issues.)
M.PlayerHealthRegenMax = 100

--How much hunger do players require for health regen.
M.HungerHealthRegenLevel = 70

--How much of a players health regenerates every food think.
M.HungerHealthRegen = 2

--How many hunger points are used to regen health.
M.HungerHealthRegenCost = 30

--[[==================================================
			Food Item related Items.
]]--==================================================

--What players receive when they spawn...
M.ItemsOnSpawn = {
{N="raw-fish",A=10}
}