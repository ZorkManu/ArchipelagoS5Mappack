
createBriefingAgainAtLeonardo = function()


		briefingAgainAtLeonardo = 	{}	

		briefingAgainAtLeonardo.finished = BriefingAgainAtLeonardo

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingAgainAtLeonardo[page] 				= 	{}
		briefingAgainAtLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingAgainAtLeonardo[page].text			=	String.Key("briefingAgainAtLeonardo[1].text")
		briefingAgainAtLeonardo[page].position 		= 	GetPosition("leonardo")	
		briefingAgainAtLeonardo[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		briefingAgainAtLeonardo[page] 				= 	{}
		briefingAgainAtLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingAgainAtLeonardo[page].text			=	String.Key("briefingAgainAtLeonardo[2].text")
		briefingAgainAtLeonardo[page].position 		= 	GetPosition("LeosSulfurPits2")	

	--	page 3
	
		page = page +1
	
		briefingAgainAtLeonardo[page] 				= 	{}
		briefingAgainAtLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingAgainAtLeonardo[page].text			=	String.Key("briefingAgainAtLeonardo[3].text")
		briefingAgainAtLeonardo[page].position 		= 	GetPosition("leonardo")	
		briefingAgainAtLeonardo[page].dialogCamera 	= 	true


	--	go!
	
		StartBriefing(briefingAgainAtLeonardo)



	
end



BriefingAgainAtLeonardo = function()
	
end
