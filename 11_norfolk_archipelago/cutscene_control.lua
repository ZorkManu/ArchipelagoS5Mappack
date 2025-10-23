----------------------------------
-- CUTSCENES
--
-- Map: 	11_Norfolk
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


--function Cheat_Intro_Start()
--         Cutscene.Start("Intro")
--
--        
--end
--
--function Cheat_MissionComplete_Start()
--         Cutscene.Start("MissionComplete")
--end
--
--
--
--function Cheat_wip()
--    	 Sound.Play2DSound( Sounds.fanfare, 0 )
--   	 EnableDebugging()
--
--end
--


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

                   
             
       
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar1"), "CutsceneBarbar1" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar2"), "CutsceneBarbar2" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar3"), "CutsceneBarbar3" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar4"), "CutsceneBarbar4" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar5"), "CutsceneBarbar5" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar6"), "CutsceneBarbar6" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar7"), "CutsceneBarbar7" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar8"), "CutsceneBarbar8" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar9"), "CutsceneBarbar9" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar10"), "CutsceneBarbar10" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar11"), "CutsceneBarbar11" )
       CreateEntity(5, Entities.CU_Barbarian_SoldierClub1, GetPosition("CutsceneIntroBarbar12"), "CutsceneBarbar12" )



end
	 
	 

--function Cutscene_Intro_Move()

--       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
--       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
--         Move ("CutsceneSalim", "CutsceneIntroMoveSalim")
--         Move ("CutscenePilgrim", "CutsceneIntroMovePilgrim")
--       	 Move ("CutsceneAri", "CutsceneIntroMoveAri")
--         Move ("CutsceneHelias", "CutsceneIntroMoveHelias")
--         Move ("CutsceneKerberos", "CutsceneIntroMoveKerberos")
--end       	 
 
 

function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text1")
	
end



function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text4")
	
end


function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text5")
	
end


function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Intro_Text6")
	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	 Cutscene_Intro_End()
	 
       DestroyEntity("CutsceneBarbar1") 
        DestroyEntity("CutsceneBarbar2") 
         DestroyEntity("CutsceneBarbar3") 
          DestroyEntity("CutsceneBarbar4") 
           DestroyEntity("CutsceneBarbar5") 
            DestroyEntity("CutsceneBarbar6") 
             DestroyEntity("CutsceneBarbar7") 
              DestroyEntity("CutsceneBarbar8")
   	       DestroyEntity("CutsceneBarbar9")
	        DestroyEntity("CutsceneBarbar10")
	         DestroyEntity("CutsceneBarbar11")
	          DestroyEntity("CutsceneBarbar12")
	          

	 
--	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
 
	 Cutscene_Intro_End()
		 
       DestroyEntity("CutsceneBarbar1") 
        DestroyEntity("CutsceneBarbar2") 
         DestroyEntity("CutsceneBarbar3") 
          DestroyEntity("CutsceneBarbar4") 
           DestroyEntity("CutsceneBarbar5") 
            DestroyEntity("CutsceneBarbar6") 
             DestroyEntity("CutsceneBarbar7") 
              DestroyEntity("CutsceneBarbar8")
   	       DestroyEntity("CutsceneBarbar9")
	        DestroyEntity("CutsceneBarbar10")
	         DestroyEntity("CutsceneBarbar11")
	          DestroyEntity("CutsceneBarbar12")

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
        DestroyEntity("Pilgrim") 
         DestroyEntity("Salim") 
          DestroyEntity("Ari") 
           DestroyEntity("Helias") 
--            DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
	   
             

end



function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text1")
	
end

function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text2")
	
end

function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text3")
	
end

function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text4")
	
end

function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text5")
	
end

function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text6")
	
end


function Cutscene_MissionComplete_Text7()
	 SpokenCinematicText("CM01_11_Norfolk_Txt/Cutscene_Extro_Text7")
	
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
	Display.SetFarClipPlaneMinAndMax(0, 12000) 

	CutsceneDone()
end

