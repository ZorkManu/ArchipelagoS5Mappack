----------------------------------
-- CUTSCENES
--
-- Map: 	13_Plaque
-- Author: 	Ralf Angerbauer
	
----------------------------------


function Cheat_Intro_Start()
         Cutscene.Start("Intro")
end



function Cheat_MissionComplete_Start()
         StartCutscene("MissionComplete")
end




-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	


function Cutscene_Intro_Init()

	Logic.SetDiplomacyState( 1, 2, Diplomacy.Neutral	)
	Logic.SetDiplomacyState( 1, 3, Diplomacy.Neutral 	)
	Logic.SetDiplomacyState( 1, 5, Diplomacy.Neutral 	)
	
	Mission_InitMovie()     
	 
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Start()
	Cutscene_Intro_Init()

	CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntroErec"), "CutsceneErec" )
	CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
	CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntroSalim"), "CutsceneSalim" )

end

	 

function Cutscene_Intro_Move()

       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
         Move ("CutsceneSalim", "CutsceneIntroMoveSalim")

end       






function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text1")
	
end



function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text2")
	
end



function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text3")
	
end



function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text4")
	
end



function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text5")
	
end



function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Intro_Text6")
	
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_Finished()
	Cutscene_Intro_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Cancel()
	 Cutscene_Intro_End()
end




-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_End()

	Mission_InitDiplomacy()

	DestroyEntity("CutsceneDario") 
	DestroyEntity("CutsceneErec") 
	DestroyEntity("CutsceneSalim") 
 
	Mission_EndMovie()
	
end


-----------------------------------------------------------------------------------------------------------------------	


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
--          DestroyEntity("Ari") 
           DestroyEntity("Helias") 
--            DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
    
    	Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly	)
    
          
	local darioID 	= CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario"), "CutsceneDario" )
	local ariID 	= CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneExtroAri"), "CutsceneAri" ) 

	CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneErec" )
	CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneExtroSalim"), "CutsceneSalim" )
	CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneExtroPilgrim"), "CutscenePilgrim" )
	CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "CutsceneHelias" )

	LookAt("CutsceneErec", 		darioID )
	LookAt("CutsceneAri", 		darioID )
	LookAt("CutsceneDario", 	ariID )
	LookAt("CutscenePilgrim", 	darioID )
	LookAt("CutsceneHelias", 	darioID )
	LookAt("CutsceneSalim", 	darioID )

end



function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text1")
	
end



function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text2")
	
end




function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text3")
	
end



function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text4")
	
end



function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text5")
	
end



function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text6")
	
end


function Cutscene_MissionComplete_Text7()

	LookAt("CutsceneAri", "CutsceneErec")
	LookAt("CutsceneDario", "CutsceneErec")

	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Extro_Text7")
	
end

function Cutscene_MissionComplete_Text8()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Cutscene1_Text1")
end

function Cutscene_MissionComplete_Text9()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Cutscene1_Text3")
end

function Cutscene_MissionComplete_Text10()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Cutscene1_Text4")
end

function Cutscene_MissionComplete_Text11()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Cutscene1_Text5")
end

function Cutscene_MissionComplete_Text12()
	 SpokenCinematicText("CM01_13_Plague_Txt/Cutscene_Cutscene1_Text6")
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

