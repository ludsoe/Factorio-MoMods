local M = MoConfig

function InsertAt(T1,T2,N)
	local T = {}
	for i=1,#T1 do
		if i == N then
			table.insert(T, T2)
			table.insert(T, T1[i])
		else
			table.insert(T, T1[i])
		end
	end
	if N>#T1 then
		table.insert(T, T2)
	end
	return T
end

if M.Exploders then
	--Lets add the spitter to the biter spawner.
	data.raw["unit-spawner"]["biter-spawner"].result_units=InsertAt(data.raw["unit-spawner"]["biter-spawner"].result_units, {"small-exploder", 0.32},3)
end

if M.Ranger then
	--Time to add the rescue ranger into military 2.
	table.insert(data.raw["technology"]["military-2"].effects,{type = "unlock-recipe",recipe = "rescue-ranger"})
	table.insert(data.raw["technology"]["military-2"].effects,{type = "unlock-recipe",recipe = "ranger-cart"})
end

if M.OtherMines then
	table.insert(data.raw["technology"]["land-mine"].effects,{type = "unlock-recipe",recipe = "poison-landmine"})
end

if M.DepletedRounds and data.mopower  then
	table.insert(data.raw["technology"]["military-4"].effects,{type = "unlock-recipe",recipe = "depleted-bullet-magazine"})
end

function AddEletricResist(Raw,Percent)
	local Resist = {type = "electric",percent = Percent}
	for i,d in pairs(Raw) do
		if d.resistances ==nil then d.resistances={} end
		table.insert(d.resistances, Resist)
	end
end

if M.TeslaTower then
	--Add resistances to entities.
	AddEletricResist(data.raw["wall"],100)
	AddEletricResist(data.raw["gate"],100)
	AddEletricResist(data.raw["car"],100)
	AddEletricResist(data.raw["electric-pole"],90)
	
	table.insert(data.raw["armor"]["basic-modular-armor"].resistances,{type = "electric",percent = 50})
	table.insert(data.raw["armor"]["power-armor"].resistances,{type = "electric",percent = 75})
	table.insert(data.raw["armor"]["power-armor-mk2"].resistances,{type = "electric",percent = 100})
		
	table.insert(data.raw["technology"]["basic-electric-discharge-defense-equipment"].effects,{type = "unlock-recipe",recipe = "tesla-turret"})
end

if M.SpitPhysics then
	--This converted the spit into a physical projectile, but due to collision issues ill have to disable this
	data.raw["projectile"]["acid-projectile-purple"].direction_only = true
	data.raw["projectile"]["acid-projectile-purple"].collision_box = {{-1, -1}, {1, 1}}
end

if M.SpitRange then
	local Worms = {{N="small-worm-turret",R=20},{N="medium-worm-turret",R=25},{N="big-worm-turret",R=30}}
	for i,d in pairs(Worms) do data.raw["turret"][d.N].attack_parameters.ammo_type.action.action_delivery.max_range=d.R end
end
	
if M.SpitAOE then
	--Splash damage to the spit!
	local Dat = data.raw["projectile"]["acid-projectile-purple"].action.action_delivery.target_effects
	local Explode = {type = "nested-result", action = {type = "area", perimeter = 1.5,entity_flags = {"player-creation"}, action_delivery ={type = "instant",target_effects ={{type = "damage",damage = {amount = 4, type = "acid"}}}}}}
	table.insert(Dat, Explode)
end

local Worms = {{N="small-worm-turret",R={r=0, g=0.8, b=0.8}},{N="medium-worm-turret",R={r=0, g=0.8, b=0.8}},{N="big-worm-turret",R={r=0, g=0.8, b=0.8}}}
for i,d in pairs(Worms) do data.raw["turret"][d.N].map_color=d.R end





















