
createBriefingWeatherMaker = function()

	briefingWeatherMaker = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingWeatherMaker[page] 			= 	{}
		briefingWeatherMaker[page].title	= 	String.GenericKey("Mentor")
		briefingWeatherMaker[page].text		=	String.GenericKey("SilentNPC")
		briefingWeatherMaker[page].position	=	GetPosition("WeatherMaker")
		briefingWeatherMaker[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingWeatherMaker)
		
	end