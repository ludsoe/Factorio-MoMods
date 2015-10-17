MLC = {
	Math=true,
	Timers=true,
	Misc=true,
	Entity=true,
	Debug=false
}
MoSave = require "mologiccore.base" 
Random = MoMisc.Random --Localise the psuedo random function.

ModInterface,MoConfig = {},{}
require "config"

CurrentWeather = {}
CurrentWeather.SVars = {DayFroze=false,NoWeather=false,IgnoreLight=false,LightOver=false,WindOver=false,ModLight={Generic=0}}
local Save=function(T) DefaultSaveLoad(CurrentWeather,T) end
RegisterSaveTable("MoWeather",CurrentWeather,Save,true)
if Debug~=nil then Debug.RegisterTable("CurrentWeather",CurrentWeather) end

require "scripts.day-night"
require "scripts.wind"
require "scripts.weathers"

require "weather.weather"
	
local Length = MoConfig.DayLength
local TransMult = MoConfig.TransitionMult
	
function MoManageWeather()
	DayNightCycle() ManageWind() ManageWeather()
	
	local Wind,Sun = CalculateValues()
	
	if not CurrentWeather.SVars.WindOver then game.wind_speed = MoMath.Approach(game.wind_speed,Wind,0.001) end
	if not CurrentWeather.SVars.LightOver then game.daytime = MoMath.Approach(game.daytime,Sun,(Length/TransMult)) end
	
	if Debug~= nil then --Debugging Values.
		CurrentWeather.GameTime = game.daytime
		CurrentWeather.Tick = game.tick
		CurrentWeather.TimeLeft = (CurrentWeather.Time.DayEnd-game.tick)/60
	end
end

MoTimers.CacheFunction("MoWeatherManage",MoManageWeather)

function Intialize()
	game:freeze_daytime()
	game.daytime=0.99
	
	MoTimers.CreateTimer("MoWeatherManage",0.1,0,false,MoManageWeather)
end

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 

function CalculateValues()
	local W = CurrentWeather.Weather.Data
	
	if CurrentWeather.SVars.IgnoreLight then W = 0 end --No Weather lighting wanted...
	
	local ModLighting = 0
	for i,d in pairs(CurrentWeather.SVars.ModLight or {}) do
		ModLighting = ModLighting+d
	end
	
	local Wind = (CurrentWeather.Wind.Wind+W.W)/2
	local Sun = ((MoMath.Clamp((CurrentWeather.Time.Light-W.L)+ModLighting,0,100)/100)/2)+0.49
	return Wind,Sun
end

ModInterface.stopweather = function(bool) CurrentWeather.SVars.NoWeather = bool or false end
ModInterface.ignoreweatherlight = function(bool) CurrentWeather.SVars.IgnoreLight = bool or false end
ModInterface.freezedaytime = function(bool) CurrentWeather.SVars.DayFroze = bool or false end
ModInterface.overridedaylight = function(bool) CurrentWeather.SVars.LightOver = bool or false end
ModInterface.overridewindspeed = function(bool) CurrentWeather.SVars.WindOver = bool or false end

ModInterface.addlightchange = function(name,val)
	CurrentWeather.SVars.ModLight = CurrentWeather.SVars.ModLight or {}
	CurrentWeather.SVars.ModLight[name or "Generic"] = val or 0 
end

remote.add_interface("MoWeather", ModInterface)


















