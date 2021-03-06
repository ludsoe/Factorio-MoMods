--Rain Code
local WeatherSave = {RainAnimation={}}
local SetTab = function(Table) DefaultSaveLoad(WeatherSave,Table) end
RegisterSaveTable("WeatherData",WeatherSave,SetTab,false)

function CleanupStrayBits()
	for i,d in pairs(WeatherSave.RainAnimation) do
		if not d.B or not d.B.valid then
			if d.A and d.A.valid then
				d.A.destroy()
				d.B.destroy()
			end
			WeatherSave.RainAnimation[i] = nil
		end
	end
end

function HandleRainSound()
	MoEntity.loopplayers(function(i,d)
		local Surface = d.surface
		if not WeatherSave.RainAnimation[i] or not WeatherSave.RainAnimation[i].A or not WeatherSave.RainAnimation[i].A.valid then
			local Rain = Surface.create_entity{name = "rain-loop-v2",position=MoEntity.getplayerpos(i)}
			Rain.energy = 5*MoMath.GetMJ()
			local RainB = Surface.create_entity{name = "rain-power-pole",position=MoEntity.getplayerpos(i)}
			WeatherSave.RainAnimation[i] = {A=Rain,B=RainB}
		else
			WeatherSave.RainAnimation[i].A.teleport(MoEntity.getplayerpos(i))
			WeatherSave.RainAnimation[i].B.teleport(MoEntity.getplayerpos(i))
		end
	end)
	CleanupStrayBits()
end

local RainRenderDist = MoConfig.RainRenderDist

function WeatherFuncs.RainThink()
	HandleRainSound()
	if (CurrentWeather.NextRDrops or 0)<=game.tick then
		CurrentWeather.NextRDrops = game.tick+(0.4*60)
		local Rains = {}
		local CellSize,CellDist = RainRenderDist,6
		
		MoEntity.loopplayers(function(i,d)
			--Localise the players pos to weather grid.
			local PPos = game.get_player(i or 1).position
			local PPGrid = {x=MoMath.Round(PPos.x/CellDist)*CellDist,y=MoMath.Round(PPos.y/CellDist)*CellDist}
			for X=1, CellSize do
				for Y=1, CellSize do
					local RainPos = {x=PPGrid.x+((X-(CellSize/2))*CellDist),y=PPGrid.y+((Y-(CellSize/2))*CellDist)}
					local Key = tostring(RainPos.x)..tostring(RainPos.y)
					if not Rains[Key] then -- This is so players close to each other don't overlap rain effects.
						Rains[Key] = true
						local Surface = d.surface
						Surface.create_entity{name = "rain-drops", position=RainPos}
					end
				end
			end
		end)
		Rains = nil -- Empty the table as we don't need it any-more.
	end
end

function WeatherFuncs.RainStart() 
	HandleRainSound()
	MoTimers.CreateTimer("MoWeatherRainDrops",0.01,0,false,WeatherFuncs.RainThink) 
end

function WeatherFuncs.RainEnd()
	for i,d in pairs(WeatherSave.RainAnimation) do
		if d.A and d.A.valid then
			d.A.destroy()
			d.B.destroy()
		end
		WeatherSave.RainAnimation[i] = nil
	end
	MoTimers.DeleteTimer("MoWeatherRainDrops") 
end

--Cache the function, so MoTimers can run it after a save game was loaded.
MoTimers.CacheFunction("MoWeatherRainDrops",WeatherFuncs.RainThink)

--ThunderStorm Code
function WeatherFuncs.StormThink() 
	if(math.random(1,30)<8)then	
		MoEntity.loopplayers(function(i,d)
			MoMisc.PlaySound("thunder-roll",MoEntity.getplayerpos(i),d.surface)
		end)
		
		if not CurrentWeather.SVars.IgnoreLight then
			local Light = game.daytime
			game.daytime = 0.99		
			MoTimers.CreateTimer("LightningFlash",0.2,1,false,function() game.daytime = Light end)
		end
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
CreateWeather("Clear",EF,EF,EF,"Clear","clear",0,0,31,30,0,10)
CreateWeather("Cloudy",EF,EF,EF,"Clear","cloudy",0.010,60,400,150,240,5)
CreateWeather("Windy",EF,EF,EF,"Clear","windy",0.053,10,300,250,180,3)
CreateWeather("ThunderStorm",WeatherFuncs.StormEnd,WeatherFuncs.StormStart,EF,"Clear","thunder",0.043,80,300,250,300,3)
CreateWeather("RainStorm",WeatherFuncs.RainEnd,WeatherFuncs.RainStart,EF,"Clear","rain",0.043,60,300,250,300,3)

