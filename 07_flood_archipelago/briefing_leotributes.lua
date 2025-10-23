
createBriefingTribute1 = function()

	briefingTribute1 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute1[page] 					= 	{}
		briefingTribute1[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute1[page].text				=	String.Key("briefingTribute1[1].text")
		briefingTribute1[page].position			=	GetPosition("Leo2")
		briefingTribute1[page].explore			=	2000
		briefingTribute1[page].dialogCamera 		= 	true

	--	page2

		page = page +1

		page_Tribute1 = page
	
		briefingTribute1[page] 					= 	{}
		briefingTribute1[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute1[page].text				=	String.Key("briefingTribute1[2].text")
		briefingTribute1[page].position			=	GetPosition("Leo")
		briefingTribute1[page].dialogCamera 		= 	true

		briefingTribute1[page].quest			=	{}
		briefingTribute1[page].quest.id			=	2
		briefingTribute1[page].quest.type		=	MAINQUEST_OPEN
		briefingTribute1[page].quest.title		=	String.MainKey.."briefingTribute1[2].quest.title"
		briefingTribute1[page].quest.text		=	String.MainKey.."briefingTribute1[2].quest.text"

	--	page 3
	
		page = page +1
	
		briefingTribute1[page] 					= 	{}
		briefingTribute1[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute1[page].text				=	String.Key("briefingTribute1[3].text")
		briefingTribute1[page].position			=	GetPosition("Leo")

	--	go!
	
		StartBriefing(briefingTribute1)
		InitNPC("Leo")	
			
	end

createBriefingTribute2 = function()

	briefingTribute2 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute2[page] 					= 	{}
		briefingTribute2[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute2[page].text				=	String.Key("briefingTribute2[1].text")
		briefingTribute2[page].position			=	GetPosition("Leo")
		briefingTribute2[page].dialogCamera 		= 	true

	--	page 2

		page = page +1

		page_Tribute2 = page
	
		briefingTribute2[page] 				= 	{}
		briefingTribute2[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute2[page].text			=	String.Key("briefingTribute2[2].text")
		briefingTribute2[page].position			=	GetPosition("Leo")
		briefingTribute2[page].dialogCamera 		= 	true

		briefingTribute2[page].quest			=	{}
		briefingTribute2[page].quest.id			=	3
		briefingTribute2[page].quest.type		=	MAINQUEST_OPEN
		briefingTribute2[page].quest.title		=	String.MainKey.."briefingTribute2[2].quest.title"
		briefingTribute2[page].quest.text		=	String.MainKey.."briefingTribute2[2].quest.text"

	--	page 3

		page = page +1

		briefingTribute2[page] 					= 	{}
		briefingTribute2[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute2[page].text				=	String.Key("briefingTribute2[3].text")
		briefingTribute2[page].position			=	GetPosition("merchant1")
		briefingTribute2[page].explore			=	2000

	--	page 1
	
		page = page +1
	
		briefingTribute2[page] 					= 	{}
		briefingTribute2[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute2[page].text				=	String.Key("briefingTribute2[4].text")
		briefingTribute2[page].position			=	GetPosition("Leo")

	--	go!
	
		StartBriefing(briefingTribute2)
		
	end

createBriefingTribute3 = function()

	briefingTribute3 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute3[page] 					= 	{}
		briefingTribute3[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute3[page].text				=	String.Key("briefingTribute3[1].text")
		briefingTribute3[page].position			=	GetPosition("Leo")
		briefingTribute3[page].dialogCamera 		= 	true

	--	page 2

		page = page +1

		page_Tribute3 = page
	
		briefingTribute3[page] 					= 	{}
		briefingTribute3[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute3[page].text				=	String.Key("briefingTribute3[2].text")
		briefingTribute3[page].position			=	GetPosition("Leo")
		briefingTribute3[page].dialogCamera 		= 	true

		briefingTribute3[page].quest			=	{}
		briefingTribute3[page].quest.id			=	4
		briefingTribute3[page].quest.type		=	MAINQUEST_OPEN
		briefingTribute3[page].quest.title		=	String.MainKey.."briefingTribute3[2].quest.title"
		briefingTribute3[page].quest.text		=	String.MainKey.."briefingTribute3[2].quest.text"

	--	page 3

		page = page +1

		briefingTribute3[page] 					= 	{}
		briefingTribute3[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute3[page].text				=	String.Key("briefingTribute3[3].text")
		briefingTribute3[page].position			=	GetPosition("merchant2")
		briefingTribute3[page].explore			=	2000

	--	page 1
	
		page = page +1
	
		briefingTribute3[page] 					= 	{}
		briefingTribute3[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute3[page].text				=	String.Key("briefingTribute3[4].text")
		briefingTribute3[page].position			=	GetPosition("Leo")


	--	go!
	
		StartBriefing(briefingTribute3)
		
	end

createBriefingTribute4 = function()

	briefingTribute4 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute4[page] 					= 	{}
		briefingTribute4[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute4[page].text				=	String.Key("briefingTribute4[1].text")
		briefingTribute4[page].position			=	GetPosition("Leo")
		briefingTribute4[page].dialogCamera 		= 	true

	--	page 2

		page = page +1

		page_Tribute4 = page
	
		briefingTribute4[page] 					= 	{}
		briefingTribute4[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute4[page].text				=	String.Key("briefingTribute4[2].text")
		briefingTribute4[page].position			=	GetPosition("WeatherTowerPos")
--		briefingTribute4[page].dialogCamera 		= 	true

		briefingTribute4[page].quest			=	{}
		briefingTribute4[page].quest.id			=	5
		briefingTribute4[page].quest.type		=	MAINQUEST_OPEN
		briefingTribute4[page].quest.title		=	String.MainKey.."briefingTribute4[2].quest.title"
		briefingTribute4[page].quest.text		=	String.MainKey.."briefingTribute4[2].quest.text"

	--	page 3

		page = page +1

		briefingTribute4[page] 					= 	{}
		briefingTribute4[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute4[page].text				=	String.Key("briefingTribute4[3].text")
		briefingTribute4[page].position			=	GetPosition("merchant3")
		briefingTribute4[page].explore			=	2000

	--	page 1
	
		page = page +1
	
		briefingTribute4[page] 					= 	{}
		briefingTribute4[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute4[page].text				=	String.Key("briefingTribute4[4].text")
		briefingTribute4[page].position			=	GetPosition("Leo")


	--	go!
	
		StartBriefing(briefingTribute4)
		
	end

createBriefingTribute1paid = function()
Report("Tribute PaidXX")
	briefingTribute1paid = 	{}
		Logic.AddQuest(
		1,									
		10,						
		MAINQUEST_OPEN,		
		"CM01_07_Flood/briefingPrelude[2].quest.title",
		"CM01_07_Flood/briefingPrelude[2].quest.title",			
		1)
	TalkToLeoQuestIsActive = true
		
	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute1paid[page] 					= 	{}
		briefingTribute1paid[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute1paid[page].text				=	String.Key("briefingTribute1paid[1].text")
		briefingTribute1paid[page].position			=	GetPosition("Leo")
		briefingTribute1paid[page].dialogCamera 		= 	true

	--	go!
	if IsNear("Dario","Leo",2000) == false and IsNear("Erec","Leo",2000) == false and IsNear("Helias","Leo",2000) == false 
		then
			StartBriefing(briefingTribute1paid)
		end
	end
	
--------------------------
createBriefingTribute2paid = function()
Report("Tribute PaidXX")

	briefingTribute2paid = 	{}	
			Logic.AddQuest(
		1,									
		10,						
		MAINQUEST_OPEN,		
		"CM01_07_Flood/briefingPrelude[2].quest.title",
		"CM01_07_Flood/briefingPrelude[2].quest.title",			
		1)
	TalkToLeoQuestIsActive = true

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute2paid[page] 					= 	{}
		briefingTribute2paid[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute2paid[page].text				=	String.Key("briefingTribute2paid[1].text")
		briefingTribute2paid[page].position			=	GetPosition("Leo")
		briefingTribute2paid[page].dialogCamera 		= 	true

	--	go!
	if IsNear("Dario","Leo",2000) == false and IsNear("Erec","Leo",2000) == false and IsNear("Helias","Leo",2000) == false 
		then
			StartBriefing(briefingTribute2paid)
		end
	end
--------------------------
createBriefingTribute3paid = function()
Report("Tribute PaidXX")

	briefingTribute3paid = 	{}	
			Logic.AddQuest(
		1,									
		10,						
		MAINQUEST_OPEN,		
		"CM01_07_Flood/briefingPrelude[2].quest.title",
		"CM01_07_Flood/briefingPrelude[2].quest.title",			
		1)
	TalkToLeoQuestIsActive = true

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingTribute3paid[page] 					= 	{}
		briefingTribute3paid[page].title			= 	String.GenericKey("Leonardo")
		briefingTribute3paid[page].text				=	String.Key("briefingTribute3paid[1].text")
		briefingTribute3paid[page].position			=	GetPosition("Leo")
		briefingTribute3paid[page].dialogCamera 		= 	true

	--	go!
	if IsNear("Dario","Leo",2000) == false and IsNear("Erec","Leo",2000) == false and IsNear("Helias","Leo",2000) == false 
		then
			StartBriefing(briefingTribute3paid)
		end
	end
		