createBriefingWeatherMasterOff = function()

	BriefingWeatherMasterOff = 	{}	

	
		BriefingWeatherMasterOff.finished = BriefingWeatherMasterOffFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		BriefingWeatherMasterOff[page] 				= 	{}
--		BriefingWeatherMasterOff[page].title			= 	COLOR2.."< Weather Master >"
--		BriefingWeatherMasterOff[page].text			=	"Hello, for a little tribute i can let it snow."
		BriefingWeatherMasterOff[page].title			=	String.Key("BriefingWeatherMaster1.title")
		BriefingWeatherMasterOff[page].text			=	String.Key("BriefingWeatherMasterOff1.text")
		BriefingWeatherMasterOff[page].position 		= 	GetPosition("weathermaster_off")

	--	page 1
	
		page = page +1
	
		BriefingWeatherMasterOff[page] 				= 	{}
--		BriefingWeatherMasterOff[page].title			= 	MISSION_OBJECTIVES
--		BriefingWeatherMasterOff[page].text			=	COLOR0.."1)"..COLOR1.."Pay 2000 Gold to the master for a white suprise."
		BriefingWeatherMasterOff[page].title			=	String.Key("BriefingWeatherMaster1.title")
		BriefingWeatherMasterOff[page].text			=	String.Key("BriefingWeatherMasterOff2.text")
		BriefingWeatherMasterOff[page].position 			= 	{}
		BriefingWeatherMasterOff[page].position.X,BriefingWeatherMasterOff[page].position.Y = Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(BriefingWeatherMasterOff)


end

BriefingWeatherMasterOffFinished = function()

	DisableNpcMarker("weathermaster_off")

end