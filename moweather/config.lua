local M = MoConfig

--------------------------------------------------------------------------------------
-----------------------------Day/Night Cycle------------------------------------------

--Length of a entire day/night cycle, In Minutes.
M.DayLength=12

--Percentage of the day night cycle thats night.
M.DayNightRatio=50 

--DayLight Transition Multiplier, Larger Numbers = Slower sunrises/sunsets.
M.TransitionMult = 1500

--------------------------------------------------------------------------------------
-----------------------------Weather Systems------------------------------------------

--The amount of "tiles" rain renders from players. Higher numbers increase CPU time. *Aka Might cause lag.*
M.RainRenderDist = 12