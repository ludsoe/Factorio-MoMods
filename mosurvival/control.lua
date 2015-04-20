require "util"
require "defines"

MLC = {
	Math=true,
	Timers=true,
	Misc=true,
	Entity=true
}

MoSave = require "mologiccore.base"
local KTE = MoEntity.KeyToEnt

ModInterface,MoConfig = {},{}
require "config"

MoSurvival = {Version = 1,Players={}}
Foods = {}
local Save=function(T) DefaultSaveLoad(MoSurvival,T) end
RegisterSaveTable("MoSurvival",MoSurvival,Save,true)
if Debug~=nil then Debug.RegisterTable("MoSurvival",MoSurvival) end

require "scripts.foods"

function UpdateGuis(ply,dat)
	local Per = MoMath.Round((dat.H/MoConfig.MaxHunger)*100)
	ply.gui.left["MoSurvival"]["hunger-value"].caption = tostring(Per).."%"
end

function RegisterPlayer(index,entity)
	if entity.controllertype ~= defines.controllers.character then return end
	MoSurvival.Players[index]={
		LD=0,
		H=MoConfig.MaxHunger
	}

	local frame = entity.gui.left.add({type="frame", name="MoSurvival", direction="horizontal"})
	frame.add({type="label", name="caption-label", caption="Hunger:"})
	frame.add({type="label", name="hunger-value", caption=tostring(100).."%"})
end

--Lets put all the proper variables we will use in a player table as they spawn.
MoEntity.SubscribeOnPlayerSpawn("OnSpawnPlayer",function(index,entity)
	RegisterPlayer(index,entity)
	
	--Insert all the items defined in config.lua
	for i,d in pairs(MoConfig.ItemsOnSpawn) do
		entity.getinventory(defines.inventory.playermain).insert({name=d.N, count=d.A})
	end
end)

MoTimers.CreateTimer("LoopPlayers",0.1,0,false,function()
	MoEntity.loopplayers(function(i,d)
		local Dat = MoSurvival.Players[i] --Fetch the players data....
		if not Dat then RegisterPlayer(i,d) return --[[No Data table...]] end
		
		UpdateGuis(d,Dat)
		local Damage = 0
		
		local Has,Food = HasFood(d,Dat)
		if Has then
			EatFoodItem(d,Dat,Food)
		end
		
		if Dat.H > 0 then
			Dat.H = Dat.H-MoConfig.HungerDecay -- Decrease the Hunger value...
		else
			Dat.H = 0
			Damage = Damage + 5
		end
		
		if Damage>0 and Dat.LD < game.tick then
			Dat.LD = game.tick+(0.5*60)
			d.character.damage(Damage, d.force, "survival") --FEEEEEEED MEEEEEE!!!!
		end
	end)
end)

remote.addinterface("MoSurvival", ModInterface)
