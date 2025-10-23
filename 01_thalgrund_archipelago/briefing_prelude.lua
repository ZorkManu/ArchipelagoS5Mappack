
createBriefingPrelude = function()

	briefingPrelude = 	{}	

	--	create refugee
	
		briefingPrelude.finished = BriefingPreludeFinished
	
		briefingPrelude.refugee = CreateSerf(GetHumanPlayer(),GetPosition("firstRefugee"))
		Move(briefingPrelude.refugee,getLeadingHero(), BRIEFING_TALK_DISTANCE * 0.9)

		LookAt(getLeadingHero(), briefingPrelude.refugee)


		local page = 0

	--	page 
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude[1].text")
		briefingPrelude[page].dialogCamera 		= 	true
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id			=	briefingPrelude.refugee
		briefingPrelude[page].npc.isObserved	=	true
		briefingPrelude[page].dialogCamera 		= 	true
		
		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title		=	String.MainKey.."briefingPrelude[1].quest.title"
		briefingPrelude[page].quest.text		=	String.MainKey.."briefingPrelude[1].quest.text" 

	--	page 

		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.Key("briefingPrelude[1].title")
		briefingPrelude[page].position 			= 	GetPosition("HomeVillage1")	
		briefingPrelude[page].text				=	String.Key("briefingPrelude[2].text")
		briefingPrelude[page].marker			=	ANIMATED_MARKER
		briefingPrelude[page].dialogCamera 		= 	true
		
	--	page 	
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].position 			= 	GetPosition(getLeadingHero())
		briefingPrelude[page].dialogCamera 		= 	true

		briefingPrelude[page].text				=	{	String.Key("briefingPrelude[task1].text"),
														String.Key("briefingPrelude[task2].text")}

	--	go!
	
		StartBriefing(briefingPrelude)
	
	end


BriefingPreludeFinished = function()

	if IsValid(briefingPrelude.refugee) then

		DisableNpcMarker(briefingPrelude.refugee)
		Move(briefingPrelude.refugee,"OwnSerfTargetPos",BRIEFING_TALK_DISTANCE)

		Logic.SetEntitySelectableFlag(briefingPrelude.refugee, 0)
		Logic.SetEntityUserControlFlag(briefingPrelude.refugee, 0)

	end
		
	-- move refugees
	for i = 0, 5, 1 do
		if IsAlive("serf"..i) then
			Move("serf"..i,"serfTarget"..(5-i))
		end
	end
end


