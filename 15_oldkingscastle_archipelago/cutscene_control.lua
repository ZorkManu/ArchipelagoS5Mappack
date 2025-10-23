----------------------------------
-- CUTSCENES
--
-- Map: 	ZYvKn_15_OldKingsCastle
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()

	StartCutscene("Intro")
end

function Cheat_MissionComplete_Start()
	StartCutscene("MissionComplete")
end





-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------

Cutscene1 = {}
Cutscene2 = {}

Cutscene1.dummy1 = 0
Cutscene1.dummy2 = 0


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	 Mission_InitMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Finished()
	 Mission_EndMovie()
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Mission_EndMovie()
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
end


function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Intro_Text1")
	
end


function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Intro_Text2")
	
end


function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Intro_Text3")
	
end


function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Intro_Text4")
	
end


function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Intro_Text5")
	
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Castle"
--
-----------------------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Castle_Start()
	 Mission_InitMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Castle_Finished()
	 Mission_EndMovie()
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Castle_Cancel()
	 Mission_EndMovie()
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
end


function Cutscene_Castle_Text1()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Castle_Text1")
	
end














-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end

-------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_MissionComplete_Start()
	Mission_InitMovie()    

       DestroyEntity("Erec") 
        DestroyEntity("Dario") 
         DestroyEntity("Pilgrim") 
          DestroyEntity("Salim") 
           DestroyEntity("Ari") 
            DestroyEntity("Helias") 
             DestroyEntity("Kerberos") 
             
             
       
       CreateEntity(1, Entities.PU_Hero4, GetPosition("VictoryErec"), "Erec" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("VictoryDario"), "Dario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("VictoryPilgrim"), "Pilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("VictorySalim"), "Salim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("VictoryAri"), "Ari" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("VictoryHelias"), "Helias" )
       CreateEntity(1, Entities.CU_BlackKnight, GetPosition("VictoryKerberos"), "Kerberos" )
end


function Cutscene_MissionComplete_Move()

       	 Move ("Erec", "VictoryMoveErec")
       	 Move ("Dario", "VictoryMoveDario")
       	 Move ("Pilgrim", "VictoryMovePilgrim")
       	 Move ("Salim", "VictoryMoveSalim")
       	 Move ("Ari", "VictoryMoveAri")
       	 Move ("Helias", "VictoryMoveHelias")
       	 Move ("Kerberos", "VictoryMoveKerberos")
       	 
	
end	


function Cutscene_MissionComplete_Rotate()
	LookAt(GetID("Erec"), 		GetID("Dario"))
	LookAt(GetID("Pilgrim"), 	GetID("Dario"))
	LookAt(GetID("Salim"), 		GetID("Dario"))
	LookAt(GetID("Ari"), 		GetID("Kerberos"))
	LookAt(GetID("Helias"), 	GetID("Salim"))
	LookAt(GetID("Kerberos"), 	GetID("Erec"))
	LookAt(GetID("Dario"), 		GetID("Kerberos"))
end       	 

function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Extro_Text1")
	
end


function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Extro_Text2")
end


function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Extro_Text3")
	 
end
	
	
function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_15_OldKingsCastle_Txt/Cutscene_Extro_Text4")
	 
end 
-------------------------------------------------------------------------------------------------------------------------

function Cutscene_MissionComplete_Finished()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Cancel()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
	Display.SetFarClipPlaneMinAndMax(0, 0) 
end



-------------------------------------------------------------------------------------------------------------------------





--*********************************************************************************************
function Mission_InitMovie()
	
--	Display.SetRenderUseGfxSets(0)

    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 15000)
    Display.SetRenderFog (1)

	Display.SetFarClipPlaneMinAndMax(0, 18000) 

--	Display_SetSummerValues()

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end

function Mission_EndMovie()
	-- disable Cutscene mode
--	Display.SetRenderUseGfxSets(1)

	Interface_SetCinematicMode(0)
	Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 12000) 
	
	CutsceneDone()
end

