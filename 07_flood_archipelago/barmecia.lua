--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function InitBarmeciaFunctions()
	gvMission_BarmeciaTraderID				= Logic.GetEntityIDByName("BarmeciaMerchant")
	Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 1)	
	gvMission_BcTPosX, gvMission_BcTPosY 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMerchant"))
	gvMission_BcTHPosX, gvMission_BcTHPosY 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMerchantPlace"))	
	gvMission_findBarmeciaTrader			= 0
	gvMission_BarmeciaTraderKey				= 0
	gvMission_BarmeciaTraderHaveKey			= 0
	gvMission_TraderTribute1				= 0
	gvMission_TraderTribute2				= 0
	gvMission_TraderTribute3				= 0

	gvMission_BarmeciaIronTraderID			= Logic.GetEntityIDByName("BarmeciaIronTrader")
	Logic.SetOnScreenInformation(gvMission_BarmeciaIronTraderID, 1)	
	gvMission_BcITPosX, gvMission_BcITPosY 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaIronTrader"))
	
	gvMission_PrisonGuardID					= Logic.GetEntityIDByName("PrisonGuard")
	gvMission_PGPosX, gvMission_PGPosY	 	= Logic.GetEntityPosition(Logic.GetEntityIDByName("PrisonGuard"))
	
	gvMission_HeroAri						= 0
	gvMission_Chest1						= Logic.GetEntityIDByName("Chest1")
	gvMission_Chest2						= Logic.GetEntityIDByName("Chest2")
	gvMission_Chest3						= Logic.GetEntityIDByName("Chest3")
	gvMission_Chest4						= Logic.GetEntityIDByName("Chest4")
	gvMission_Chest5						= Logic.GetEntityIDByName("Chest5")
	gvMission_Chest6						= Logic.GetEntityIDByName("Chest6")
	gvMission_Chest7						= Logic.GetEntityIDByName("Chest7")
	gvMission_Chest8						= Logic.GetEntityIDByName("Chest8")
	gvMission_Chest9						= Logic.GetEntityIDByName("Chest9")
	gvMission_Chest10						= Logic.GetEntityIDByName("Chest10")
	gvMission_Chest11						= Logic.GetEntityIDByName("Chest11")
	gvMission_Chest12						= Logic.GetEntityIDByName("Chest12")
	gvMission_Chest13						= Logic.GetEntityIDByName("Chest13")
	gvMission_FindChest1					= 0
	gvMission_FindChest2					= 0
	gvMission_FindChest3					= 0
	gvMission_FindChest4					= 0
	gvMission_FindChest5					= 0
	gvMission_FindChest6					= 0
	gvMission_FindChest7					= 0
	gvMission_FindChest8					= 0
	gvMission_FindChest9					= 0
	gvMission_FindChest10					= 0
	gvMission_FindChest11					= 0
	gvMission_FindChest12					= 0
	gvMission_FindChest13					= 0
		
	---------------------------------------------------------------
	GlobalMissionScripting.RequestTrigger( "BarmeciaTrader" )
	GlobalMissionScripting.RequestTrigger( "BarmeciaIronTrader" )
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_BarmeciaTrader()
	return Counter.Tick2("BarmeciaTrader", 4) -- 4 second
end
function Action_BarmeciaTrader()
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_BcTPosX,gvMission_BcTPosY, 800, 1 )
	if checknum == 1 then
		gvMission_findBarmeciaTrader = 1
		Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 0)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTrader1"))
		GlobalMissionScripting.RequestTrigger( "BarmeciaTraderSpeak" )		
		return 1
	end
end
function Condition_BarmeciaTraderSpeak()
	return Counter.Tick2("BarmeciaTraderSpeak", 9) -- 9 second
end
function Action_BarmeciaTraderSpeak()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTrader2"))
	Logic.AddQuest(gvMission_PlayerID, 005, 1, "CM01_07_Flood/subquest003_name_BarmeciaTrader", "CM01_07_Flood/subquest003_desc_BarmeciaTrader")	
	GlobalMissionScripting.RequestTrigger( "NewQuest" )	

	Logic.SetOnScreenInformation(gvMission_PrisonGuardID, 1)
	GlobalMissionScripting.RequestTrigger( "PrisonGuard" )		
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_PrisonGuard()
	return Counter.Tick2("PrisonGuard", 4) -- 4 second
end
function Action_PrisonGuard()
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_PGPosX,gvMission_PGPosY, 800, 1 )
	if checknum == 1 then	
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_PrisonGuard1"))
		Logic.SetOnScreenInformation(gvMission_PrisonGuardID, 0)
		
		GlobalMissionScripting.RequestTrigger( "PrisonGuardSpeak2" )
		return 1
	end
end
function Condition_PrisonGuardSpeak2()
	return Counter.Tick2("PrisonGuardSpeak2", 9) -- 9 second
end
function Action_PrisonGuardSpeak2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_PrisonGuard2"))	
	GlobalMissionScripting.RequestTrigger( "PrisonGuardSpeak3" )
	return 1
end
function Condition_PrisonGuardSpeak3()
	return Counter.Tick2("PrisonGuardSpeak3", 9) -- 9 second
end
function Action_PrisonGuardSpeak3()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_PrisonGuard3"))	
	GlobalMissionScripting.RequestTrigger( "PrisonGuardSpeak4" )
	return 1
end
function Condition_PrisonGuardSpeak4()
	return Counter.Tick2("PrisonGuardSpeak4", 12) -- 12 second
end
function Action_PrisonGuardSpeak4()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_PrisonGuard4"))
	Logic.AddQuest(gvMission_PlayerID, 005, 1, "CM01_07_Flood/subquest003_name_BarmeciaTrader", "CM01_07_Flood/subquest003_desc_BarmeciaTrader2")	
	
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriPoint1"))                                                                                                  
	-- kreiere Unit, "IDName, X, Y, Blickrichtung, Playernummer"                                                                                                           
	gvMission_HeroAri = Logic.CreateEntity(Entities.PU_Hero5,x,y,45,gvMission_PlayerID)
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("AriPoint2"))
		Logic.MoveSettler(gvMission_HeroAri, X, Y, -1)	
	            
	GlobalMissionScripting.RequestTrigger( "AriFindKey" )
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_AriFindKey()
	return Counter.Tick2("AriFindKey", 2) -- 2 second
end
function Action_AriFindKey()
	if gvMission_BarmeciaTraderHaveKey == 1 then
		return 1	-- wurdem dem Händler der Schlüssel gebracht, wird dieser Trigger gelöscht
	end

	if gvMission_FindChest1 == 0 then
	if Logic.CheckEntitiesDistance(gvMission_Chest1, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest1)
		Logic.DestroyEntity(gvMission_Chest1)
		gvMission_Chest1 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest1"))		
		gvMission_FindChest1 = 1
	end
	end

	if gvMission_FindChest2 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest2, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest2)
		Logic.DestroyEntity(gvMission_Chest2)
		gvMission_Chest2 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest2"))
		gvMission_FindChest2 = 1
	end
	end

	if gvMission_FindChest3 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest3, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest3)
		Logic.DestroyEntity(gvMission_Chest3)
		gvMission_Chest3 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 5)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest3"))
		gvMission_FindChest3 = 1
	end
	end

	if gvMission_FindChest4 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest4, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest4)
		Logic.DestroyEntity(gvMission_Chest4)
		gvMission_Chest4 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest4"))
		gvMission_FindChest4 = 1
	end
	end
	---------------------------------------------------------------
	if gvMission_FindChest5 == 0 then
	if Logic.CheckEntitiesDistance(gvMission_Chest5, gvMission_HeroAri, 600) == 1 then
		gvMission_BarmeciaTraderKey = 1
		local X, Y = Logic.GetEntityPosition(gvMission_Chest5)
		Logic.DestroyEntity(gvMission_Chest5)
		gvMission_Chest5 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		GlobalMissionScripting.RequestTrigger( "BarmeciaTraderGiveKey" )
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest5"))
		GlobalMissionScripting.RequestTrigger( "AriFindKeySpeak" )
		Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 1)
		gvMission_FindChest5 = 1
	end
	end
	---------------------------------------------------------------
	if gvMission_FindChest6 == 0 then
	if Logic.CheckEntitiesDistance(gvMission_Chest6, gvMission_HeroAri, 600) == 1 then
		--local X, Y = Logic.GetEntityPosition(gvMission_Chest6)
		--Logic.DestroyEntity(gvMission_Chest6)
		--gvMission_Chest6 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest6"))
		gvMission_FindChest6 = 1
	end
	end

	if gvMission_FindChest7 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest7, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest7)
		Logic.DestroyEntity(gvMission_Chest7)
		gvMission_Chest7 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest7"))
		gvMission_FindChest7 = 1
	end
	end

	if gvMission_FindChest8 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest8, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest8)
		Logic.DestroyEntity(gvMission_Chest8)
		gvMission_Chest8 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest8"))
		gvMission_FindChest8 = 1
	end
	end

	if gvMission_FindChest9 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest9, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest9)
		Logic.DestroyEntity(gvMission_Chest9)
		gvMission_Chest9 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 50)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest9"))
		gvMission_FindChest9 = 1
	end
	end

	if gvMission_FindChest10 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest10, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest10)
		Logic.DestroyEntity(gvMission_Chest10)
		gvMission_Chest10 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest10"))
		gvMission_FindChest10 = 1
	end
	end

	if gvMission_FindChest11 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest11, gvMission_HeroAri, 600) == 1 then
		--local X, Y = Logic.GetEntityPosition(gvMission_Chest11)
		--Logic.DestroyEntity(gvMission_Chest11)
		--gvMission_Chest11 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		--Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 10)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest11"))
		gvMission_FindChest11 = 1
	end
	end

	if gvMission_FindChest12 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest12, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest12)
		Logic.DestroyEntity(gvMission_Chest12)
		gvMission_Chest12 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Gold, 15)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest12"))
		gvMission_FindChest12 = 1
	end
	end

	if gvMission_FindChest13 == 0 then	
	if Logic.CheckEntitiesDistance(gvMission_Chest13, gvMission_HeroAri, 600) == 1 then
		local X, Y = Logic.GetEntityPosition(gvMission_Chest13)
		Logic.DestroyEntity(gvMission_Chest13)
		gvMission_Chest13 = Logic.CreateEntity(Entities.XD_ChestOpen, X,Y, 0, 0)
		
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 25)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_Chest13"))
		gvMission_FindChest13 = 1
	end
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_AriFindKeySpeak()
	return Counter.Tick2("AriFindKeySpeak", 3) -- 3 second
end
function Action_AriFindKeySpeak()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_AriFindKey"))
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_BarmeciaTraderGiveKey()
	return Counter.Tick2("BarmeciaTraderGiveKey", 4) -- 4 second
end
function Action_BarmeciaTraderGiveKey()
	if gvMission_BarmeciaTraderKey == 1 then
		local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_BcTPosX,gvMission_BcTPosY, 800, 1 )
		if checknum == 1 then
			gvMission_BarmeciaTraderHaveKey = 1
			Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 0)
			
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTraderThanks"))		
			Logic.RemoveQuest(gvMission_PlayerID, 003) -- die nicht mehr benötigte Quest löschen
		
			local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMerchantPlace"))
			Logic.MoveSettler(gvMission_BarmeciaTraderID, X, Y, -1)		
			return 1
		end
	end
end
-----------------------------------------------------------------------------------------
function Condition_BarmeciaTraderGiveKey()
	return Counter.Tick2("BarmeciaTraderGiveKey", 4) -- 4 second
end
function Action_BarmeciaTraderGiveKey()
	if gvMission_BarmeciaTraderKey == 1 then
		local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_BcTPosX,gvMission_BcTPosY, 800, 1 )
		if checknum == 1 then
			gvMission_BarmeciaTraderHaveKey = 1
			Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 0)
			
			GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTraderThanks"))		
			Logic.RemoveQuest(gvMission_PlayerID, 003) -- die nicht mehr benötigte Quest löschen
		
			local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("BarmeciaMerchantPlace"))
			Logic.MoveSettler(gvMission_BarmeciaTraderID, X, Y, -1)
			
			GlobalMissionScripting.RequestTrigger( "BarmeciaTraderGoHome" )	
			return 1
		end
	end
end
-----------------------------------------------------------------------------------------
function Condition_BarmeciaTraderGoHome()
	if Logic.CheckEntitiesDistance(Logic.GetEntityIDByName("BarmeciaMerchantPlace"), gvMission_BarmeciaTraderID, 400) == 1 then		
		return 1
	end
end
function Action_BarmeciaTraderGoHome()
	Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 1)
	GlobalMissionScripting.RequestTrigger( "BarmeciaTraderHome" )
	return 1
end
function Condition_BarmeciaTraderHome()
	return Counter.Tick2("BarmeciaTraderHome", 4) -- 4 second
end
function Action_BarmeciaTraderHome()
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_BcTHPosX,gvMission_BcTHPosY, 800, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(gvMission_BarmeciaTraderID, 0)
		GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTrader3"))
		GlobalMissionScripting.RequestTrigger( "BarmeciaTraderSpeakTribute" )		
		return 1
	end
end
function Condition_BarmeciaTraderSpeakTribute()
	return Counter.Tick2("BarmeciaTraderSpeakTribute", 5) -- 5 second
end
function Action_BarmeciaTraderSpeakTribute()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTrader4"))
	Logic.AddTribute(gvMission_PlayerID, 005, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute005_BarmeciaTrader_Wood", ResourceType.Wood, 500)
	Logic.AddTribute(gvMission_PlayerID, 006, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute006_BarmeciaTrader_Clay", ResourceType.Clay, 500)
	Logic.AddTribute(gvMission_PlayerID, 007, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute007_BarmeciaTrader_Gold", ResourceType.Gold, 500)
	GlobalMissionScripting.RequestTrigger( "BarmeciaTraderTributes" )	
	return 1
end
function Condition_BarmeciaTraderTributes()
	return 1
end
function Action_BarmeciaTraderTributes()	
	if gvMission_TraderTribute1 == 1 then
		gvMission_TraderTribute1 = 0
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 75)
		Logic.AddTribute(gvMission_PlayerID, 005, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute005_BarmeciaTrader_Wood", ResourceType.Wood, 500)
	end
	if gvMission_TraderTribute2 == 1 then
		gvMission_TraderTribute2 = 0
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 125)
		Logic.AddTribute(gvMission_PlayerID, 006, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute006_BarmeciaTrader_Clay", ResourceType.Clay, 500)
	end
	if gvMission_TraderTribute3 == 1 then
		gvMission_TraderTribute3 = 0
		Logic.AddToPlayersGlobalResource(gvMission_PlayerID, ResourceType.Sulfur, 100)
		Logic.AddTribute(gvMission_PlayerID, 007, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute007_BarmeciaTrader_Gold", ResourceType.Gold, 500)
	end
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_BarmeciaIronTrader()
	return Counter.Tick2("BarmeciaIronTrader", 3) -- 3 second
end
function Action_BarmeciaIronTrader()
	local checknum = Logic.GetPlayerEntitiesInArea( gvMission_PlayerID ,0, gvMission_BcITPosX,gvMission_BcITPosY, 800, 1 )
	if checknum == 1 then
		Logic.SetOnScreenInformation(gvMission_BarmeciaIronTraderID, 0)
		--GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest003_note_BarmeciaTrader1"))
		--GlobalMissionScripting.RequestTrigger( "BarmeciaTraderSpeak" )		
		return 1
	end
end