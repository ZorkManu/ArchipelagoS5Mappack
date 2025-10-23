----------------------------------
-- CUTSCENES
--
-- Map: 	10_Folklung
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()
         Cutscene.Start("Intro")
end



function Cheat_Cutscene1_Start()
         Cutscene.Start("Cutscene1")
end



function Cheat_MissionComplete_Start()
         Cutscene.Start("MissionComplete")
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
function Cutscene_Intro_Init()
	 Mission_InitMovie()     
	 
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	 Cutscene_Intro_Init()
 
        CreateEntity(1, Entities.PU_Hero3, GetPosition("Cutscene1Salim"), "Cutscene1Salim" )
 
end
	 

function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text1")
	
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text4")
	
end

function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text5")
	
end

function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Intro_Text6")
	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()

         DestroyEntity("Cutscene1Salim") 
	 
--	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Cutscene_Intro_End()

	 Display.SetFarClipPlaneMinAndMax(0, 0)
	 
	 DestroyEntity("Cutscene1Salim") 
	 
--	 Mission_EndMovie()
end




-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_End()
 
	 Mission_EndMovie()
end


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene1 - Spieler erreicht Folklung Castle"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene1_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene1_Start()
	 Cutscene_Cutscene1_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene1_Finished()
	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene1_Cancel()
	 Mission_EndMovie()
end





function Cutscene_Cutscene1_Text1()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Cutscene1_Text1")
	
end


function Cutscene_Cutscene1_Text2()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Cutscene1_Text2")
	
end

function Cutscene_Cutscene1_Text3()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Cutscene1_Text3")
	
end


function Cutscene_Cutscene1_Text4()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Cutscene1_Text4")
	
end


function Cutscene_Cutscene1_Text5()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Cutscene1_Text5")
	
end
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_MissionComplete_Start()
	   Mission_InitMovie()    

       DestroyEntity("Dario") 
       DestroyEntity("Pilgrim") 
       DestroyEntity("Salim") 
       DestroyEntity("Ari") 
       DestroyEntity("Helias") 
       DestroyEntity("Erec")
	   
                  
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneErec2" )
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "CutsceneDario2" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneExtroPilgrim"), "CutscenePilgrim2" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneExtroSalim"), "CutsceneSalim2" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneExtroAri"), "CutsceneAri2" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "CutsceneHelias2" )
 
 	LookAt(GetID("CutsceneErec2"), 		GetID("_Cutscene_Camp"))
	LookAt(GetID("CutscenePilgrim2"), 	GetID("_Cutscene_Camp"))
	LookAt(GetID("CutsceneSalim2"), 		GetID("_Cutscene_Camp"))
	LookAt(GetID("CutsceneAri2"), 		GetID("_Cutscene_Camp"))
	LookAt(GetID("CutsceneHelias2"), 	GetID("_Cutscene_Camp"))
	LookAt(GetID("CutsceneDario2"), 		GetID("_Cutscene_Camp"))

--		"_Cutscene_Camp"

end



function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text1")
	
end



function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text2")
	
end




function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text3")
	
end



function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text4")
	
end



function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text5")
	
end



function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_10_Folklung_Txt/Cutscene_Extro_Text6")
	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Finished()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Cancel()
	Mission_EndMovie()	
end


--*********************************************************************************************
function Mission_InitMovie()
	
--	Display.SetRenderUseGfxSets(0)
--	Display.SetFogColor (152,172,182)
	Display.SetFogStartAndEnd (1000, 8000)

	Display.SetRenderFog (1)

	Display.SetFarClipPlaneMinAndMax(0, 12000) 

--	Display_SetSummerValues()

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end
 
function Mission_EndMovie()
	Logic.StopPrecipitation()

	-- disable Cutscene mode

	Display.SetRenderUseGfxSets(1)

	Interface_SetCinematicMode(0)
--	Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 0)

	CutsceneDone()
end

