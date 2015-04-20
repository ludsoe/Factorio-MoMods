CurrentWeather.Time = {Override=false,DayStart=0,DayTurn=0,DayEnd=0,Light=100,Name="Day"}

local Length = MoConfig.DayLength
local NightRatio = MoConfig.DayNightRatio

function DayNightCycle()
	local T = CurrentWeather.Time
	
	if T.DayFroze then return end
	
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

ModInterface.getdaystart = function() return CurrentWeather.Time.DayStart end
ModInterface.getdayend = function() return CurrentWeather.Time.DayEnd end
ModInterface.getdayturn = function() return CurrentWeather.Time.DayTurn end
ModInterface.daytimeleft = function() return (CurrentWeather.Time.DayEnd-game.tick)/60 or 0 end
ModInterface.getdaylight = function() return CurrentWeather.Time.Light end

ModInterface.setdaylight = function(light) CurrentWeather.Time.Light = light or 0 end
