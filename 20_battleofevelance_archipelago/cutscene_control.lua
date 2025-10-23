----------------------------------
-- CUTSCENES
--
-- Map: 	Battle of Evelance
-- Author: 	Thomas Friedmann  / Ralf Angerbauer
-- Status: 	wip
----------------------------------

WEATHERMACHINE_ID = 0

function Cheat_Intro_Start()
	StartCutscene("Intro")
end

function Cheat_Trader1_Start()
    StartCutscene("Trader1")
end

function Cheat_Trader3_Start()
    StartCutscene("Trader3")
end



-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "INTRO"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Intro_Init()

       CreateEntity(1, Entities.PU_Hero4, GetPosition("CutsceneIntroErec"), "CutsceneErec" )
       CreateEntity(1, Entities.PU_Hero1c, GetPosition("CutsceneIntroDario"), "CutsceneDario" )
       CreateEntity(1, Entities.PU_Hero2, GetPosition("CutsceneIntroPilgrim"), "CutscenePilgrim" )
       CreateEntity(1, Entities.PU_Hero3, GetPosition("CutsceneIntroSalim"), "CutsceneSalim" )
       CreateEntity(1, Entities.PU_Hero5, GetPosition("CutsceneIntroAri"), "CutsceneAri" )       
       CreateEntity(1, Entities.PU_Hero6, GetPosition("CutsceneIntroHelias"), "CutsceneHelias" )

	 Mission_InitMovie()     
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Intro_Start()
	 Cutscene_Intro_Init()
end
	 

function Cutscene_Intro_Move()

	Move ("CutsceneErec", "CutsceneIntroMoveErec")
	Move ("CutsceneDario", "CutsceneIntroMoveDario")
	Move ("CutsceneSalim", "CutsceneIntroMoveSalim")
	Move ("CutscenePilgrim", "CutsceneIntroMovePilgrim")
	Move ("CutsceneAri", "CutsceneIntroMoveAri")
	Move ("CutsceneHelias", "CutsceneIntroMoveHelias")

end       	 
 


function Cutscene_Intro_Text1()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text1")
end

function Cutscene_Intro_Text2()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text2")
end

function Cutscene_Intro_Text3()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text3")
end

function Cutscene_Intro_Text4()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text4")
end


function Cutscene_Intro_Text5()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text5")
end


function Cutscene_Intro_Text6()
	 SpokenCinematicText(String.MainKey.."Cutscene_Intro_Text6")
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
	DestroyEntity("CutscenePilgrim") 
	DestroyEntity("CutsceneDario") 
	DestroyEntity("CutsceneAri") 
	DestroyEntity("CutsceneHelias") 
	DestroyEntity("CutsceneSalim") 

	Mission_EndMovie()
end






-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Trader1"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Trader1_Init()
	Mission_InitMovie()    
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader1_End()
	Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader1_Start()
	Cutscene_Trader1_Init()
end



------------------------------------------------------------
function Cutscene_Trader1_Finished()
	Cutscene_Trader1_End()
--	Mission_EndMovie()
end


------------------------------------------------------------
function Cutscene_Trader1_Cancel()

	Cutscene_Trader1_End()
--	Mission_EndMovie()
end
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader1_Text1()
	SpokenCinematicText(String.MainKey.."Cutscene_tribute_Merchant1Paid")
end




-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "Trader3"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_Trader3_Init()
	Mission_InitMovie()    
end

-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader3_End()
	Mission_EndMovie()
end



-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader3_Start()
	Cutscene_Trader3_Init()
end



------------------------------------------------------------
function Cutscene_Trader3_Finished()
	Cutscene_Trader3_End()
--	Mission_EndMovie()
end


------------------------------------------------------------
function Cutscene_Trader3_Cancel()

	Cutscene_Trader3_End()
--	Mission_EndMovie()
end
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_Trader3_Text1()
	SpokenCinematicText(String.MainKey.."Cutscene_tribute_Merchant3Paid")
end





-----------------------------------------------------------------------------------------------------------------------	
--
--	CUTSCENE: "WeatherMaker"
--
-----------------------------------------------------------------------------------------------------------------------	
function Cutscene_WeatherMaker_Init()

	WEATHERMACHINE_ID 		= Logic.GetEntityIDByName("WeatherMachine") 
	local X,Y 				= Logic.EntityGetPos(WEATHERMACHINE_ID)

	Logic.DestroyEntity(WEATHERMACHINE_ID)	

	WEATHERMACHINE_ID = Logic.CreateEntity(Entities.PB_Weathermachine_Activated, X,Y,345.7, 3)				
	Logic.SetBuildingSubAnim(WEATHERMACHINE_ID, 0, "PB_Weathermachine_Activated_600")


	-- change to summer
	Logic.AddWeatherElement(1, 600, 0, 1, 5, 10)
  
		-- [fun]  AddWeatherElement
		--          Add weather period on end of periods.
		-- Param1: Weather State of period, 1 = normal, 2 = rain, 3 = snow
		-- Param2: Duration of period in seconds
		-- Param3: Is periodic, 1 for (normal)periodic weather element else 0 for weather machine effects
		-- Param4: Gfx Set of this weather element
		-- Param5: Gfx Set forerun (gfx transition start some time before logic state change), time in seconds
		-- Param6: duration of Gfx Set transition
 
	Mission_InitMovie()    
end


-------------------------------------------------------------------------------------------------------------------------
function Cutscene_WeatherMaker_End()

	if Logic.IsWeatherChangeActive() ~= true then
		Cutscene_ChangeWeather()
	else
		WeatherChange_Started = StartJob("DelayWeather")
	end

	Mission_EndMovie()

end


function Cutscene_WeatherMaker_Destroy()

	Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition(WEATHERMACHINE_ID).X, GetPosition(WEATHERMACHINE_ID).Y,0)		--EXPLODE
	Sound.PlaySoundPos( Sounds.Military_SO_CannonHit_rnd_3, 0,0,0,0,0)

	Logic.DestroyEntity(WEATHERMACHINE_ID)

	MoveAndVanish("WeatherMaker", "WeatherMaker_target")

end


Cutscene_ChangeWeather = function()

	local CurrentWeatherEnergy = Logic.GetPlayersGlobalResource( 1, ResourceType.WeatherEnergy )	
	local NeededWeatherEnergy = Logic.GetEnergyRequiredForWeatherChange()


	-- reduce weather energy
		if CurrentWeatherEnergy > NeededWeatherEnergy then
			Logic.AddToPlayersGlobalResource(1, ResourceType.WeatherEnergy, (-1 * NeededWeatherEnergy))
		else
			Logic.AddToPlayersGlobalResource(1, ResourceType.WeatherEnergy, (-1 * CurrentWeatherEnergy))
		end
end




	----------------------------------------------------------------
	Condition_DelayWeather = function()                               
	----------------------------------------------------------------

		if Logic.IsWeatherChangeActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayWeather = function()                                  
	----------------------------------------------------------------
		                                                            
		Cutscene_ChangeWeather()
		EndJob(WeatherChange_Started)

	end


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
function Cutscene_WeatherMaker_Start()
	Cutscene_WeatherMaker_Init()
end



------------------------------------------------------------
function Cutscene_WeatherMaker_Finished()
	Cutscene_WeatherMaker_End()
end


------------------------------------------------------------
function Cutscene_WeatherMaker_Cancel()

	Cutscene_WeatherMaker_End()
end
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------------
function Cutscene_WeatherMaker_Text1()
	SpokenCinematicText(String.MainKey.."Cutscene_WeatherMaker_Text1")
end







--*********************************************************************************************
function Mission_InitMovie()
	
	Display.SetFogStartAndEnd (10000, 14000)
	Display.SetRenderFog (1)
	Display.SetFarClipPlaneMinAndMax(0, 15000) 

	Logic.StopPrecipitation()

	Interface_SetCinematicMode(1)
end
 
function Mission_EndMovie()
	Logic.StopPrecipitation()
	Interface_SetCinematicMode(0)
	Display.SetFarClipPlaneMinAndMax(0, 0) 

	CutsceneDone()
end
