
createBriefingLeonardo = function()

	briefingLeonardo = 	{}	

	briefingLeonardo.finished = BriefingLeonardoFinished

	local page = 0

	--	page
	
--		page = page +1
--	
--		briefingLeonardo[page] 					= 	{}
--		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
--		briefingLeonardo[page].position 		= 	GetPosition("Leonardo")
--		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[1].text")
--		briefingLeonardo[page].dialogCamera 	= 	true
--
--	--	page
--	
--		page = page +1
--	
--		briefingLeonardo[page] 					= 	{}
--		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
--		briefingLeonardo[page].position 		= 	GetPosition("InventorsHut")
--		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[2].text")
--
--	--	page
--	
--		page = page +1
--	
--		briefingLeonardo[page] 					= 	{}
--		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
--		briefingLeonardo[page].position 		= 	GetPosition("Dario")
--		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[3].text")
--		briefingLeonardo[page].dialogCamera 	= 	true
--
--	--	page
--	
--		page = page +1
--	
--		briefingLeonardo[page] 					= 	{}
--		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
--		briefingLeonardo[page].position 		= 	GetPosition("LeoTower")
--		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[4].text")
--		briefingLeonardo[page].explore			=	1500

	--	page
	
		page = page +1
		
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("NewTechnology")
		briefingLeonardo[page].position 		= 	GetPosition(getLeadingHero())
		briefingLeonardo[page].dialogCamera 	= 	true
		briefingLeonardo[page].text				=	{	String.GenericKey("GetNewBuilding"), 
														String.GenericKey("WatchTower")
													}

	-- Go!

		StartBriefing(briefingLeonardo)
	
	end


BriefingLeonardoFinished = function()

	end