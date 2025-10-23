createBriefingLabyrinth = function()

	briefingLabyrinth = 	{}	

	briefingLabyrinth.finished = BriefingLabyrinth


	local page = 0

	--	page 1
	
	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("Leonardo")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[1].text")
	briefingLabyrinth[page].position 			= 	GetPosition("leonardo")
	briefingLabyrinth[page].dialogCamera 		= 	true

	--	page 2
	
	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("Leonardo")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[2].text")
	briefingLabyrinth[page].position 			= 	GetPosition("Entrace")
	briefingLabyrinth[page].explore				=	1000

	EntraceExploration = briefingLabyrinth[page]

	--	page 3
	
--	page = page +1
--
--	briefingLabyrinth[page] 					= 	{}
--	briefingLabyrinth[page].title				= 	String.GenericKey("Leonardo")
--	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[3].text")

	--	page 4
	
	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("Leonardo")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[4].text")
	briefingLabyrinth[page].position 			= 	GetPosition("DespairHQ")
--	briefingLabyrinth[page].noScrolling			=	true
	briefingLabyrinth[page].marker				=	ANIMATED_MARKER

	briefingLabyrinth[page].quest				=	{}
	briefingLabyrinth[page].quest.id			=	4
	briefingLabyrinth[page].quest.type			=	MAINQUEST_OPEN
	briefingLabyrinth[page].quest.title			=	String.MainKey.."briefingLabyrinth[4].quest.title"
	briefingLabyrinth[page].quest.text			=	String.MainKey.."briefingLabyrinth[4].quest.text"

	OrbQuest = briefingLabyrinth[page]

	--	page 5

	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("Regent")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[5].text")
	briefingLabyrinth[page].position 			= 	GetPosition("Major")
	briefingLabyrinth[page].explore				=	1000
	briefingLabyrinth[page].dialogCamera 		= 	true

	--	page 6

	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("Regent")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[6].text")
	briefingLabyrinth[page].position 			= 	GetPosition("Army1")
	briefingLabyrinth[page].explore				=	1500

	--	page 7
	
	page = page +1

	briefingLabyrinth[page] 					= 	{}
	briefingLabyrinth[page].title				= 	String.GenericKey("MissionObjectives")
	briefingLabyrinth[page].text				=	String.Key("briefingLabyrinth[task1].text")
	briefingLabyrinth[page].position 			= 	{}
	briefingLabyrinth[page].position.X,
	briefingLabyrinth[page].position.Y 			= 	Camera.ScrollGetLookAt()



	--	go!
	
	StartBriefing(briefingLabyrinth)


end


BriefingLabyrinth = function()

	-- give player military buildings of Tendrel
	for i = 1,2 do

		ChangePlayer("Army"..i, 1)

		local PosX,PosY = Tools.GetPosition("Army"..i)
		GUI.CreateMinimapPulse(PosX, PosY, 1)

	end
	
end



