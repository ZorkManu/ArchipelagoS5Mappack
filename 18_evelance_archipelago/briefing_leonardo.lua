
createBriefingLeonardo = function()

	if QuestsFromMayorDone == true then				-- Mayor quest is fulfilled already


		briefingLeonardo = 	{}	

		briefingLeonardo.finished = BriefingLeonardoFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[1].text")
		briefingLeonardo[page].position 		= 	GetPosition("leonardo")	
		briefingLeonardo[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[2].text")
		briefingLeonardo[page].position 		= 	GetPosition("LeoVillage")	
		briefingLeonardo[page].explore			=	2000

	--	page 3

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[3].text")
		briefingLeonardo[page].position 		= 	GetPosition("LeoCanon")	
		briefingLeonardo[page].explore			=	2000

	--	page 3

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].position 		= 	GetPosition("LeosSulfurPits1")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[4].text")
		briefingLeonardo[page].marker			=	ANIMATED_MARKER
		briefingLeonardo[page].explore			=	2000
		
		rightMines = briefingLeonardo[page]

	--	page 4

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].position 		= 	GetPosition("LeosSulfurPits2")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[5].text")
		briefingLeonardo[page].marker			=	ANIMATED_MARKER
		briefingLeonardo[page].explore			=	2000

		leftMines = briefingLeonardo[page]

	--	page 5

		page = page + 1

		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("MissionObjectives")
		briefingLeonardo[page].position 		= 	{}
		briefingLeonardo[page].position.X,
		briefingLeonardo[page].position.Y 		= 	Camera.ScrollGetLookAt()
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[tasks].text")

		briefingLeonardo[page].quest			=	{}
		briefingLeonardo[page].quest.id			=	3
		briefingLeonardo[page].quest.type		=	MAINQUEST_OPEN
		briefingLeonardo[page].quest.title		=	String.MainKey.."briefingLeonardo[5].quest.title"
		briefingLeonardo[page].quest.text		=	String.MainKey.."briefingLeonardo[5].quest.text"


		BuildMinesQuest = briefingLeonardo[page]

	--	go!
	
		StartBriefing(briefingLeonardo)




	else										-- mayor quest is not fulfilled yet

		briefingLeonardo = 	{}	

		briefingLeonardo.finished = BriefingLeonardoFinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[1].text")
		briefingLeonardo[page].position 		= 	GetPosition("leonardo")	
		briefingLeonardo[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[2].text")
		briefingLeonardo[page].position 		= 	GetPosition("LeoVillage1")	
		briefingLeonardo[page].explore			=	2000

	--	page 3

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[3].text")
		briefingLeonardo[page].position 		= 	GetPosition("LeoCanon1")	
		briefingLeonardo[page].explore			=	2000

	--	page 3

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].position 		= 	GetPosition("LeosSulfurPits1")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[4b].text")
		briefingLeonardo[page].marker			=	ANIMATED_MARKER
		briefingLeonardo[page].explore			=	2000
		
		rightMines = briefingLeonardo[page]

	--	page 4

		page = page +1
	
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].position 		= 	GetPosition("LeosSulfurPits2")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[5b].text")
		briefingLeonardo[page].marker			=	ANIMATED_MARKER
		briefingLeonardo[page].explore			=	2000

		leftMines = briefingLeonardo[page]

	--	page 5

		page = page + 1

		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("MissionObjectives")
		briefingLeonardo[page].position 		= 	{}
		briefingLeonardo[page].position.X,
		briefingLeonardo[page].position.Y 		= 	Camera.ScrollGetLookAt()
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo[tasks].text")

		briefingLeonardo[page].quest			=	{}
		briefingLeonardo[page].quest.id			=	3
		briefingLeonardo[page].quest.type		=	MAINQUEST_OPEN
		briefingLeonardo[page].quest.title		=	String.MainKey.."briefingLeonardo[5].quest.title"
		briefingLeonardo[page].quest.text		=	String.MainKey.."briefingLeonardo[5].quest.text"


		BuildMinesQuest = briefingLeonardo[page]

	--	go!
	
		StartBriefing(briefingLeonardo)

	end
	
end



BriefingLeonardoFinished = function()
	
end