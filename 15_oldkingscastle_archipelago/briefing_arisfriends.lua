createBriefingAriFriends = function()

		briefingAriFriends 						= 	{}	

	
		briefingAriFriends.finished 			=	BriefingAriFriendsFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingAriFriends[page] 				= 	{}
		briefingAriFriends[page].title			= 	String.Key("briefingAriFriends[1].title")
		briefingAriFriends[page].text			=	String.Key("briefingAriFriends[1].text")
		briefingAriFriends[page].position 		= 	GetPosition("AriFriends1")
		briefingAriFriends[page].explore		=	1400
		briefingAriFriends[page].dialogCamera 	= 	true

	--	page 2

		page = page +1
	
		briefingAriFriends[page] 				= 	{}
		briefingAriFriends[page].title			= 	String.GenericKey("Dario")
		briefingAriFriends[page].text			=	String.Key("briefingAriFriends[2].text")
		briefingAriFriends[page].position 		= 	GetPosition(getLeadingHero())
--		briefingAriFriends[page].dialogCamera 	= 	true


	--	page 3
	
		page = page +1
	
		briefingAriFriends[page] 				= 	{}
		briefingAriFriends[page].title			= 	String.Key("briefingAriFriends[1].title")
		briefingAriFriends[page].text			=	String.Key("briefingAriFriends[3].text")
		briefingAriFriends[page].position 		= 	GetPosition("AriFriends1")
		briefingAriFriends[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingAriFriends)
	
end



BriefingAriFriendsFinished = function()

	ResolveBriefing(briefingAriFriends[1])
	
end