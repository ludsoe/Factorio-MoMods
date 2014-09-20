CurrentWeather.Time = {Override=false,DayStart=0,DayTurn=0,DayEnd=0,Light=100,Name="Day"}

local Length = MoConfig.DayLength
local NightRatio = MoConfig.DayNightRatio

function DayNightCycle()
	local T = CurrentWeather.Time
	
	local Tick = game.tick
	if CurrentWeather.Time.DayEnd <= Tick then
		local DayLength=((Length*60)*60)
		T.DayEnd = Tick+DayLength
		T.DayTurn = Tick+(DayLength-(DayLength*(NightRatio/100)))
		T.DayStart = Tick
	else
		if T.DayTurn>=Tick then
			T.Light = 100
			T.Name="Day"
		else
			T.Light = 0
			T.Name="Night"
		end
	end
end