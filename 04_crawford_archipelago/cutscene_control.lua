----------------------------------
-- CUTSCENES
--
-- Map: 	10_Crawford
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


-- Init scripting tables
-------------------------------------------------------------------------------------------------------------------------

--Cutscene1 = {}
--Cutscene2 = {}
--
--Cutscene1.dummy1 = 0
--Cutscene1.dummy2 = 0
--






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
         CreateEntity(1, Entities.PU_Hero1a, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
         CreateEntity(2, Entities.PU_Hero6, GetPosition("CutsceneIntroHelias"), "CutsceneHelias" )         
     
         CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntroErec2"), "CutsceneErec2" )
         CreateEntity(1, Entities.PU_Hero1a, GetPosition("CutsceneIntroDario2"), "CutsceneDario2" )
     
     	local ID = GetID("CutsceneHelias")
		Logic.RotateEntity(ID, 180)

end
	 

function Cutscene_Intro_Move()

       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
end	 
	 

function Cutscene_Intro_Move2()

       	 Move ("CutsceneErec2", "CutsceneIntroMove2Erec")
       	 Move ("CutsceneDario2", "CutsceneIntroMove2Dario")
end	




function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text1")
	
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text2")
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text4")
	
end

function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text5")
	
end

function Cutscene_Intro_Text6()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text6")
	
end

function Cutscene_Intro_Text7()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Intro_Text7")
	
end

-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
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


function Cutscene_Intro_End()

        DestroyEntity("CutsceneErec") 
        DestroyEntity("CutsceneDario") 
         DestroyEntity("CutsceneHelias") 
          
       DestroyEntity("CutsceneErec2") 
        DestroyEntity("CutsceneDario2") 

	CutsceneDone()

--	 Mission_EndMovie()
end


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene1 - Spieler erreicht Helias"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene1_Init()
--	 Mission_InitMovie()    
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
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text1")
	
end


function Cutscene_Cutscene1_Text2()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text2")
	
end

function Cutscene_Cutscene1_Text3()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text3")
	
end


function Cutscene_Cutscene1_Text4()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text4")
	
end


function Cutscene_Cutscene1_Text5()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text5")
	
end


function Cutscene_Cutscene1_Text6()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text6")
	
end


function Cutscene_Cutscene1_Text7()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text7")
	
end


function Cutscene_Cutscene1_Text8()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Cutscene1_Text8")
	
end
-------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "CutsceneComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

  function Cutscene_CutsceneComplete_Start()

	   Mission_InitMovie()    

       DestroyEntity("Dario") 
--        DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
--          DestroyEntity("Ari") 
             DestroyEntity("Helias") 
--            DestroyEntity("Kerberos") 
             DestroyEntity("Erec")
	   
                  
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneExtroErec"), "CutsceneErec2" )
       CreateEntity(1, Entities.PU_Hero1a, GetPosition("CutsceneExtroDario"), "CutsceneDario2" )
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneExtroHelias"), "CutsceneHelias2" )
       
       CreateEntity(5, Entities.CU_BlackKnight, GetPosition("CutsceneExtroKeberos"), "CutsceneKeberos" ) 
       CreateEntity(1, Entities.PU_Hero1b, GetPosition("CutsceneExtroDario2"), "CutsceneDario3" )
       
--	local ID = GetID("CutsceneDario3")
--	Logic.RotateEntity(ID, 270)

	LookAt("CutsceneErec2", "CutsceneDario2")
	LookAt("CutsceneHelias2", "CutsceneDario2")
	LookAt("CutsceneDario2", "CutsceneHelias2")


	ID = GetID("CutsceneKeberos")
	Logic.RotateEntity(ID, 270)

	-- make Kerberos' castle burn
		local kerberosCastle = Logic.GetEntityIDByName("enemyCastle")
		Tools.ChangeHealthOfEntity(kerberosCastle, 30)

end



function Cutscene_CutsceneComplete_Move()

       	 Move ("CutsceneKeberos", "CutsceneExtroMoveKeberosA")
end	 


function Cutscene_CutsceneComplete_Move2()

       	 Move ("CutsceneKeberos", "CutsceneExtroMoveKeberos")
end	 


function Cutscene_CutsceneComplete_Text1()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text1")
	
end



function Cutscene_CutsceneComplete_Text2()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text2")
	
end




function Cutscene_CutsceneComplete_Text3()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text3")
	
end



function Cutscene_CutsceneComplete_Text4()

		Logic.SetDiplomacyState( 1, 5, Diplomacy.Friendly )
		Logic.SetDiplomacyState( 2, 5, Diplomacy.Friendly )
		Logic.SetDiplomacyState( 4, 5, Diplomacy.Friendly)

	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text4")
	
end



function Cutscene_CutsceneComplete_Text5()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text5")
	
end



function Cutscene_CutsceneComplete_Text6()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text6")
	
end


function Cutscene_CutsceneComplete_Text7()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text7")
	
end


function Cutscene_CutsceneComplete_Text8()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_Extro_Text8")
	
end


function Cutscene_CutsceneComplete_CLEAR()
	 SpokenCinematicText("CM01_04_Crawford_Txt/Cutscene_EmptyText")
	
end


function Cutscene_Cutscene_CutsceneComplete_END()

	local ID = Logic.GetEntityIDByName("CutsceneDario3")
	Logic.SetEntityName(ID, "Dario")

	local ID = Logic.GetEntityIDByName("CutsceneErec2")
	Logic.SetEntityName(ID, "Erec")

	local ID = Logic.GetEntityIDByName("CutsceneHelias2")
	Logic.SetEntityName(ID, "Helias")

end



-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Finished()
	Cutscene_Cutscene_CutsceneComplete_END()
	Mission_EndMovie()	
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_CutsceneComplete_Cancel()
	Cutscene_Cutscene_CutsceneComplete_END()
	Mission_EndMovie()	
end


--*********************************************************************************************
function Mission_InitMovie()
	
	Display.SetFogStartAndEnd (1000, 10000)
	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 15000) 

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

