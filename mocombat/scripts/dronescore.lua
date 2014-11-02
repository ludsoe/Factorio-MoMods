local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD,DefS = defines.command,defines.distraction,defines.groupstate

MaxDrones = 10
local CombatDroneName = "attack-drone"

require "drones.combat"
require "drones.utility"

function OnCRPBuilt(entity)
	MoEntity.AddToLoop("croboport",entity,{G={},C=1})
end

function OnCRCCBuilt(entity)
	MoEntity.AddToLoop("commandposts",entity,{P={}})
end

MoEntity.SubscribeOnBuilt("combat-roboport-smart","combatroboport",OnCRPBuilt)
MoEntity.SubscribeOnBuilt("combat-drone-wagon","combatrobowagon",OnCRPBuilt)

MoEntity.SubscribeOnBuilt("combat-command-tower-smart","combatcommtower",OnCRCCBuilt)

function SpawnDrone(E,G)
	local Drones = E.getitemcount(CombatDroneName)
	if Drones > 0 and not E.tobedeconstructed(E.force) then
		local V = game.findnoncollidingposition(CombatDroneName, E.position, 10, 1)
		
		local Drone=game.createentity{name = CombatDroneName, position=V}
		Drone.force=E.force
		MoEntity.AddToLoop("combatrobots",Drone,{NT=0,Post=E})
		table.insert(G,RegKey(Drone))
		E.getinventory(1).remove({name=CombatDroneName,count=1})
		return true
	else
		return false
	end
end

function StoreDrone(E,G)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then return false end
		if E.caninsert({name=CombatDroneName,count=1}) then
			if util.distance(D.position,E.position) < 5 then
				E.insert({name=CombatDroneName,count=1})
				MoEntity.RemoveFromLoop("combatrobots",D)
				D.destroy()
				return false --We stored the drone, lets remove it from the table.
			end
		end
		return true
	end)	
end

function CommandDrones(G,O)
	MoEntity.LoopThis(G,function(ent)
		local D = KTE(ent)
		if D==nil or not D.valid then 
			MoEntity.RemoveFromLoop("combatrobots",D)
			return false 
		end
		
		D.force.chart{MoEntity.addtoentpos(D,{y=-5,x=-5}),MoEntity.addtoentpos(D,{y=5,x=5})}
		
		local Dat = MoEntity.GetDataFromLoop("combatrobots",D)
		if Dat==nil then
			MoEntity.AddToLoop("combatrobots",D,{NT=0})
		else
			if Dat.extra.NT<=game.tick then
				local Distance = (util.distance(O.Command.P,D.position)/10)
				Dat.extra.Dis = Distance
				Dat.extra.NT = game.tick+(Distance*60)
				D.setcommand(O.Command.C)
			end
		end
		return true
	end)
	
	local CF = O.ComFunc
	if CF~=nil then
		if CF.N=="Collect" then
			CF.F(CF.T,CF.P,G)
		elseif CF.N=="Store" then
			CF.F(CF.P,G)
		end
	end
end

function GetOrdersFromInv(C,P)
	local Tab = {S=true,A=false,P=false,MS=MaxDrones,Post=RegKey(P),C=C.position,Artifacts={}}
	Tab.R = 40+(C.getitemcount("drone-orders-rangeboost")*10)
	if C.getitemcount("drone-orders-player") > 0 then
		local Spot = C.position
		Tab.PE=MoEntity.closestplayer(Spot.x,Spot.y)
		Tab.P = true
	end
	if C.getitemcount("drone-orders-artifact") > 0 then
		Tab.A=true
	end
	return Tab
end

function GetOrdersFromAI(C,P,N,D)
	local Orders = GetOrdersFromInv(C,P)
	
	if Orders.P and util.distance(Orders.C,Orders.PE.position) < Orders.R then
		if AssistPlayer(Orders) then return Orders end
	end
	
	if ProtectArea(Orders) then return Orders end
	
	if Orders.A and N==1 then
		if ArtifactScan(Orders,D) then 
			return Orders 
		end
	end

	ReturnToBase(Orders)
	return Orders
end

function ManageDrones(CP,P)
	local LA = 1
	MoEntity.LoopThis(P,function(dat)
		local CR = KTE(dat.entity)
		if not CR or not CR.valid then return false end
		local G = dat.extra.G
		local Orders = GetOrdersFromAI(CP,CR,LA,dat.extra)

		while Orders.S and #G < Orders.MS do 
			if not SpawnDrone(CR,G) then break end 
		end
		ArtifactFinish(Orders,LA)
		CommandDrones(G,Orders) LA=LA+1
		return true
	end)
end

function CommandPostFind(Key,entity,data)
	local Command=MoEntity.findentinsquareradius(entity.position,10,"combat-roboport-smart")
	MoEntity.LoopThis(Command,function(ent)
		local res = MoEntity.GetDataFromLoop("croboport",ent)
		
		if res==nil then return end
		if res.extra.CP and res.extra.CP.valid then return end
		
		res.extra.CP = Key
		data.P[res.entity] = res
	end)
end

--Lets Register into the MoToolBar :D
if remote.interfaces.MoToolBar and remote.interfaces.MoToolBar.addbutton then
	remote.call("MoToolBar", "addbutton","detectcr","Detect Combat Robotics","MoCombat","detectcombatrobot","MoCombat","Detect Combat Robotics Entitys")
end

ModInterface.detectcombatrobot = function()
	game.player.print("Detecting Combat Robotics!")
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-roboport-smart"),OnCRPBuilt)
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-drone-wagon"),OnCRPBuilt)	
	
	MoEntity.LoopThis(MoEntity.findentinsquareradius(MoEntity.getplayerpos(),100,"combat-command-tower-smart"),OnCRCCBuilt)
end

--This timer will manage all the combat robotics functions.
MoTimers.CreateTimer("Combat-RobotPorts",0.5,0,false,function()
	MoEntity.CallLoop("croboport",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		
		local CMD = KTE(data.extra.CP)
		if CMD~=nil and CMD.valid then return true end
		ManageDrones(DE,{data})
		
		return true
	end)
	
	MoEntity.CallLoop("commandposts",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		
		CommandPostFind(data.entity,DE,data.extra)
		ManageDrones(DE,data.extra.P)	
		return true
	end)
end)









