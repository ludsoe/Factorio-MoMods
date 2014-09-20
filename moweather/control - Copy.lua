require "util"
require "defines"

MLC = {
	Math=true,
	Timers=true,
	Misc=true,
	Entity=true,
	Debug=true
}

WeatherTables={}
--TimeTables = {}

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

MoSave = require "mologiccore.base"
require "weather.weather"

CurrentWeather = {}
DayLightOver = false

if Debug~=nil then 
	Debug.RegisterTable("CurrentWeather",CurrentWeather) 
end

--Bah Stuff
TimeofDayChange = game.generateeventname()
WeatherChange = game.generateeventname()
remote.addinterface("MoWeather", {
	gettimeeventkey = function() return TimeofDayChange end,
	getweathereventkey = function() return WeatherChange end,

	curtimename = function() return glob.timeofday.Name end,
	curweathername = function() return glob.Weather.Name end,
	
	--Returns the time left in the current day event, in seconds.
	daytimeleft = function() return (glob.tod.daywait-game.tick)/60 or 0 end, --Exmample to Call = remote.call("MoWeather", "daytimeleft")
	weathertimeleft = function() return MoTimers.TimerTimeLeft("MoWeatherEvent") or 0 end,
	
	forcetimeofday = function(Want)
		if TimeTables[Want] ~= nil then
			SetTime(TimeTables[Want])
			return true
		end
		return false
	end,
	
	forceweather = function(Want)
		if WeatherTables[Want] ~= nil then
			SetWeather(WeatherTables[Want])
			return true
		end
		return false	
	end
})

game.oninit(MoWInit) --If we start a new game, init MoWeather right off the bat.
function MoWInit()
	glob.moweather = true
	glob.curwind,glob.windwait,glob.weathercooldown,glob.weatherevent = BaseWind,0,0,{}
	SetTime(TimeTables["Day"])
	if not glob.Weather then
		SetWeather(WeatherTables["Clear"])
	end
	--MoMisc.Print("MoWInit!")
end

local Random = MoMisc.Random --Localise the psuedo random function.


--Handles the random wind fluxs.
function ManageWind()
	rand = Random(54,1,20)
	if rand>10 then X=0.001 else X=-0.001 end
	glob.curwind = MoMath.Clamp(math.abs(glob.tod.corewind+(Random(100,1,20)*X)),glob.tod.corewind-0.1,glob.tod.corewind+0.1)
end

--Ends the weather.
function EndWeather(Weather)
	glob.weathercooldown = game.tick+(WeatherTables[Weather].C*60)
	PickWeather()
end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherEvent",EndWeather)

function SetWeather(Weather)
	if glob.Weather ~= Weather.Name then
		if CurrentWeather.EF then CurrentWeather.EF() end
		MoTimers.CreateTimer("MoWeatherEvent",Random(350,Weather.DL,Weather.DH),1,false,EndWeather,Weather.Name)
		glob.Weather = Weather.Name
		CurrentWeather = Weather
		CurrentWeather.SF()
		game.player.print(game.gettext(Weather.locale))
	else
		CurrentWeather = Weather
	end
end

function PickWeather()
	if game.tick > glob.weathercooldown then
		for i,d in pairs(WeatherTables) do
			if d.R >= Random(500,1,1000) then
				SetWeather(d,true)
				return
			end
		end
	end
	SetWeather(WeatherTables[CurrentWeather.NT] or WeatherTables["Clear"])
end

function ManageWeather()
	if not glob.Weather or MoTimers.TimerTimeLeft("MoWeatherEvent")<=0 then
		PickWeather()
	else
		CurrentWeather.TF()
	end
end

function Finalise() --Converts the numbers from MoWeather into numbers the game engine understands.
	local Wind = (glob.curwind+CurrentWeather.W)/2
	local Sun = (MoMath.Clamp(glob.tod.sunlight+CurrentWeather.L,0,100)/100)/2
	return Wind,Sun
end

--Sets the time.
function SetTime(Tyme)
	glob.timeofday = Tyme
	glob.tod = {daywait=(Tyme.D*60)+game.tick,corewind=Tyme.W,sunlight=Tyme.L}
	game.raiseevent(TimeofDayChange, Tyme)
	--game.player.print("It is now "..Tyme.Name.." for "..Tyme.D.." secs")
end

--Handles the time.
function ManageTimes()
	if game.tick > glob.tod.daywait then
		local Tyme = TimeTables[glob.timeofday.NT]
		SetTime(Tyme)
	end
end

MoTimers.CreateTimer("MoWeatherInit",0,1,false,function()
	if not glob.moweather then MoWInit() end
	SetWeather(WeatherTables[glob.Weather] or WeatherTables["Clear"])
	ManageWind()
	ManageTimes()
	ManageWeather()
	MoWeatherInited=true
end)

MoTimers.CreateTimer("MoWeatherManageThread",0.1,0,true,function()
	if not MoWeatherInited then return end
	ManageWind()
	ManageTimes()
	ManageWeather()
	Wind,Sun = Finalise()

	if not DayLightOver then
		game.windspeed = MoMath.Approach(game.windspeed,Wind,0.001)
		game.daytime = MoMath.Approach(game.daytime,Sun,0.002)
	end
end)

--[[
MoTimers.CreateTimer("Debug",1,0,false,function()	
	--game.player.print("DayTime Left: "..(glob.tod.daywait-game.tick)/60)
	--game.player.print("TimeLeftWeather: "..MoTimers.TimerTimeLeft("MoWeatherEvent"))
	--game.player.print("CoolDownLeft: "..MoMath.Clamp((glob.weathercooldown-game.tick)/60,0,100000))
	--game.player.print("DayLightDebug: "..game.daytime.." : "..((MoMath.Clamp(glob.tod.sunlight+glob.Weather.L,0,100)/100)/2).." : ")
end)
]]
















