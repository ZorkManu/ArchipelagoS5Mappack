createBriefingGuardWaterfall = function()

		briefingGuardWaterfall					= 	{}	
                                         	
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingGuardWaterfall[page] 				= 	{}
		briefingGuardWaterfall[page].title			= 	String.GenericKey("Soldier")
		briefingGuardWaterfall[page].text			=	String.Key("GuardWaterfall1")
		briefingGuardWaterfall[page].position 	= 	GetPosition("GuardWaterfall")

	--	page 2
	                                            	
		page = page +1                          	
	                                            	
		briefingGuardWaterfall[page] 				= 	{}
		briefingGuardWaterfall[page].title			= 	String.GenericKey("Soldier")
		briefingGuardWaterfall[page].text			=	String.Key("GuardWaterfall2")
		briefingGuardWaterfall[page].position 	= 	GetPosition("WaterfallPos")


	--	go!
	
		StartBriefing(briefingGuardWaterfall)


end
