
-- Have freed keymaster after quest was started
createBriefingKeymasterAppears = function()

	briefingKeymasterAppears = 	{}	

	briefingKeymasterAppears.finished = BriefingKeymasterAppears

	local page = 0

	--	page
	
		page = page +1
	
		briefingKeymasterAppears[page] 				= 	{}
		briefingKeymasterAppears[page].title		= 	String.Key("briefingKeymaster[1].title")
		briefingKeymasterAppears[page].text			=	String.Key("briefingKeymasterAppears[1].text")
		briefingKeymasterAppears[page].position		=	GetPosition("keymaster")

		briefingKeymasterAppears[page].npc				=	{}
		briefingKeymasterAppears[page].npc.id			=	"keymaster"
		briefingKeymasterAppears[page].npc.isObserved	=	true
		briefingKeymasterAppears[page].dialogCamera 	= 	true

		StartBriefing(briefingKeymasterAppears)

	end
	
	
	
	
BriefingKeymasterAppears = function()

		Move("keymaster", "gate" ,BRIEFING_TALK_DISTANCE)

		local ID = GetID("keymaster")
		Logic.RotateEntity(ID, 180)


	end	
	

-----------------------------------------------------------------
-- Keymaster freed BEFORE Gate quest was started
createBriefingKeymasterAppears2 = function()

	briefingKeymasterAppears2 =	{}	

	--	briefing finished callback function

		briefingKeymasterAppears2.finished = BriefingKeymasterAppears2

		local page = 0

	--	page
	
		page = page +1
	
		briefingKeymasterAppears2[page] 			= 	{}
		briefingKeymasterAppears2[page].title		= 	String.Key("briefingKeymaster[1].title")
		briefingKeymasterAppears2[page].text		=	String.Key("briefingKeymasterAppears2[1].text")
		briefingKeymasterAppears2[page].position 	= 	GetPosition("keymaster")	


		briefingKeymasterAppears2[page].npc			=	{}
		briefingKeymasterAppears2[page].npc.id			=	"keymaster"
		briefingKeymasterAppears2[page].npc.isObserved	=	true

	--	go!
	
		StartBriefing(briefingKeymasterAppears2)
	
	end

BriefingKeymasterAppears2 = function()

	ResolveBriefing(briefingKeymasterAppears2[1])

	Move("keymaster", "gate" ,BRIEFING_TALK_DISTANCE)

	local ID = GetID("keymaster")
	Logic.RotateEntity(ID, 180)


end	



