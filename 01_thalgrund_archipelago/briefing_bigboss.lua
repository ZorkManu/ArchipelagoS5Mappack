
createBriefingBigBoss = function()

	briefingBigBoss = 	{}	

	briefingBigBoss.finished = BriefingBigBossFinished

	local page = 0

	--	page
	
		page = page +1
	
		briefingBigBoss[page] 				= 	{}
		briefingBigBoss[page].title			= 	XGUIEng.GetStringTableText(String.MainKey.."briefingBigBoss[1].title")
		briefingBigBoss[page].position 		= 	GetPosition("Johannes")
		briefingBigBoss[page].text			=	XGUIEng.GetStringTableText(String.MainKey.."briefingBigBoss[1].text")
		briefingBigBoss[page].explore		=	BRIEFING_EXPLORATION_RANGE
		briefingBigBoss[page].dialogCamera 	= 	true

		briefingBigBoss[page].npc			=	{}
		briefingBigBoss[page].npc.id		=	GetEntityId("Johannes")

		briefingBigBoss[page].quest			=	{}
		briefingBigBoss[page].quest.id		=	5
		briefingBigBoss[page].quest.type	=	MAINQUEST_OPEN
		briefingBigBoss[page].quest.title	=	String.MainKey.."cameraquest"
		briefingBigBoss[page].quest.text	=	String.MainKey.."camerazoom"

	--	page
	
		page = page +1
	
		briefingBigBoss[page] 				= 	{}
		briefingBigBoss[page].title			= 	XGUIEng.GetStringTableText(String.MainKey.."briefingBigBoss[2].title")
		briefingBigBoss[page].text			=	XGUIEng.GetStringTableText(String.MainKey.."briefingBigBoss[2].text")
		briefingBigBoss[page].position 		= 	GetPosition("bossFight")
		briefingBigBoss[page].marker		=	ANIMATED_MARKER

	--	page	
	
		page = page +1
	
		briefingBigBoss[page] 				= 	{}
		briefingBigBoss[page].title			= 	XGUIEng.GetStringTableText("CM_GenericText/MissionObjectives")
		briefingBigBoss[page].position 		= 	GetPosition(getLeadingHero())
		briefingBigBoss[page].text			=	COLOR0.."1)"..COLOR1.."Search the enemy leader.\n"..COLOR0.."2)"..COLOR1.."Kill him and his army."
		briefingBigBoss[page].dialogCamera 	= 	true

		StartBriefing(briefingBigBoss)
	
	end


BriefingBigBossFinished = function()

	end
