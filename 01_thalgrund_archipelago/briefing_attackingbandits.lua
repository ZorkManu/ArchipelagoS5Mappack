-- Player shall reach exit

createBriefingAttackingBandits = function()

	briefingAttackingBandits = 	{}	

	briefingAttackingBandits.finished = BriefingAttackingBanditsFinished

	local page = 0

	--	page
	
		page = page +1
		
		page_Johannes = page
	
		briefingAttackingBandits[page] 				= 	{}
		briefingAttackingBandits[page].title		= 	String.Key("_Johannes")
		briefingAttackingBandits[page].text			=	String.Key("briefingAttackingBandits[1].text")
		briefingAttackingBandits[page].position		=	GetPosition("Johannes")
		briefingAttackingBandits[page].explore		=	1000
		briefingAttackingBandits[page].dialogCamera = 	true

	--	page
	
		page = page +1

		page_gate = page
	
		briefingAttackingBandits[page] 				= 	{}
		briefingAttackingBandits[page].title		= 	String.Key("_Johannes")
		briefingAttackingBandits[page].text			=	String.Key("briefingAttackingBandits[2].text")
		briefingAttackingBandits[page].position		=	GetPosition("gate")
		briefingAttackingBandits[page].explore		=	2000
		briefingAttackingBandits[page].marker		=	ANIMATED_MARKER

		briefingAttackingBandits[page].quest		=	{}
		briefingAttackingBandits[page].quest.id		=	4
		briefingAttackingBandits[page].quest.type	=	MAINQUEST_OPEN
		briefingAttackingBandits[page].quest.title	=	String.MainKey.."briefingAttackingBandits[2].quest.title"
		briefingAttackingBandits[page].quest.text	=	String.MainKey.."briefingAttackingBandits[2].quest.text"

	--	page	
	
		page = page +1
	
		briefingAttackingBandits[page] 				= 	{}
		briefingAttackingBandits[page].title		= 	String.GenericKey("MissionObjectives")
		briefingAttackingBandits[page].position		=	GetPosition("gate")
		briefingAttackingBandits[page].text			=	{ 	String.Key("briefingAttackingBandits[task1].text"), 
															String.Key("briefingAttackingBandits[task2].text")
														}
		StartBriefing(briefingAttackingBandits)
	
	end


BriefingAttackingBanditsFinished = function()

		ResolveBriefing(briefingAttackingBandits[page_Johannes])

		MapLocal_CameraPositionRestore()

	end