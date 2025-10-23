createBriefingPlayerWeatherChange = function()

		briefingPlayerWeatherChange 					= 	{}	

	
		briefingPlayerWeatherChange.finished 			=	briefingPlayerWeatherChangeFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPlayerWeatherChange[page] 			= 	{}
		briefingPlayerWeatherChange[page].title		= 	String.GenericKey("mentor")
		briefingPlayerWeatherChange[page].text		=	String.Key("BriefingWeatherMachineActivated1")
		briefingPlayerWeatherChange[page].position 	= 	GetPosition("P2_WinterGather")

	--	page 2

		page = page +1
	
		briefingPlayerWeatherChange[page] 			= 	{}
		briefingPlayerWeatherChange[page].title		= 	String.GenericKey("mentor")
		briefingPlayerWeatherChange[page].text		=	String.Key("BriefingWeatherMachineActivated2")
		briefingPlayerWeatherChange[page].position 	= 	GetPosition("P4_WinterGather")
		

	--	page 3

		page = page +1
	
		briefingPlayerWeatherChange[page] 			= 	{}
		briefingPlayerWeatherChange[page].title		= 	String.GenericKey("mentor")
		briefingPlayerWeatherChange[page].text		=	String.Key("BriefingWeatherMachineActivated3")
		briefingPlayerWeatherChange[page].position 	= 	GetPosition("NorfolkEntry")

-- go	
		StartBriefing(briefingPlayerWeatherChange)
	
	end


briefingPlayerWeatherChangeFinished = function()

--	DisableNpcMarker("PlayerWeatherChange")

--	briefingPlayerWeatherChange.PlayerWeatherChange = GetID("PlayerWeatherChange")
--	MoveAndVanish(briefingPlayerWeatherChange.PlayerWeatherChange,"MayorNPC")


end