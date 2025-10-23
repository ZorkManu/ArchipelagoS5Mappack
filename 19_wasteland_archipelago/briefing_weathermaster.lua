createBriefingWeatherMaster = function()

	briefingWeatherMaster = 	{}	

	
		briefingWeatherMaster.finished = briefingWeatherMasterFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingWeatherMaster[page] 				= 	{}
--		briefingWeatherMaster[page].title			= 	COLOR2.."< Weather Master >"
--		briefingWeatherMaster[page].text			=	"Hello, for a little tribute i can let it snow."
		briefingWeatherMaster[page].title			=	String.Key("briefingWeatherMaster1.title")
		briefingWeatherMaster[page].text			=	String.Key("briefingWeatherMaster1.text")
		briefingWeatherMaster[page].position 		= 	GetPosition("weathermaster")

	--	page 1
	
		page = page +1
	
		briefingWeatherMaster[page] 				= 	{}
--		briefingWeatherMaster[page].title			= 	MISSION_OBJECTIVES
--		briefingWeatherMaster[page].text			=	COLOR0.."1)"..COLOR1.."Pay 2000 Gold to the master for a white suprise."
		briefingWeatherMaster[page].title			=	String.GenericKey("MissionObjectives")
		briefingWeatherMaster[page].text			=	String.Key("briefingWeatherMaster2.text")
		briefingWeatherMaster[page].position 			= 	{}
		briefingWeatherMaster[page].position.X,briefingWeatherMaster[page].position.Y = Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingWeatherMaster)


end

briefingWeatherMasterFinished = function()

	DisableNpcMarker("weathermaster")

end