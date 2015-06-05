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
	ply.gui.left["MoSurvival"]["MoHunger"]["labelvalue"].caption = tostring(Per).."%"
	
	local TotalHunger = dat.H+GetTotalFoodPoints(ply)
	local TL = MoMath.Round((TotalHunger/MoConfig.HungerDecay)/10)
	ply.gui.left["MoSurvival"]["TimeLeft"]["labelvalue"].caption = MoMath.SecondsToClock(TL)
end

function GenerateGui(index,entity)
	if entity.gui.left["MoSurvival"] then entity.gui.left["MoSurvival"].destroy() end
	
	local base = entity.gui.left.add({type="frame", name="MoSurvival", direction="vertical"})
	
	local frame = entity.gui.left["MoSurvival"].add({type="frame", name="MoHunger", direction="horizontal"})
	frame.add({type="label", name="label", caption="Hunger:"})
	frame.add({type="label", name="labelvalue", caption=tostring(100).."%"})
	
	frame = entity.gui.left["MoSurvival"].add({type="frame", name="TimeLeft", direction="horizontal"})
	frame.add({type="label", name="label", caption="TimeLeft:"})
	frame.add({type="label", name="labelvalue", caption=tostring(0)})
end

local DataValue = 1
function ResetData(index,entity) 
	MoSurvival.Players[index]={
		DV=DataValue,
		LD=0,
		LHS=0,
		H=MoConfig.MaxHunger
	}
end

function RegisterPlayer(index,entity)
	if entity.controllertype ~= defines.controllers.character then return end
	ResetData(index,entity)
	GenerateGui(index,entity) 
end

--Lets put all the proper variables we will use in a player table as they spawn.
MoEntity.SubscribeOnPlayerSpawn("OnSpawnPlayer",function(index,entity)
	RegisterPlayer(index,entity)
	
	--Insert all the items defined in config.lua
	for i,d in pairs(MoConfig.ItemsOnSpawn) do
		entity.getinventory(defines.inventory.playermain).insert({name=d.N, count=d.A})
	end
end)

MoEntity.SubscribeOnPlayerKilled("ResetHunger",function(index,player,entity)
	ResetData(index,entity)
end)

MoTimers.CreateTimer("LoopPlayers",0.1,0,false,function()
	MoEntity.loopplayers(function(i,d)
		local Dat = MoSurvival.Players[i] --Fetch the players data....
		if not Dat or Dat.DV~=DataValue then RegisterPlayer(i,d) return --[[No Data table...]] end
		
		UpdateGuis(d,Dat)
		local Damage = 0
		
		local Has,Food = HasFood(d,Dat)
		if Has then
			EatFoodItem(d,Dat,Food)
		end
		
		if Dat.H > 0 then
			Dat.H = Dat.H-MoConfig.HungerDecay -- Decrease the Hunger value...
			if Dat.H < MoConfig.MaxHunger/5 and Dat.LHS < game.tick then
				Dat.LHS = game.tick+(240*60)
				MoMisc.PlaySound("stomach-growl",d.position)
			end
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

ModInterface.GetMaxHunger = function()
	return MoConfig.MaxHunger
end

ModInterface.GetHungerofPlayer = function(index)
	local Dat = MoSurvival.Players[index]
	if not Dat then return 0 end
	return Dat.H
end

ModInterface.SetHungerofPlayer = function(index,value)
	local Dat = MoSurvival.Players[index]
	if Dat then 
		Dat.H = value
	end
end

remote.addinterface("MoSurvival", ModInterface)
