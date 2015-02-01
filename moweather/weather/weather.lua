--Rain Code
function WeatherFuncs.RainThink()
	if (CurrentWeather.NextRSound or 0)<=game.tick then
		CurrentWeather.NextRSound = game.tick+(4.3*60)
		for i,d in pairs(game.players) do	
			MoMisc.PlaySound("rain-loop",game.getplayer(i).position)
		end
	end
	
	for i,d in pairs(game.players) do	
		local CellSize = 8
		local CellDist = 6
		for X=1, CellSize do
			for Y=1, CellSize do
				game.createentity{name = "rain-drops", position=MoEntity.addtoplayerpos(i,(X-(CellSize/2))*CellDist,(Y-(CellSize/2))*CellDist)}
			end
		end
	end
end

function WeatherFuncs.RainStart() MoTimers.CreateTimer("MoWeatherRainDrops",0.4,0,false,WeatherFuncs.RainThink) end
function WeatherFuncs.RainEnd() MoTimers.DeleteTimer("MoWeatherRainDrops") end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherRainDrops",WeatherFuncs.RainThink)

--ThunderStorm Code
function WeatherFuncs.StormThink() 
	if(math.random(1,30)<8)then
		local Light = game.daytime
		game.daytime = 0.99
		
		for i,d in pairs(game.players) do
			MoMisc.PlaySound("thunder-roll",game.getplayer(i).position) 
		end
		
		MoTimers.CreateTimer("LightningFlash",0.2,1,false,function() game.daytime = Light end) 
	end 
end

function WeatherFuncs.StormStart() WeatherFuncs.RainStart() MoTimers.CreateTimer("MoWeatherStormThink",10,0,false,WeatherFuncs.StormThink) end
function WeatherFuncs.StormEnd() WeatherFuncs.RainEnd() MoTimers.DeleteTimer("MoWeatherStormThink") end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherStormThink",WeatherFuncs.StormThink)
--

--Empty Function Thats Empty
EF = function() end

--The Base Settings for each weather type.
--CreateWeather("Clear",EF,EF,EF,"Clear","clear",0,0,31,30,0,10)
--CreateWeather("Cloudy",EF,EF,EF,"Clear","cloudy",0.010,60,400,150,240,5)
--CreateWeather("Windy",EF,EF,EF,"Clear","windy",0.053,10,300,250,180,3)
--CreateWeather("ThunderStorm",WeatherFuncs.StormEnd,WeatherFuncs.StormStart,EF,"Clear","thunder",0.043,80,300,250,300,3)
--CreateWeather("RainStorm",WeatherFuncs.RainEnd,WeatherFuncs.RainStart,EF,"Clear","rain",0.043,60,300,250,300,3)

CreateWeather("Clear",EF,EF,EF,"Clear","clear",0,0,2,1,0,10)
CreateWeather("Cloudy",EF,EF,EF,"Clear","cloudy",0.010,60,10,5,240,5)
CreateWeather("Windy",EF,EF,EF,"Clear","windy",0.053,10,10,5,180,3)
CreateWeather("ThunderStorm",WeatherFuncs.StormEnd,WeatherFuncs.StormStart,EF,"Clear","thunder",0.043,80,30,20,300,3)
CreateWeather("RainStorm",WeatherFuncs.RainEnd,WeatherFuncs.RainStart,EF,"Clear","rain",0.043,60,30,20,300,3)
--CreateWeather(Name,EndFunc,StartFunc,ThinkFunk,NextWeather,locale,WindSpeed,LightDimper,DurHigh,DurLow,CoolDown,Chance)
