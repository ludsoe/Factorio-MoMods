CurrentWeather.Weather = {Override=false,Name="Clear",CoolDown=0,Data={}}
WeatherFuncs,WeatherTables = {},{}

function EndWeather() end --Lets test this.

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherEvent",EndWeather)

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

function SetWeather(Weather)
	local W = CurrentWeather.Weather
	if W.Name ~= Weather.Name then
		if W.Data.EF then WeatherTables[W.Name].EF() end
		MoTimers.CreateTimer("MoWeatherEvent",math.random(Weather.DL,Weather.DH),1,false,EndWeather,Weather.Name)
		W.Name = Weather.Name
		W.Data = Weather
		W.Data.SF()

		--MoMisc.Print(game.localise(Weather.locale)[1])
	else
		W.Data = Weather
	end
end

function PickWeather()
	if CurrentWeather.SVars.NoWeather then
		SetWeather(WeatherTables["Clear"])
		return
	end

	if game.tick > CurrentWeather.Weather.CoolDown then
		for i,d in pairs(WeatherTables) do
			if d.R >= math.random(1,1000) then
				SetWeather(d)
				return
			end
		end
	end
	SetWeather(WeatherTables[CurrentWeather.Weather.Data.NT] or WeatherTables["Clear"])
end

function ManageWeather()
	if MoTimers.TimerTimeLeft("MoWeatherEvent")<=0 or (CurrentWeather.SVars.NoWeather and not CurrentWeather.Weather.Name~= "Clear") then
		PickWeather()
	else
		if CurrentWeather.Weather.Data.TF then
			CurrentWeather.Weather.Data.TF()
		end
	end
end

ModInterface.weathertimeleft = function() return MoTimers.TimerTimeLeft("MoWeatherEvent") or 0 end
ModInterface.forceweather = function(Want)
	if WeatherTables[Want] ~= nil then
		SetWeather(WeatherTables[Want])
		return true
	end
	return false	
end