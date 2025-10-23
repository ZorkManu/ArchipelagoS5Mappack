----------------------------------
-- CUTSCENES
--
-- Map: 	18_Evelance
-- Author: 	Ralf Angerbauer
-- Status: 	wip
----------------------------------


function Cheat_Intro_Start()
         StartCutscene("Intro")
end

function Cheat_MissionComplete_Start()
         StartCutscene("MissionComplete")
end


function Cheat_Cutscene1_Start()
         StartCutscene("Cutscene1")
end



function Cheat_Cutscene2_Start()
         StartCutscene("Cutscene2")
end


function Cheat_Cutscene3_Start()
         StartCutscene("Cutscene3")
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
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntroPilgrim"), "CutscenePilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntroSalim"), "CutsceneSalim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntroAri"), "CutsceneAri" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntroHelias"), "CutsceneHelias" )
       CreateEntity(1, Entities.CU_BlackKnight, GetPosition("CutsceneIntroKerberos"), "CutsceneKerberos" )
       
       
       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntro2Erec"), "CutsceneErec2" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneIntro2Dario"), "CutsceneDario2" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntro2Pilgrim"), "CutscenePilgrim2" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntro2Salim"), "CutsceneSalim2" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntro2Ari"), "CutsceneAri2" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntro2Helias"), "CutsceneHelias2" )
       CreateEntity(1, Entities.CU_BlackKnight, GetPosition("CutsceneIntro2Kerberos"), "CutsceneKerberos2" ) 
       

	LookAt("CutsceneErec2", "CutsceneIntro2Kerberos")
	LookAt("CutsceneDario2", "CutsceneIntro2Kerberos")
	LookAt("CutsceneSalim2", "CutsceneIntro2Kerberos")
	LookAt("CutscenePilgrim2", "CutsceneIntro2Kerberos")
	LookAt("CutsceneAri2", "CutsceneIntro2Kerberos")
	LookAt("CutsceneHelias2", "CutsceneIntro2Kerberos")
	LookAt("CutsceneKerberos2", "CutsceneDario2")

       
end
	 
	 

function Cutscene_Intro_Move()

       	 Move ("CutsceneErec", "CutsceneIntroMoveErec")
       	 Move ("CutsceneDario", "CutsceneIntroMoveDario")
         Move ("CutsceneSalim", "CutsceneIntroMoveSalim")
         Move ("CutscenePilgrim", "CutsceneIntroMovePilgrim")
       	 Move ("CutsceneAri", "CutsceneIntroMoveAri")
         Move ("CutsceneHelias", "CutsceneIntroMoveHelias")
         Move ("CutsceneKerberos", "CutsceneIntroMoveKerberos")
end       	 
 
 

function Cutscene_Intro_Move2()

--intro startaufstellung der helden
	 
       DestroyEntity("CutsceneErec") 
        DestroyEntity("CutsceneDario") 
         DestroyEntity("CutscenePilgrim") 
          DestroyEntity("CutsceneSalim") 
           DestroyEntity("CutsceneAri") 
            DestroyEntity("CutsceneHelias") 
             DestroyEntity("CutsceneKerberos") 
   


       	 Move ("CutsceneErec2", "CutsceneIntro2MoveErec")
       	 Move ("CutsceneDario2", "CutsceneIntro2MoveDario")
         Move ("CutsceneSalim2", "CutsceneIntro2MoveSalim")
         Move ("CutscenePilgrim2", "CutsceneIntro2MovePilgrim")
       	 Move ("CutsceneAri2", "CutsceneIntro2MoveAri")
         Move ("CutsceneHelias2", "CutsceneIntro2MoveHelias")
         Move ("CutsceneKerberos2", "CutsceneIntro2MoveKerberos")
         

end       	 
 


function Cutscene_Intro_Text1()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text1")
	
end



function Cutscene_Intro_Text2()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text2")		-- empty text
	
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text3")
	
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text4")
	
end


function Cutscene_Intro_Text5()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text5")
	
end


function Cutscene_Intro_Text6()
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text6")


	--intro helden an der kreuzung kerberos verlaesst die truppe	 
       DestroyEntity("CutsceneErec2") 
        DestroyEntity("CutsceneDario2") 
         DestroyEntity("CutscenePilgrim2") 
          DestroyEntity("CutsceneSalim2") 
           DestroyEntity("CutsceneAri2") 
            DestroyEntity("CutsceneHelias2") 
             DestroyEntity("CutsceneKerberos2") 
	 
end


function Cutscene_Intro_Text7()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Intro_Text7")
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
function Cutscene_Intro_SetView()
    Display.SetFogColor (152,172,182)
    Display.SetFogStartAndEnd (5000, 10000)
    Display.SetRenderFog (1)
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Intro_End()

	if IsAlive("CutsceneErec") then
		DestroyEntity("CutsceneErec") 
	end

	if IsAlive("CutsceneDario") then
		DestroyEntity("CutsceneDario") 
	end
	
	if IsAlive("CutscenePilgrim") then
		DestroyEntity("CutscenePilgrim") 
	end
	
	if IsAlive("CutsceneSalim") then
		DestroyEntity("CutsceneSalim") 
	end

	if IsAlive("CutsceneAri") then
		DestroyEntity("CutsceneAri") 
	end
	
	if IsAlive("CutsceneHelias") then
		DestroyEntity("CutsceneHelias") 
	end
	
	if IsAlive("CutsceneKerberos") then
		DestroyEntity("CutsceneKerberos")
	end

	if IsAlive("CutsceneErec2") then
		DestroyEntity("CutsceneErec2") 
	end

	if IsAlive("CutsceneDario2") then
		DestroyEntity("CutsceneDario2") 
	end

	if IsAlive("CutscenePilgrim2") then
		DestroyEntity("CutscenePilgrim2") 
	end

	if IsAlive("CutsceneSalim2") then
		DestroyEntity("CutsceneSalim2") 
	end

	if IsAlive("CutsceneAri2") then
		DestroyEntity("CutsceneAri2") 
	end

	if IsAlive("CutsceneHelias2") then
		DestroyEntity("CutsceneHelias2") 
	end

	if IsAlive("CutsceneKerberos2") then
		DestroyEntity("CutsceneKerberos2") 
	end
 	 
	Mission_EndMovie()
	  
end









-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene1 - Spieler erreicht Watchhill"
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


-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene1_Text1()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_Text1") 
end

function Cutscene_Cutscene1_Text2()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_Text2") 
end

function Cutscene_Cutscene1_Text3()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_Text3") 
end


function Cutscene_Cutscene1_Text4()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Viewpoint_Text1") 
end
function Cutscene_Cutscene1_Text5()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Viewpoint_Text2") 
end

function Cutscene_Cutscene1_EMPTY()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_EMPTY") 
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "AriPilgrim - Dialog"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_AriPilgrim_Init()
	
	CreateEntity(1, Entities.PU_Hero2, GetPosition("PilgrimPosition"), "CutscenePilgrim" )
	CreateEntity(1, Entities.PU_Hero5, GetPosition("AriPosition"), "CutsceneAri" )       

	Logic.SetEntitySelectableFlag("CutscenePilgrim", 0)
	Logic.SetEntityUserControlFlag("CutscenePilgrim", 0)

	Logic.SetEntitySelectableFlag("CutsceneAri", 0)
	Logic.SetEntityUserControlFlag("CutsceneAri", 0)

	LookAt("CutscenePilgrim", "CutsceneAri")
	LookAt("CutsceneAri", "CutscenePilgrim")

	Mission_InitMovie()    
	 
end

function Cutscene_AriPilgrim_End()
	
	DestroyEntity("CutscenePilgrim") 
	DestroyEntity("CutsceneAri") 

	InitNPCLookAt("TellAboutViewPoint")

	Mission_EndMovie()

end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_AriPilgrim_Start()
	 Cutscene_AriPilgrim_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_AriPilgrim_Finished()
	Cutscene_AriPilgrim_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_AriPilgrim_Cancel()
	Cutscene_AriPilgrim_End()
end


-------------------------------------------------------------------------------------------------------------------------

function Cutscene_AriPilgrim_Text1()  
	SpokenCinematicText("CM01_18_Evelance_Txt/briefingAriPilgrim[1].text") 
end

function Cutscene_AriPilgrim_Text2()  
	SpokenCinematicText("CM01_18_Evelance_Txt/briefingAriPilgrim[2].text") 
end

function Cutscene_AriPilgrim_Text3()  
	SpokenCinematicText("CM01_18_Evelance_Txt/briefingAriPilgrim[3].text") 
end


function Cutscene_AriPilgrim_Text4()  
	SpokenCinematicText("CM01_18_Evelance_Txt/briefingAriPilgrim[4].text") 
end

function Cutscene_AriPilgrim_EMPTY()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_EMPTY") 
end


-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Seer - Dialog"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Seer_Init()
	Mission_InitMovie()    
end

function Cutscene_Seer_End()
	Mission_EndMovie()
end

-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Seer_Start()
	 Cutscene_Seer_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Seer_Finished()
	Cutscene_Seer_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Seer_Cancel()
	Cutscene_Seer_End()
end


-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Seer_Text1()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Seer.text1") 
end


function Cutscene_Seer_Text2()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Seer.text2") 
end


function Cutscene_Seer_Text3()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Seer.text3") 
end


function Cutscene_Seer_Text4()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Seer.text4") 
end


function Cutscene_Seer_EMPTY()  
	SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene1_EMPTY") 
end






-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene2 - Kerberos HQ"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene2_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene2_Start()
	 Cutscene_Cutscene2_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene2_Finished()
	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene2_Cancel()
	 Mission_EndMovie()
end


-------------------------------------------------------------------------------------------------------------------------






-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Cutscene3 - Flug durch Leonardos Minen"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_Cutscene3_Init()
	 Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------


function Cutscene_Cutscene3_Start()
	 Cutscene_Cutscene3_Init()
end



-------------------------------------------------------------------------------------------------------------------------

function Cutscene_Cutscene3_Finished()
	 Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Cutscene3_Cancel()
	 Mission_EndMovie()
end


-------------------------------------------------------------------------------------------------------------------------








-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_MissionComplete_Start()

	   Mission_InitMovie()    

       
--       DestroyEntity("Dario") 
--        DestroyEntity("Pilgrim") 
--         DestroyEntity("Salim") 
--          DestroyEntity("Ari") 
--           DestroyEntity("Helias") 
--            DestroyEntity("Kerberos") 
--             DestroyEntity("Erec")
	   
             

end
 


function Cutscene_MissionComplete_Move3()         
 	Move ("ExtroHelias", "CutsceneExtroMoveHelias")
end         
             


function Cutscene_MissionComplete_Text1()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text1")
	
end

function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text2")
	
end

function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text3")
	
end

function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text4")
	
end

function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text5")
	
end

function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text6")
	
end


function Cutscene_MissionComplete_Text7()
	 SpokenCinematicText("CM01_18_Evelance_Txt/Cutscene_Extro_Text7")
	
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
	
	Display.SetFogStartAndEnd (10000, 16000)
	Display.SetRenderFog (1)
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

