
createBriefingAgainAtLeonardoThanks = function()


		briefingAgainAtLeonardoThanks = 	{}	

		briefingAgainAtLeonardoThanks.finished = BriefingAgainAtLeonardoThanks

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingAgainAtLeonardoThanks[page] 				= 	{}
		briefingAgainAtLeonardoThanks[page].title			= 	String.GenericKey("Leonardo")
		briefingAgainAtLeonardoThanks[page].text			=	String.Key("briefingAgainAtLeonardoThanks[1].text")
		briefingAgainAtLeonardoThanks[page].position 		= 	GetPosition("leonardo")	
		briefingAgainAtLeonardoThanks[page].dialogCamera 	= 	true


	--	go!
	
		StartBriefing(briefingAgainAtLeonardoThanks)
	
end



BriefingAgainAtLeonardoThanks = function()
	
end
