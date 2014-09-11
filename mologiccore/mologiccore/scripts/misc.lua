GetTable=function()
	MoMisc=MoMisc or {}
	return MoMisc
end

--This is extremly experimental, and uses work arounds to work. Use at your own caution.
--This requires a explosion entity with the sounds you want preloaded into it.
FuncRegister("PlaySound",function(Sound)
	game.createentity({name = Sound, position=game.getplayer().position})
end)

--Ease Function to help printing.
FuncRegister("Print",function(Text)
	game.player.print(""..Text)
end)

--This function lets you have random numbers, while not desyncing replays/multiplayer. (Hopefully.)
FuncRegister("Random",function(Seed,Min,Max)
	math.randomseed(game.tick/Seed)
	return math.random(Min,Max)
end)
