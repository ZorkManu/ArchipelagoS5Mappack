-- Princess freeded, bring her to her father

createBriefingDaughter = function()

	briefingDaughter = 	{}	

	local page = 0

	--	page 1
	
	page = page +1

	briefingDaughter[page] 						= 	{}
	briefingDaughter[page].title				= 	String.Key("briefingDaughter[1].title")
	briefingDaughter[page].text					=	String.Key("briefingDaughter[1].text")
	briefingDaughter[page].position 			= 	GetPosition("Princess")
	briefingDaughter[page].dialogCamera 		= 	true
                                            	
	--	page 2
	
	page = page +1

	briefingDaughter[page] 						= 	{}
	briefingDaughter[page].title				= 	String.Key("briefingDaughter[1].title")
	briefingDaughter[page].text					=	String.Key("briefingDaughter[2].text")
	briefingDaughter[page].position 			= 	GetPosition("graveyard")
	briefingDaughter[page].explore				=	1400
                                            	
	--	page 3                              	
	                                        	
	page = page +1                          	
                                            	
	briefingDaughter[page] 						= 	{}
	briefingDaughter[page].title				= 	String.Key("briefingDaughter[1].title")
	briefingDaughter[page].text					=	String.Key("briefingDaughter[3].text")
	briefingDaughter[page].position 			= 	GetPosition("Major")
	briefingDaughter[page].explore				=	1400
	briefingDaughter[page].marker				=	ANIMATED_MARKER

	briefingDaughter[page].quest				=	{}
	briefingDaughter[page].quest.id				=	5
	briefingDaughter[page].quest.type			=	MAINQUEST_OPEN
	briefingDaughter[page].quest.title			=	String.MainKey.."briefingDaughter[2].quest.title"
	briefingDaughter[page].quest.text			=	String.MainKey.."briefingDaughter[2].quest.text"

	BringDaughterQuest = briefingDaughter[page]

	--	page 4
	
	page = page +1

	briefingDaughter[page] 						= 	{}
	briefingDaughter[page].title				= 	String.GenericKey("MissionObjectives")
	briefingDaughter[page].text					=	String.Key("briefingDaughter[task1].text")
	briefingDaughter[page].position 			= 	{}

	briefingDaughter[page].position.X, 
	briefingDaughter[page].position.Y 			= 	Camera.ScrollGetLookAt()

	--	go!
	
	StartBriefing(briefingDaughter)


end
