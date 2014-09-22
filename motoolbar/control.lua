require "util"
require "defines"

MLC = {
	Math=false,
	Timers=true,
	Misc=false,
	Entity=false,
	Debug=false,
	Gui=true
}

MoSave = require "mologiccore.base"

--Save to glob
local Funcs,Register,LButtons,Checks = {},{},{},{}
local Vers = "0.0.1"

local EditMode = false

remote.addinterface("MoToolBar", {
	addbutton = function(button,caption,scope,funct,mod,desc)
		if button == nil or caption == nil or scope == nil or funct == nil then return false end --You have to send me data :I
		--AddButton(button,caption,scope,funct) --Lets add the button!
		Register[button]={t="Button",n=button,c=caption,s=scope,f=funct,m=mod,d=desc}
		return true
	end,
	delbutton = function(button)
		if button == nil then return false end
		RemButton(button)
		return true
	end,
	updatecaption = function(button,caption)
		if button == nil or caption == nil then return false end
		GetGui("left")["MGTB"]["Flow"][button].caption = caption	
		return true
	end,
})

--Ease function.
function GetGui(dir) return game.player.gui[dir] end

--Removes buttons and deregisters them.
function RemButton(Name) GetGui("left")["MGTB"]["Flow"][Name].destroy() Funcs[Name]=nil end

--Registers Buttons so they can be enabled and added to the toolbar.
function AddButton(Name,Caption,SI,F)
	local P = GetGui("left")["MGTB"]["Flow"]
	if P==nil then return end --The Gui isnt created.... Whats going on here!?!
	P.add{type="button", name=Name, direction = "vertical", caption=Caption}
	Funcs[Name]={OnClick=function() remote.call(SI, F) end}
	LButtons[Name]=P[Name]
end

--This generates the ToolBar, and adds all the buttons
function GenerateBar()
	local P = GetGui("left")["MGTB"].destroy() 
	
	ToolBarBase() --Renew the toolbar!
	
	--Now we add the buttons the user wants loaded.
	for i,d in pairs(glob.Settings.A) do
		if d == true then
			if Register[i]~=nil then --Fixes a error that happens if a mod with a button was removed.
				AddButton(Register[i].n,Register[i].c,Register[i].s,Register[i].f)
			end
		end
	end
	
end

function CloseSettings()
	local P = GetGui("center")["TBSettings"]
	for i,d in pairs(Checks) do
		glob.Settings.A[i]=d.state
	end
	GenerateBar()
	P.destroy()
end

function SettingsMenu()
	local P = GetGui("center")
	
	if P["TBSettings"]~=nil then return end --Dont you dare open twice!
	
	P.add{type="frame", name="TBSettings"}
	P["TBSettings"].add{type="flow", name="Stack",direction = "vertical"}
	
	P["TBSettings"]["Stack"].add{type="flow", name="Top",direction = "horizontal"} local T = P["TBSettings"]["Stack"]["Top"]
		T.add{type="label", name="TitleV",caption="MoToolBar V:"..Vers.." Settings Menu"}
		T.add{type="button", name="Close", direction = "vertical", caption="Save And Close"} Funcs["Close"]={OnClick=CloseSettings}
	
	local FS = P["TBSettings"]["Stack"]
	for i,d in pairs(Register) do
		FS.add{type="flow", name=d.n ,direction = "horizontal"}
		
		FS[d.n].add{type="checkbox", name="Check",state=glob.Settings.A[d.n] or false}
		Checks[d.n] = FS[d.n]["Check"]
		
		if d.m~=nil and d.d~=nil then
			FS[d.n].add{type="label", name="Title",caption="Button: "..d.c}
			FS[d.n].add{type="label", name="Mod",caption="Mod: "..d.m}
			FS[d.n].add{type="label", name="Desc",caption="Desc: "..d.d}
		else
			FS[d.n].add{type="label", name="Title",caption="IName: "..d.n}
			FS[d.n].add{type="label", name="Cap",caption="Caption: "..d.c}
			FS[d.n].add{type="label", name="SI",caption="InterFace: "..d.s}
			FS[d.n].add{type="label", name="F",caption="Func: "..d.f}
		end
	end
end

function ToolBarBase()
	--Lets create the Base Frame for the ToolBar
	local P = GetGui("left")
	
	if P["MGTB"]==nil then	
		P.add{type="frame", name="MGTB"}
		P["MGTB"].add{type="flow", name="Flow",direction = "vertical"}
		P["MGTB"]["Flow"].add{type="flow", name="Top",direction = "horizontal"} local T = P["MGTB"]["Flow"]["Top"]
			T.add{type="label", name="TitleV",caption="MoToolBar V:"..Vers}
			T.add{type="button", name="Settings", direction = "vertical", caption="Settings"}
			Funcs["Settings"]={OnClick=SettingsMenu}
	end
end

--Lets Open the Gui first things first.
MoTimers.CreateTimer("OpenGui",0,1,false,function() glob.Settings = glob.Settings or {A={}} ToolBarBase() end)
MoTimers.CreateTimer("SetupBar",0.1,1,false,function() GenerateBar() end)

--This section will handle the click events.
game.onevent(defines.events.onguiclick, function(event)
	if EditMode then
	
	else
		local N = Funcs[event.element.name]
		if N~=nil and N.OnClick~=nil then
			N.OnClick()
		end
	end
end)

