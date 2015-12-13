local M = MoConfig



-------------------------------------------
--------------Robot Mining-----------------
-------------------------------------------
--Listings of minable resources for mining bots.
M.DMO = {
	{
		OreName="copper-ore",
		ItemResult="copper-ore",
		Yield=1,
		MiniumCount=0,
		NormalCount=1
	},
	{
		OreName="iron-ore",
		ItemResult="iron-ore",
		Yield=1,
		MiniumCount=0,
		NormalCount=1
	},
	{
		OreName="coal",
		ItemResult="coal",
		Yield=1,
		MiniumCount=0,
		NormalCount=1
	},
	{
		OreName="stone",
		ItemResult="stone",
		Yield=1,
		MiniumCount=0,
		NormalCount=1
	}
}

--List of technologys we need to share between the player force and the mining robot one.

M.Techs = {
	"logistic-robot-speed-1",
	"logistic-robot-speed-2",
	"logistic-robot-speed-3",
	"logistic-robot-speed-4",
	"logistic-robot-speed-5",
	"logistic-robot-storage-1",
	"logistic-robot-storage-2",
	"logistic-robot-storage-3"
}

