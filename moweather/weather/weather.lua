local Random = MoMisc.Random --Localise the psuedo random function.

TimeTables = { --The Base WindSpeed and sunlight settings for each Time of the day.
	Day={Name="Day",W=0.024,L=0,NT="Night",D=600},
	Night={Name="Night",W=0.018,L=100,NT="Day",D=240}
}

--Rain Code
NextRSound = 0
local Rain = function()

	if NextRSound<=game.tick then
		NextRSound = game.tick+(4.3*60)
		MoMisc.PlaySound("rain-loop")
	end
	
	local CellSize = 16
	local CellDist = 6
	for X=1, CellSize do
		for Y=1, CellSize do
			game.createentity{name = "rain-drops", position=MoEntity.addtoplayerpos((X-(CellSize/2))*CellDist,(Y-(CellSize/2))*CellDist)}
		end
	end
end
local RF = function() MoTimers.CreateTimer("MoWeatherRainDrops",0.4,0,false,Rain) end
local RE = function() MoTimers.DeleteTimer("MoWeatherRainDrops")end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherRainDrops",Rain)

--ThunderStorm Code
local Storm = function() 
	if(Random(42,1,30)<8)then
		local Light = game.daytime
		game.daytime = 0.99
		DayLightOver=true
		MoMisc.PlaySound("thunder-roll") 
		MoTimers.CreateTimer("LightningFlash",0.2,1,false,function() game.daytime = Light DayLightOver = false end) 
	end 
end

local TF = function() RF() MoTimers.CreateTimer("MoWeatherStormThink",10,0,false,Storm) end
local TE = function() RE() MoTimers.DeleteTimer("MoWeatherStormThink") end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherStormThink",Storm)
--

--Empty Function Thats Empty
EF = function() end

--The Base Settings for each weather type.
CreateWeather("Clear",EF,EF,EF,"Clear","clear",0,0,31,30,0,10)
CreateWeather("Cloudy",EF,EF,EF,"Clear","cloudy",0.010,60,400,150,240,5)
CreateWeather("Windy",EF,EF,EF,"Clear","windy",0.053,10,300,250,180,3)
CreateWeather("ThunderStorm",TE,TF,EF,"Clear","thunder",0.043,80,300,250,300,3)
CreateWeather("RainStorm",RE,RF,EF,"Clear","rain",0.043,60,300,250,300,3)

