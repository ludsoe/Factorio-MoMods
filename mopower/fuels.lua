


--This is where I hold all the variables for fuel value till I can read the values from the entitys themselfs.

Fuels["wood"] = 0.6
Fuels["raw-wood"] = 4
Fuels["coal"] = 8
Fuels["solid-fuel"] = 25

if remote.interfaces.MoCombat then
	Fuels["infused-solid-fuel"] = 54
end

if remote.interfaces.MoFarm then
	Fuels["salad"] = 2
end