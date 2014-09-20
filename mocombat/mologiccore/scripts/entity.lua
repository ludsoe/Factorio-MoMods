GetTable=function()
	MoEntity=MoEntity or {}
	return MoEntity
end

------------Entity Related Events------------
local Subscribed = {Built={},Death={}}
if MLC.Debug then Debug.RegisterTable("Subscribed",Subscribed) end

--Allows you to subscribe a function to be called when a entity is built.
FuncRegister("SubscribeOnBuilt",function(Ent,Name,Func)
	if Subscribed.Built[Ent] == nil then Subscribed.Built[Ent] = {} end
	Subscribed.Built[Ent][Name]={Name=Name,Func=Func}
end)

--Allows you to remove a function from being called when a entity is built.
FuncRegister("UnSubscribeOnBuilt",function(Ent,Name) 
	Subscribed.Built[Ent][Name]=nil
end)

--Allows you to subscribe a function to be called when a entity is killed.
FuncRegister("SubscribeOnDeath",function(Ent,Name,Func)
	if Subscribed.Death[Ent] == nil then Subscribed.Death[Ent] = {} end
	Subscribed.Death[Ent][Name]={Name=Name,Func=Func}
end)

--Allows you to remove a function from being called when a entity is killed.
FuncRegister("UnSubscribeOnDeath",function(Ent,Name) 
	Subscribed.Death[Ent][Name]=nil
end)

--This does all the hard work.
local function EventHandler(event)
	local Event = event.name
	if Event == defines.events.onbuiltentity then
		local Name = event.createdentity.name
		if Subscribed.Built[Name] then
			for i,d in pairs(Subscribed.Built[Name]) do
				d.Func(event.createdentity)
			end
		end
	elseif Event == defines.events.onentitydied then
		local Name = event.entity.name
		if Subscribed.Death[Name] then
			for i,d in pairs(Subscribed.Death[Name]) do
				d.Func(event.entity)
			end
		end		
	end
end
game.onevent(defines.events.onbuiltentity, EventHandler)
game.onevent(defines.events.onentitydied, EventHandler)

------------Player Related------------
--Shortcut to get the players positioning.
FuncRegister("getplayerpos",function()
	return game.getplayer().position
end)

--Adds another vector to the players position, and returns the result.
FuncRegister("addtoplayerpos",function(X,Y)
	local Pos = game.getplayer().position
	return {Pos.x+X,Pos.y+Y}
end)

-------------Vector Functions----------
--Finds a certain entity in a square area around a point.
FuncRegister("findentinsquareradius",function(Vec,Rad,Ent)
	local X,Y = ((Vec.X or Vec.x)), ((Vec.Y or Vec.y))
	return game.findentitiesfiltered{area = {{X-Rad, Y-Rad}, {X+Rad, Y+Rad}}, name=Ent}
end)

--Finds a certain entity in a circular area around a point.
FuncRegister("findentinradius",function(Vec,Rad,Ent)
end)

--Returns if 2 vectors are inline.
FuncRegister("inline",function(Vec,Vec2)
	return (Vec.x or Vec.X) == (Vec2.x or Vec2.X) or (Vec.y or Vec.Y) == (Vec2.y or Vec2.Y)
end)

--Returns if a entity can be placed along the entirety of two points.
--Warning, Requires MoMath loaded to operate.
FuncRegister("traceline",function(Vec,Vec2,Ent)
	local V,A = Vec,MoMath.Approach
	for I=1, util.distance(Vec,Vec2) do
		V={x=A(V.x,Vec2.x,1),y=A(V.y,Vec2.y,1),1}
		if not game.canplaceentity({name=Ent, position = V}) then
			return false
		end
	end
	return true
end)

FuncRegister("functraceline",function(Vec,Vec2,Ent,Func)
	local V,A = Vec,MoMath.Approach
	for I=1, util.distance(Vec,Vec2) do
		V={x=A(V.x,Vec2.x,1),y=A(V.y,Vec2.y,1)}
		if game.canplaceentity({name=Ent, position = V}) then
			if Func(V) then
				return true
			end
		end
	end
	return false
end)

------------Entity Loop Aid------------
--Oh God so much ugly code!!!
local Loops,Entitys = {},{Ents={}}
if MLC.Debug then Debug.RegisterTable("MLALoops",Loops) Debug.RegisterTable("MLAEnts",Entitys) end
local SetTab,SetTab2 = function(Table) DefaultSaveLoad(Loops,Table) end,function(Table) DefaultSaveLoad(Entitys,Table) end
RegisterSaveTable("MoLoopAid",Loops,SetTab,false)
RegisterSaveTable("MLAEnts",Entitys,SetTab2,false)

function GetKey(Ent)
	for i,d in pairs(Entitys.Ents) do
		if d.valid then
			if d.equals(Ent) then
				return i 
			end
		else
			Entitys.Ents[i]=nil
		end
	end
	
	return 0
end

local Letters = {"A","B","C","D","E","F","G","H","I","J","K","L","O","M","N","P","Q","R","S","T","U","V","W","X","Y","Z"}
function GenKey() local Key = "" for I=1,3 do Key=Key..Letters[math.random(1,#Letters)] end return Key end

function RandKey()
	local Key = GenKey()..tostring(math.random(1,999))
	if Entitys.Ents[Key] then
		return RandKey()
	end
	return Key
end

function RegKey(Ent)
	local Key = GetKey(Ent)
	if Key==0 then
		Key = RandKey()
		Entitys.Ents[Key]=Ent
	end
	return Key
end
FuncRegister("EntToKey",RegKey)

function GetEnt(Key) return Entitys.Ents[Key] end
FuncRegister("KeyToEnt",GetEnt)

FuncRegister("AddToLoop",function(Name,Ent,Ex)
	if not Loops[Name] then Loops[Name] = {Name=Name,Ents={}} end
	local Key = RegKey(Ent)
	Loops[Name].Ents[Key]={entity=Key,extra=Ex}
end)

FuncRegister("RemoveFromLoop",function(Name,Ent)
	if not Loops[Name] then return end
	local Key = GetKey(Ent)
	if Key then
		Loops[Name].Ents[Key]=nil
	end
end)

FuncRegister("GetDataFromLoop",function(Name,Ent)
	if not Loops[Name] then return end
	local Key = GetKey(Ent)
	if Key then
		return Loops[Name].Ents[Key]
	end
end)

FuncRegister("CallLoop",function(Name,Func)
	local Loop=Loops[Name]
	if not Loop then return end
	for i,d in pairs(Loop.Ents) do
		if not Func(d) then
			Loop.Ents[i]=nil
		end
	end
end)

FuncRegister("LoopThis",function(Table,Func)
	for i,d in pairs(Table) do
		if not Func(d) then
			Table[i]=nil
		end
	end
end)

