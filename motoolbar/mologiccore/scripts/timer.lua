GetTable=function()
	MoTimers=MoTimers or {}
	return MoTimers
end

local Timers = {} --Localise for speed.
local WaitingList = {} --The waiting list while we load our tables.
local SetTab = function(Table) for i,d in pairs(Table) do Timers[d.Name]=d end end
RegisterSaveTable("MoTimers",Timers,SetTab,false)
if MLC.Debug then Debug.RegisterTable("Timers",Timers) end
local Functions = {}

local function MergeWaitingList()
	for i,d in pairs(WaitingList) do
		if Timers[i]~=nil and d.O or Timers[i]==nil then
			Timers[i]=util.table.deepcopy(d.T)
		end
	end
	WaitingList={}
end

FuncRegister("CacheFunction",function(Name,Function)
	Functions["CB"..Name]=Function
end)

FuncRegister("CreateTimer",function(Name,Length,Repeat,Over,CallBack,Data)
	if IsLoaded then
		if Timers[Name]~=nil and Over then return end --If we are given the dont overright flag, dont continue.
		Timers[Name]={
			Name=Name, --Timer name/ID
			Repeat=Repeat, --How many times the timer repeats.
			Nxt=game.tick+(Length*60), --When the timer is called again.
			Dur=Length, --Internal Value for timer length.
			Del=false, --Internal Value for trash management.
			CallBack="CB"..Name, --CallBack Function.
			Data=Data --Extra Data to pass onto the callback.
		}
		Functions["CB"..Name]=CallBack
	else
		WaitingList[Name]={
			O=Over,T={
				Name=Name, --Timer name/ID
				Repeat=Repeat, --How many times the timer repeats.
				Nxt=game.tick+(Length*60), --When the timer is called again.
				Dur=Length, --Internal Value for timer length.
				Del=false, --Internal Value for trash management.
				CallBack="CB"..Name, --CallBack Function.
				Data=Data --Extra Data to pass onto the callback.
			}
		}	
		Functions["CB"..Name]=CallBack
	end
	--game.player.print("Timer Created: "..Name)
end)

FuncRegister("DeleteTimer",function(Name)
	--game.player.print("Timer Deleted: "..Name)
	Timers[Name]=nil
end)

FuncRegister("TimerTimeLeft",function(Name) 
	if Timers[Name] ~= nil then
		local Return = (Timers[Name].Nxt-game.tick)/60
		--if Return > 0 then
			return Return
		--end
	end
	return 0
end)

FuncRegister("GetTimers",function() return Timers end)

game.onevent(defines.events.ontick, function(event) --Timer Master Think.
	if not IsLoaded then MLCSaveFix() MergeWaitingList() return end
	for i,d in pairs(Timers) do
		if game.tick >= d.Nxt then --Do we run this timer?
			--game.player.print("Timering: "..d.Name)
			if d.Repeat > 1 or d.Repeat == 0 then
				if d.Repeat>1 then d.Repeat = d.Repeat-1 end
				d.Nxt = game.tick+(d.Dur*60)--It keeps going... and going.
			else
				d.Del=true--Set the timer to be deleted.
			end
			if Functions["CB"..d.Name] ==nil then
				d.Del = true
				game.player.print("Warning: "..d.Name.." doesnt have a function!")
			else
				Functions["CB"..d.Name](d.Data) --Call The function we were told to.
			end
		end
		if d.Del == true then
			MoTimers.DeleteTimer(d.Name)
		end
	end
end)
