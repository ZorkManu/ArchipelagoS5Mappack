
createBriefingRobber1Attack = function()

	briefingRobber1Attack = 	{}	

	briefingRobber1Attack.finished = BriefingRobber1Attack

		local page = 0

	--	page
	
		page = page +1

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[1].text")
		briefingRobber1Attack[page].position	=	GetPosition(getLeadingHero())
		briefingRobber1Attack[page].dialogCamera 	= 	true

	--	page
	
		page = page +1

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[2].text")
		briefingRobber1Attack[page].position	=	GetPosition("tower1")

	--	page
	
		page = page +1

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[3].text")
		briefingRobber1Attack[page].position	=	GetPosition("castle")


	-- go!
	
		StartBriefing(briefingRobber1Attack)


end
	
	

	
BriefingRobber1Attack = function()
	
		MapLocal_CameraPositionRestore()

end
	


-------------------------------------------------------------------------------------------
	
createBriefingRobber1Warning = function()

	briefingRobber1Warning = 	{}	

	briefingRobber1Warning.finished = BriefingRobber1Warning

		local page = 0

	--	page
	
		page = page +1

		briefingRobber1Warning[page] 				= 	{}
		briefingRobber1Warning[page].title			= 	String.GenericKey("Mentor")
		briefingRobber1Warning[page].text			=	String.Key("briefingRobber1Warning[1].text")
		briefingRobber1Warning[page].position		=	GetPosition(getLeadingHero())
		briefingRobber1Warning[page].dialogCamera 	= 	true


	--	page
	
		page = page +1

		briefingRobber1Warning[page] 				= 	{}
		briefingRobber1Warning[page].title			= 	String.GenericKey("Mentor")
		briefingRobber1Warning[page].text			=	String.Key("briefingRobber1Warning[2].text")
		briefingRobber1Warning[page].position		=	GetPosition("tower1")

	-- Go!
		
		StartBriefing(briefingRobber1Warning)
	
end
	
	

	
BriefingRobber1Warning = function()
	
		MapLocal_CameraPositionRestore()

end