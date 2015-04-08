local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local Drones = Drones --Localise

Drones.CommandFuncs = {}

MoTimers.CreateTimer("HandleDroneAi",1,0,false,function()
	--MoMisc.Print("Drone Think")
	MoEntity.CallLoop("advcomdrones",function(data)
		local E = KTE(data.entity)
		if not E or E==nil or not E.valid then return false end
		--MoMisc.Print("Test")
		if data.extra.T < game.tick then
			--MoMisc.Print("Think")
			local Wait = 0
			local CMD = data.extra.CMD
			
			--Give the unit order if possible.
			if CMD.C~=nil then
				local Targ = CMD.D.T
				if not Targ or Targ and Targ.valid then --Hack around
					local Distance = (util.distance(CMD.P,E.position)/10) --Add calibration based on bot movement speed.
					E.setcommand(CMD.C) 
					data.extra.T = game.tick+(Distance*60)
				end
			end
			
			--Update the map where we are.
			E.force.chart{MoEntity.addtoentpos(E,{y=-5,x=-5}),MoEntity.addtoentpos(E,{y=5,x=5})}

			local CmdFunc = Drones.CommandFuncs[CMD.F or "None"]
			if CmdFunc then
				CmdFunc(E,CMD.D)
			end
			
			--Incase the drone was removed.
			if CMD.D.Removed then
				return false
			end
			
			--Swap the new command out.
			if CMD.D.NewCMD then
				data.extra.CMD = CMD.D.NewCMD
				if CMD.D.NewThk then
					data.extra.T = 0
				end
			end
		end
		
		return true
	end)
end)

MoTimers.CreateTimer("DroneManagePosts",1,0,false,function()
	MoEntity.CallLoop("combatroboticspost",function(data)
		local E = KTE(data.entity)
		if E==nil or not E.valid then return false end
		local Enemy = Drones.NearbyEnemy(E.position,200)
		if Enemy and Enemy.valid then --Add alive check if this is buggy
			local DCount = Drones.ContainsDrones(E)
			if DCount ~= nil then
				for I=1,DCount.A do
					Drones.SpawnDrone(E,DCount.T,Drones.GetAttackCommand(Enemy))
					E.getinventory(1).remove({name=DCount.T,count=1})
				end
			end
		end
		
		return true
	end)
end)

function Drones.CreateCommandFunc(Name,Function)
	Drones.CommandFuncs[Name]=Function
end

Drones.CreateCommandFunc("None",function(Drone,Data) end)
