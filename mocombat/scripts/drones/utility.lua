local KTE,RegKey = MoEntity.KeyToEnt,MoEntity.EntToKey
local DefC,DefD = defines.command,defines.distraction
local Drones = Drones --Localise

--Find the closest combat robotics port, or players if theres no ports.
function Drones.FindClosestPort(E)
	local Pos = E.position
	local Closest = nil
	local Dist = 999999999999
	
	MoEntity.CallLoop("combatroboticspost",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		if DE.surface ~= E.surface then return false end
		local MyDist = util.distance(DE.position,Pos)
		if Dist > MyDist then
			Dist = MyDist
			Closest = DE
		end
		
		return true
	end)
	
	if Closest~=nil then
		return Closest
	end
end

function Drones.FindClosestEmptyPort(E)
	local Pos = E.position
	local Closest = nil
	local Dist = 999999999999
	
	MoEntity.CallLoop("combatroboticspost",function(data)
		local DE = KTE(data.entity)
		if DE==nil or not DE.valid then return false end
		if DE.surface ~= E.surface then return false end
		local MyDist = util.distance(DE.position,Pos)
		if Dist > MyDist then
			if DE.can_insert({name=E.name,count=1}) then
				Dist = MyDist
				Closest = DE
			end
		end
		
		return true
	end)
	
	if Closest~=nil then
		return Closest
	end
end

--Check for the nearby enemys.
function Drones.NearbyEnemy(Surface,Pos,Rad)
	local Scan = Surface.find_nearest_enemy{position=Pos, max_distance=Rad}

	if Scan~=nil and Scan.valid then
		return Scan
	end	
end