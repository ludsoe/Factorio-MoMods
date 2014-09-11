GetTable=function()
	MoMisc=MoMisc or {}
	return MoMisc
end

--This is extremly experimental, and uses work arounds to work. Use at your own caution.
FuncRegister("PlaySound",function(Sound)
	game.createentity({name = Sound, position=game.getplayer().position})
end)

FuncRegister("Print",function(Text)
	game.player.print(""..Text)
end)

FuncRegister("Random",function(Seed,Min,Max)
	math.randomseed(game.tick/Seed)
	return math.random(Min,Max)
end)
