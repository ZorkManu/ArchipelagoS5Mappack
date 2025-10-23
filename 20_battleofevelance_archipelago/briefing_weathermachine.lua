
createBriefingWeatherMachine = function()

	briefingWeatherMachine = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingWeatherMachine[page] 			= 	{}
		briefingWeatherMachine[page].title		= 	String.GenericKey("Mentor")
		briefingWeatherMachine[page].text		=	String.Key("briefingWeatherMachine[1].text")
		briefingWeatherMachine[page].position	=	GetPosition("WeatherMachine")
		briefingWeatherMachine[page].explore	=	1500

	--	go!
	
		StartBriefing(briefingWeatherMachine)
		
	end