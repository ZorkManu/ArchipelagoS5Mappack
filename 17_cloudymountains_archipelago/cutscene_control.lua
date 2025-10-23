----------------------------------
-- CUTSCENES
--
-- Map: 	17_Cloudy Mountains
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
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()
--	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Cutscene_Intro_End()
--	 Mission_EndMovie()
end



function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Intro_Text1")
	
end



function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Intro_Text2")
	
end



function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Intro_Text3")
	
end



function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Intro_Text4")
	
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
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_MissionComplete_Start()
	Mission_InitMovie()    

        DestroyEntity("Dario") 
        DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
          DestroyEntity("Ari") 
           DestroyEntity("Helias") 
            DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
             
  
end



function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Extro_Text1")
	
end


function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Extro_Text2")
	
end


function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Extro_Text3")
	
end


function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_17_CloudyMountains_Txt/Cutscene_Extro_Text4")
	
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
	
	Display.SetFogStartAndEnd (12000, 15000)
	Display.SetRenderFog(1)
	Display.SetFarClipPlaneMinAndMax(0, 18000) 

	Logic.StopPrecipitation()
	Interface_SetCinematicMode(1)
 
end



 
function Mission_EndMovie()
	Logic.StopPrecipitation()
	Interface_SetCinematicMode(0)
	Display.SetFarClipPlaneMinAndMax(0, 0) 

	CutsceneDone()
end

