-- At mayor, sends player to Leonardo

createBriefingMeetLeonardo = function()


	BriefingMeetLeonardo = 	{}	

	
		BriefingMeetLeonardo.finished = BriefingMeetLeonardoFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		BriefingMeetLeonardo[page] 				= 	{}
		BriefingMeetLeonardo[page].title		= 	String.GenericKey("Regent")
		BriefingMeetLeonardo[page].text			=	String.Key("BriefingMeetLeonardo[1].text")
		BriefingMeetLeonardo[page].position 	= 	GetPosition("Major")
		BriefingMeetLeonardo[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		BriefingMeetLeonardo[page] 				= 	{}
		BriefingMeetLeonardo[page].title		= 	String.GenericKey("Regent")
		BriefingMeetLeonardo[page].text			=	String.Key("BriefingMeetLeonardo[2].text")
		BriefingMeetLeonardo[page].position 	= 	GetPosition("DespairHQ")
		BriefingMeetLeonardo[page].explore		=	1000

	--	page 3

		page = page +1
		PageLeoEntrance = page
	
		BriefingMeetLeonardo[page] 				= 	{}
		BriefingMeetLeonardo[page].title		= 	String.GenericKey("Regent")
		BriefingMeetLeonardo[page].position 	= 	GetPosition("Entrace")
		BriefingMeetLeonardo[page].text			=	String.Key("BriefingMeetLeonardo[3].text")
		BriefingMeetLeonardo[page].explore		=	1000

	--	page 3
	
		page = page +1
		MeetLeonardo_Marker = page
	
		BriefingMeetLeonardo[page] 				= 	{}
		BriefingMeetLeonardo[page].title		= 	String.GenericKey("Regent")
		BriefingMeetLeonardo[page].text			=	String.Key("BriefingMeetLeonardo[4].text")
		BriefingMeetLeonardo[page].position 	= 	GetPosition("leonardo")
		BriefingMeetLeonardo[page].explore		=	1000
		BriefingMeetLeonardo[page].marker		=	ANIMATED_MARKER
		BriefingMeetLeonardo[page].dialogCamera 	= 	true

		BriefingMeetLeonardo[page].quest		=	{}
		BriefingMeetLeonardo[page].quest.id		=	6
		BriefingMeetLeonardo[page].quest.type	=	MAINQUEST_OPEN
		BriefingMeetLeonardo[page].quest.title	=	String.MainKey.."BriefingMeetLeonardo[4].quest.title"
		BriefingMeetLeonardo[page].quest.text	=	String.MainKey.."BriefingMeetLeonardo[4].quest.text"
		
	--	page 4

		page = page + 1

		BriefingMeetLeonardo[page] 				= 	{}
		BriefingMeetLeonardo[page].title		= 	String.GenericKey("MissionObjectives")
		BriefingMeetLeonardo[page].position 	= 	GetPosition("Major")
		BriefingMeetLeonardo[page].text			=	String.Key("BriefingMeetLeonardo[task1].text")
		BriefingMeetLeonardo[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(BriefingMeetLeonardo)
	
	end


BriefingMeetLeonardoFinished = function()

	-- Open gate to leonardo XXX

	-- Clear exploration of entrace
	ResolveBriefing(BriefingMeetLeonardo[PageLeoEntrance])
end