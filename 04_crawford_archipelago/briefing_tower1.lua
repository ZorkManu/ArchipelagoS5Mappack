

createBriefingTower1 = function()

	briefingTower1 = 	{}	

	briefingTower1.finished = BriefingTower1

		local page = 0

	--	page1
	
		page = page +1

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("Helias")
		briefingTower1[page].text				=	String.Key("briefingTower1[1].text")
		briefingTower1[page].position			=	GetPosition("Helias")
		briefingTower1[page].explore			=	2000
		briefingTower1[page].dialogCamera 		= 	true

	--	page2
	
		page = page +1

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("Helias")
		briefingTower1[page].text				=	String.Key("briefingTower1[2].text")
		briefingTower1[page].position			=	GetPosition("defRange_OO1")
		briefingTower1[page].explore			=	2000

	--	page3
	
		page = page +1

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("Helias")
		briefingTower1[page].text				=	String.Key("briefingTower1[3].text")
		briefingTower1[page].position			=	GetPosition("Mining2")
		briefingTower1[page].explore			=	1500

	--	page4
	
		page = page +1

		page_tower1 = page

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("Helias")
		briefingTower1[page].text				=	String.Key("briefingTower1[4].text")
		briefingTower1[page].position			=	GetPosition("tower1")
		briefingTower1[page].marker				=	ANIMATED_MARKER
		briefingTower1[page].explore			=	1000			
		briefingTower1[page].pointer			=	GetPosition("tower1")

		briefingTower1[page].quest				=	{}
		briefingTower1[page].quest.id			=	1
		briefingTower1[page].quest.type			=	MAINQUEST_OPEN
		briefingTower1[page].quest.title		=	String.MainKey.."briefingTower1[4].quest.title"
		briefingTower1[page].quest.text			=	String.MainKey.."briefingTower1[4].quest.text"

	--	page5
	
		page = page +1

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("Helias")
		briefingTower1[page].text				=	String.Key("briefingTower1[5].text")
		briefingTower1[page].position			=	GetPosition("HQ")
		briefingTower1[page].explore			=	2500

	--	page5
	
		page = page +1

		briefingTower1[page] 					= 	{}
		briefingTower1[page].title				= 	String.GenericKey("MissionObjectives")
		briefingTower1[page].text				=	String.Key("briefingTower1[6].text")
		briefingTower1[page].position			=	GetPosition("rangeCheck1_SDB")

	--	go!
	
		StartBriefing(briefingTower1)

	end
	
	

BriefingTower1 = function()

	-- give player HQ and Village center
	
		if IsAlive("HQ") then
			ChangePlayer("HQ", GetHumanPlayer())
		end
    	
--		if IsAlive("village") then
--			ChangePlayer("village", GetHumanPlayer())
--		end

	-- destroy Village in South		
		
		destroyVillage()


	-- start check for lost HQ	
	
		createQuestDefeat()

	Move(getLeadingHero(), "HQ")
	Move("Erec", "rangeCheck1_SDB")

	Move("regent", "regentMoveTo")
	local ID = GetID("regent")
	Logic.RotateEntity(ID, 180)

	
end	
	