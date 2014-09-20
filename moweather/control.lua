MLC = {
	Math=true,
	Timers=true,
	Misc=true,
	Entity=true,
	Debug=true
}
MoSave = require "mologiccore.base" 
Random = MoMisc.Random --Localise the psuedo random function.

MoConfig = {}
require "config"

WeatherTables={}

function CreateWeather(Name,EndFunc,StartFunc,ThinkFunk,NextWeather,locale,WindSpeed,LightDimper,DurHigh,DurLow,CoolDown,Chance)
	WeatherTables[Name]={
		Name=Name,
		EF=EndFunc,
		SF=StartFunc,
		TF=ThinkFunk,
		NT=NextWeather,
		locale=locale,
		W=WindSpeed,
		L=LightDimper,
		DH=DurHigh,
		DL=DurLow,
		C=CoolDown,
		R=Chance
	}	
end
require "weather.weather"

CurrentWeather = {}
local Save=function(T) DefaultSaveLoad(CurrentWeather,T) end
RegisterSaveTable("MoWeather",CurrentWeather,Save,true)
if Debug~=nil then Debug.RegisterTable("CurrentWeather",CurrentWeather) end

require "scripts.day-night"
require "scripts.wind"
require "scripts.weathers"

remote.addinterface("MoWeather", {	
	daytimeleft = function() return (CurrentWeather.Time.DayEnd-game.tick)/60 or 0 end,
	weathertimeleft = function() return MoTimers.TimerTimeLeft("MoWeatherEvent") or 0 end,

	forceweather = function(Want)
		if WeatherTables[Want] ~= nil then
			SetWeather(WeatherTables[Want])
			return true
		end
		return false	
	end
})

game.oninit(function() 
	game:freezedaytime()
	game.daytime=0.99
end) 

function CalculateValues()
	local W = CurrentWeather.Weather.Data
	
	local Wind = (CurrentWeather.Wind.Wind+W.W)/2
	local Sun = ((MoMath.Clamp(CurrentWeather.Time.Light-W.L,0,100)/100)/2)+0.49
	return Wind,Sun
end

local Length = MoConfig.DayLength
local TransMult = MoConfig.TransitionMult

MoTimers.CreateTimer("MoWeatherManage",0.1,0,false,function()
	DayNightCycle()
	ManageWind()
	ManageWeather()
	
	local Wind,Sun = CalculateValues()

	game.windspeed = MoMath.Approach(game.windspeed,Wind,0.001)
	game.daytime = MoMath.Approach(game.daytime,Sun,(Length/TransMult))
	
	if Debug~= nil then --Debugging Values.
		CurrentWeather.GameTime=game.daytime
		CurrentWeather.Tick = game.tick
		CurrentWeather.TimeLeft = (CurrentWeather.Time.DayEnd-game.tick)/60
	end
end)



















