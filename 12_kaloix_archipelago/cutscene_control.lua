----------------------------------
-- CUTSCENES
--
-- Map: 	12_Kaloix
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
function Cutscene_Intro_Init()
	 Mission_InitMovie()     
	 
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	 Cutscene_Intro_Init()
	
                   
             
       
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntroErec"), "CutsceneErec" )
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntroPilgrim"), "CutscenePilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntroSalim"), "CutsceneSalim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntroAri"), "CutsceneAri" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntroHelias"), "CutsceneHelias" )

end
	 
	 

function Cutscene_Intro_Move()

       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
         Move ("CutsceneSalim", "CutsceneIntroMoveSalim")
      
end       	 
 
 function Cutscene_Intro_Move2() 
      	 
       	 Move ("CutsceneAri", "CutsceneIntroMoveAri")
       	 Move ("CutscenePilgrim", "CutsceneIntroMovePilgrim")

end	



-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()
	 
	 
       DestroyEntity("CutsceneErec") 
        DestroyEntity("CutsceneDario") 
         DestroyEntity("CutscenePilgrim") 
          DestroyEntity("CutsceneSalim") 
           DestroyEntity("CutsceneAri") 
            DestroyEntity("CutsceneHelias") 
--   CutsceneDone()
	 
--	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Cutscene_Intro_End()
	 
	 	 
       DestroyEntity("CutsceneErec") 
        DestroyEntity("CutsceneDario") 
         DestroyEntity("CutscenePilgrim") 
          DestroyEntity("CutsceneSalim") 
           DestroyEntity("CutsceneAri") 
            DestroyEntity("CutsceneHelias") 
             
--	 CutsceneDone()
	 
	 
--	 Mission_EndMovie()
end



function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text1")
	
end




function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text2")
	
end




function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text3")
	
end




function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text4")
	
end





function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text5")
	
end



function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Intro_Text6")
	
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
	 Display.SetFarClipPlaneMinAndMax(0, 0) 
end

-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_MissionComplete_Start()
	Mission_InitMovie()    

       DestroyEntity("Dario") 
--      DestroyEntity("Pilgrim") 
       DestroyEntity("Salim") 
--        DestroyEntity("Ari") 
--         DestroyEntity("Helias") 
--          DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
--		DestroyEntity("Hero_Countess")
             

       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "ExtroErec" )             
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "ExtroDario" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneExtroSalim"), "ExtroSalim" )
--       CreateEntity(8, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "ExtroHelias" )
end


function Cutscene_MissionComplete_Move3()

--       	 Move ("ExtroHelias", "CutsceneExtroMoveHelias")
end       	 


function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text1")
	
end

function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text2")
	
end


function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text3")
	
end

function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text4")
	
end


function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text5")
	
end


function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_12_Kaloix/Cutscene_Extro_Text6")
	
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Finished()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_MissionComplete_Cancel()
	Logic.StopPrecipitation()
	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------





--*********************************************************************************************
function Mission_InitMovie()
	
--	Display.SetRenderUseGfxSets(0)

    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 15000)
    Display.SetRenderFog (1)

	Display.SetFarClipPlaneMinAndMax(0, 16000) 

	Display_SetSummerValues()

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end

function Mission_EndMovie()
	-- disable Cutscene mode
	Display.SetRenderUseGfxSets(1)

	Interface_SetCinematicMode(0)
	Display_SetDefaultValues()
	Display.SetFarClipPlaneMinAndMax(0, 12000) 
	CutsceneDone()
end

