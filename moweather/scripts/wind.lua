CurrentWeather.Wind = {Override=false,Wind=0.02,Rate=0.018}

function HeadWinds()
	local W = CurrentWeather.Wind
	if CurrentWeather.Time.Name == "Day" then
		W.Rate=0.024
	else
		W.Rate=0.018
	end
end

--Handles the random wind fluxs.
function ManageWind()
	local W = CurrentWeather.Wind
	HeadWinds()
	
	if Random(54,1,20)>10 then X=0.001 else X=-0.001 end
	W.Wind = MoMath.Clamp(math.abs(W.Rate+(Random(100,1,20)*X)),W.Rate-0.1,W.Rate+0.1)
end
