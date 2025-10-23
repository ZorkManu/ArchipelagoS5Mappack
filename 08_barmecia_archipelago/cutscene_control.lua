----------------------------------
-- CUTSCENES
--
-- Map: 	08_Barmecia
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()
         Cutscene.Start("Intro")
end



function Cheat_Cutscene1_Start()
         Cutscene.Start("Cutscene1")
end



function Cheat_CutsceneComplete_Start()
         Cutscene.Start("CutsceneComplete")
end




-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------



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


function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text1")
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text4")
	
end

function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text5")
	
end

function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text6")
	
end

function Cutscene_Intro_Text7()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Intro_Text7")
	
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
--	CUTSCENE: "Cutscene1"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene1_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene1_Start()
	 Cutscene_Cutscene1_Init()
	 
	  CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneCutscene1Pilgrim"), "CutsceneCutscene1Pilgrim" )   
           			
     		local ID = GetID("CutsceneCutscene1Pilgrim")
			Logic.RotateEntity(ID, 270)
		   
              
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene1_Finished()
	 Mission_EndMovie()
	 	  
	 DestroyEntity("CutsceneCutscene1Pilgrim") 
	 
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene1_Cancel()
	 Mission_EndMovie()
	 
	  DestroyEntity("CutsceneCutscene1Pilgrim") 
end





function Cutscene_Cutscene1_Text1()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text1")
	
end


function Cutscene_Cutscene1_Text2()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text2")
	
end

function Cutscene_Cutscene1_Text3()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text3")
	
end


function Cutscene_Cutscene1_Text4()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text4")
	
end


function Cutscene_Cutscene1_Text5()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text5")
	
end


function Cutscene_Cutscene1_Text6()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cutscene1_Text6")
	
end

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Barmecia_Start()
	 Mission_InitMovie()     
end

-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Barmecia_Finished()
	 Mission_EndMovie()
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Barmecia_Cancel()
	 Mission_EndMovie()
end

function Cutscene_Barmecia_Text1()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Barmecia_Text1")
end


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cleycourt_Start()
	 Mission_InitMovie()     
end

-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cleycourt_Finished()
	 Mission_EndMovie()
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cleycourt_Cancel()
	 Mission_EndMovie()
end

function Cutscene_Cleycourt_Text1()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Cleycourt_Text1")
end



-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "CutsceneComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_CutsceneComplete_Start()
	   Mission_InitMovie()    

    DestroyEntity("Dario") 
    DestroyEntity("Pilgrim") 
    DestroyEntity("Ari") 
    DestroyEntity("Erec")
    DestroyEntity("Helias") 
             
   CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "CutsceneExtroDario" )
   CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneExtroPilgrim"), "CutsceneExtroPilgrim" )   
   --           
     		local ID = GetID("CutsceneExtroDario")
			Logic.RotateEntity(ID, 180)
			
			
    		local ID = GetID("CutsceneExtroPilgrim")
			Logic.RotateEntity(ID, 270)
			
end	 


function Cutscene_CutsceneComplete_Text1()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text1")
	
end



function Cutscene_CutsceneComplete_Text2()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text2")
	
end




function Cutscene_CutsceneComplete_Text3()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text3")
	
end



function Cutscene_CutsceneComplete_Text4()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text4")
	
end



function Cutscene_CutsceneComplete_Text5()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text5")
	
end



function Cutscene_CutsceneComplete_Text6()
	 SpokenCinematicText("CM01_08_Barmecia_Txt/Cutscene_Extro_Text6")
	
end
-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Finished()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Cancel()
	Mission_EndMovie()	
end


--*********************************************************************************************
function Mission_InitMovie()
	
	Display.SetFogStartAndEnd (5000, 12000)
	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
 
end
 
function Mission_EndMovie()
	Logic.StopPrecipitation()
	Display.SetRenderUseGfxSets(1)
	Interface_SetCinematicMode(0)
	Display.SetFarClipPlaneMinAndMax(0, 0) 

	CutsceneDone()
end

