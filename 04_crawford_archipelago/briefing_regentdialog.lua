
createBriefingRegentDialog = function()

	briefingRegentDialog = 	{}	


	briefingRegentDialog.finished = BriefingRegentDialog

		local page = 0

	--	page
	
		page = page +1

		briefingRegentDialog[page] 					= 	{}
		briefingRegentDialog[page].title			= 	String.GenericKey("Dovbar")
		briefingRegentDialog[page].text				=	String.Key("briefingRegentDialog[1].text")
		briefingRegentDialog[page].position			=	GetPosition("regent")
		briefingRegentDialog[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
		PageDovbarBarracks = page
		
		briefingRegentDialog[page] 					= 	{}
		briefingRegentDialog[page].title			= 	String.GenericKey("Dovbar")
		briefingRegentDialog[page].text				=	String.Key("briefingRegentDialog[2].text")
		briefingRegentDialog[page].position			=	GetPosition("crawfordBarracks")
		briefingRegentDialog[page].explore			=	2000			


	--	page
	
		page = page +1
		PageDovbarQuest = page

		briefingRegentDialog[page] 					= 	{}
		briefingRegentDialog[page].title			= 	String.GenericKey("Dovbar")
		briefingRegentDialog[page].text				=	String.Key("briefingRegentDialog[3].text")
		briefingRegentDialog[page].position			=	GetPosition("defSpawnPoint4_CD")
		briefingRegentDialog[page].explore			=	2000			

		briefingRegentDialog[page].quest			=	{}
		briefingRegentDialog[page].quest.id			=	5
		briefingRegentDialog[page].quest.type		=	SUBQUEST_OPEN
		briefingRegentDialog[page].quest.title		=	String.MainKey.."briefingRegentDialog[3].quest.title"
		briefingRegentDialog[page].quest.text		=	String.MainKey.."briefingRegentDialog[3].quest.text"

	--	page

		page = page +1

		briefingRegentDialog[page] 					= 	{}
		briefingRegentDialog[page].title			= 	String.GenericKey("Dovbar")
		briefingRegentDialog[page].text				=	String.Key("briefingRegentDialog[4].text")
		briefingRegentDialog[page].position			=	GetPosition("regent")
		briefingRegentDialog[page].dialogCamera 	= 	true


	--	go!
	
		StartBriefing(briefingRegentDialog)

	end
	


BriefingRegentDialog = function()

	ResolveBriefing(briefingRegentDialog[PageDovbarBarracks])

end




createBriefingHeliasAmulett = function()

-- NOT USED!

	briefingHeliasAmulett = 	{}	

		local page = 0

	--	page
	
		page = page +1

		briefingHeliasAmulett[page] 					= 	{}
		briefingHeliasAmulett[page].title			= 	String.GenericKey("Helias")
		briefingHeliasAmulett[page].text			=	String.Key("Dialog_aftercutscene1")
		briefingHeliasAmulett[page].position		=	GetPosition("Helias")
		briefingHeliasAmulett[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingHeliasAmulett)

end

