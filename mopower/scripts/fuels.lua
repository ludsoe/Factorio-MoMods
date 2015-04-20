--This is where I hold all the variables for fuel value till I can read the values from the entitys themselfs.

function RegisterFuel(name,amount)
	Fuels[name] = amount
end

RegisterFuel("wood",0.6)
RegisterFuel("raw-wood",4)
RegisterFuel("wooden-chest",4)
RegisterFuel("small-electric-pole",4)
RegisterFuel("coal",8)
RegisterFuel("solid-fuel",25)

ModInterface.RegisterFuel = function(name,amount)
	RegisterFuel(name,amount)
end
