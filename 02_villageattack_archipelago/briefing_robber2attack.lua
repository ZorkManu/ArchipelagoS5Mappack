
createBriefingRobber2Attack = function()

	MapLocal_CameraPositionBackup()	 

	briefingRobber2Attack = 	{}	

	briefingRobber2Attack.finished = BriefingRobber2Attack


		local page = 0

	--	page
	
		page = page +1

		briefingRobber2Attack[page] 			= 	{}
		briefingRobber2Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber2Attack[page].text		=	String.Key("briefingRobber2Attack[1].text")
		briefingRobber2Attack[page].position	=	GetPosition(getLeadingHero())
		briefingRobber2Attack[page].dialogCamera 	= 	true


	--	page
	
		page = page +1

		briefingRobber2Attack[page] 			= 	{}
		briefingRobber2Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber2Attack[page].text		=	String.Key("briefingRobber2Attack[2].text")
		briefingRobber2Attack[page].position	=	GetPosition("tower2")

	--	page
	
		page = page +1

		briefingRobber2Attack[page] 			= 	{}
		briefingRobber2Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber2Attack[page].text		=	String.Key("briefingRobber2Attack[3].text")
		briefingRobber2Attack[page].position	=	GetPosition("castle")

	-- Go!
		
		StartBriefing(briefingRobber2Attack)

	
end
	


	
BriefingRobber2Attack = function()
	
		MapLocal_CameraPositionRestore()

end