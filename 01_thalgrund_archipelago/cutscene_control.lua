----------------------------------
-- CUTSCENES
--
-- Map: 	Thalgrund
-- Author: 	Ralf Angerbauer, Thomas Friedmann
-- Status: 	ok
----------------------------------




-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Leonardo"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Leonardo_Init()
	Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Leonardo_Start()
	Cutscene_Leonardo_Init()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Leonardo_Finished()
	Cutscene_Leonardo_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Leonardo_Cancel()

	Cutscene_Leonardo_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Leonardo_Text1()
	SpokenCinematicText(String.MainKey.."briefingLeonardo[1].text")
end


function Cutscene_Leonardo_Text2()
	SpokenCinematicText(String.MainKey.."briefingLeonardo[2].text")
end

function Cutscene_Leonardo_Text3()
	SpokenCinematicText(String.MainKey.."briefingLeonardo[3].text")
end

function Cutscene_Leonardo_Text4()
	SpokenCinematicText(String.MainKey.."briefingLeonardo[4].text")
end

function Cutscene_Leonardo_EMPTY()
	 SpokenCinematicText("CM_GenericText/Cutscene_EmptyText")
end



-------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Leonardo_End()

	Mission_EndMovie()	
     
	createBriefingLeonardo()

end
-------------------------------------------------------------------------------------------------------------------------









-----------------------------------------------------------------------------------------------------------------------	
--
--	EXTRO-CUTSCENE: "MissionComplete"
--
-----------------------------------------------------------------------------------------------------------------------	

function Cutscene_MissionComplete_Start()

	Mission_InitMovie()   
	
	CreateEntity(1, Entities.PU_Hero1a, GetPosition("CutsceneExtroDario"), "ExtroDario" )

    local ID = GetID("ExtroDario")
	Logic.RotateEntity(ID, 180)
	 
end


function Cutscene_MissionComplete_Text1()

	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text1")
	
end


function Cutscene_MissionComplete_Text2()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text2")
	
end


function Cutscene_MissionComplete_Text3()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text3")
	
end


function Cutscene_MissionComplete_Text4()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text4")
	
end


function Cutscene_MissionComplete_Text5()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text5")
	
end


function Cutscene_MissionComplete_Text6()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text6")
	
end


function Cutscene_MissionComplete_Text7()
	 SpokenCinematicText("CM01_01_Thalgrund_Txt/Cutscene_Extro_Text7")
	
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Finished()

	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_MissionComplete_Cancel()

	Mission_EndMovie()	
end



-------------------------------------------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Waterfall"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Waterfall_Init()

	Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Waterfall_Start()
	Cutscene_Waterfall_Init()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Waterfall_Finished()
	Cutscene_Waterfall_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Waterfall_Cancel()

	Cutscene_Waterfall_End()
end



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Waterfall_End()

	Mission_EndMovie()	

end


function Cutscene_Waterfall_Text0()
	SpokenCinematicText(String.MainKey.."briefingNPC[5a].text")
end

function Cutscene_Waterfall_Text1()
	SpokenCinematicText(String.MainKey.."briefingNPC[5b].text")
end











--*********************************************************************************************
function Mission_InitMovie()
	
    Display.SetFogStartAndEnd (5000, 15000)
    Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 16000) 

	Logic.StopPrecipitation()
	Interface_SetCinematicMode(1)
 
end


function Mission_EndMovie()
	-- disable Cutscene mode

	Interface_SetCinematicMode(0)
	Display.SetFarClipPlaneMinAndMax(0, 0) 

	Logic.StopPrecipitation()

	CutsceneDone()

end

