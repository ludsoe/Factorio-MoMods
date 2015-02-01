--[[
This file contains a list of functions built into MoLogicCore along with their inputs/outputs.

--------------------------------------------
------------------MoEntity------------------
--------------------------------------------

--MoEntity.SubscribeOnBuilt(Ent,Name,Func)
Calls the inputed function when the inputed entity is constructed by a player.
Ent: String, The entity you want to detect when its built.
Name: String, A identifier for the subscription your creating.
Func: Function, The function you want called when the inputed entity is built.

--MoEntity.UnSubscribeOnBuilt(Ent,Name)
Removes a subscription to when a entity is built.
Ent: String, The entity your removing the subscription to.
Name: String, The subscription your removing.

--MoEntity.SubscribeOnDeath(Ent,Name,Func)
Calls the inputed function when the inputed entity is killed.
Ent: String, The entity you want to detect when its killed.
Name: String, A identifier for the subscription your creating.
Func: Function, The function you want called when the inputed entity is killed.

--MoEntity.getplayerpos(Num)
Returns the position of the inputed player.
Num: Number, The number id of the player you want to get the position of.

--MoEntity.addtoplayerpos(Num,X,Y)
Returns the position of the inputed player, with the addition of the inputed X and Y values.
Num: Number, The number id of the player you want to add to the position of.
X: Number, The X value of the position your adding.
y: Number, The Y value of the position your adding.

--MoEntity.closestplayer(X,Y)
Returns the closest player to the set of coordinates inputed.
X: Number, The X value of the position.
y: Number, The Y value of the position.

--MoEntity.addtoentpos(Ent,Vec)
Returns the position of the inputed entity, with the addition of the inputed vector.
Ent: Entity, The entity your adding the vector to its position.
Vec: Vector, The vector your adding.

--MoEntity.findentinsquareradius()

--MoEntity.findentinradius()

--MoEntity.inline()

--MoEntity.traceline()

--MoEntity.functraceline()

--MoEntity.EntToKey()

--MoEntity.KeyToEnt()

--MoEntity.AddToLoop()

--MoEntity.RemoveFromLoop()

--MoEntity.GetDataFromLoop()

--MoEntity.CallLoop()

--MoEntity.LoopThis()

]]