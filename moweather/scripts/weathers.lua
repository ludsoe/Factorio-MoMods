CurrentWeather.Weather = {Override=false,Name="Clear",CoolDown=0,Data={}}

--Ends the weather.
function EndWeather(Weather)
	CurrentWeather.Weather.CoolDown = game.tick+(WeatherTables[Weather].C*60)
	PickWeather()
end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherEvent",EndWeather)

function SetWeather(Weather)
	local W = CurrentWeather.Weather
	if W.Name ~= Weather.Name then
		if W.Data.EF then WeatherTables[W.Name].EF() end
		MoTimers.CreateTimer("MoWeatherEvent",Random(350,Weather.DL,Weather.DH),1,false,EndWeather,Weather.Name)
		W.Name = Weather.Name
		W.Data = Weather
		W.Data.SF()
		game.player.print(game.gettext(Weather.locale))
	else
		W.Data = Weather
	end
end

function PickWeather()
	if game.tick > CurrentWeather.Weather.CoolDown then
		for i,d in pairs(WeatherTables) do
			if d.R >= Random(500,1,1000) then
				SetWeather(d)
				return
			end
		end
	end
	SetWeather(WeatherTables[CurrentWeather.Weather.Data.NT] or WeatherTables["Clear"])
end

function ManageWeather()
	if MoTimers.TimerTimeLeft("MoWeatherEvent")<=0 then
		PickWeather()
	else
		CurrentWeather.Weather.Data.TF()
	end
end