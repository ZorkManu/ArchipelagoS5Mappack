createBriefingPrelude = function()
	InitNPCLookAt("SwampNPC")
	
	briefingPrelude = 	{}	

	--	create refugee
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("Mentor")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].position		= GetPosition("HQ")
				

	--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("P5_SwordmenPosition2")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[2].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[2].quest.text" 
		
		PreludeMainquest = briefingPrelude[page]
		
	--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("FolklungEntrance")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[3].text")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].explore			= 1500
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	2
		briefingPrelude[page].quest.type		=	SUBQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[3].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[3].quest.text" 
		
		PreludeFolklungCity = briefingPrelude[page]
		
			--	page 
		
		
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition("HQ")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[4].text")

	--	go!
		Explore.Show("BattlefieldExploration","P5_SwordmenPosition2", 3000)
		StartBriefing(briefingPrelude)
end

BriefingPreludeFinished = function()
	--Logic.SetWeatherOffset(gvMission.SummerLength + gvMission.WinterLength - 30)
	Explore.Hide("BattlefieldExploration")
end