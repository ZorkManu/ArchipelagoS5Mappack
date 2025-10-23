

createBriefingDestroyKerberos = function()

	briefingDestroyKerberos = 	{}	

		local page = 0

	--	page1
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[1].text")
		briefingDestroyKerberos[page].position			=	GetPosition("Helias")
		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	page2

		page = page +1

		page_destroyKerberos = page

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[2].text")
		briefingDestroyKerberos[page].position			=	GetPosition("enemyCastle")
		briefingDestroyKerberos[page].marker			=	ANIMATED_MARKER
		briefingDestroyKerberos[page].explore			=	1500			

		briefingDestroyKerberos[page].quest				=	{}
		briefingDestroyKerberos[page].quest.id			=	4
		briefingDestroyKerberos[page].quest.type		=	MAINQUEST_OPEN
		briefingDestroyKerberos[page].quest.title		=	String.MainKey.."briefingDestroyKerberos[2].quest.title"
		briefingDestroyKerberos[page].quest.text		=	String.MainKey.."briefingDestroyKerberos[2].quest.text"

	--	page3
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[3].text")
		briefingDestroyKerberos[page].position			=	GetPosition("stone")
		briefingDestroyKerberos[page].explore			=	1500			


	--	page4

		page = page +1
		PageBishop = page
		
		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[4].text")
		briefingDestroyKerberos[page].position			=	GetPosition("bishop")
		briefingDestroyKerberos[page].marker			=	ANIMATED_MARKER
		briefingDestroyKerberos[page].explore			=	1500			
		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	page5

		page = page +1
		PageRegent = page

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[5].text")
		briefingDestroyKerberos[page].position			=	GetPosition("regent")
		briefingDestroyKerberos[page].marker			=	ANIMATED_MARKER
		briefingDestroyKerberos[page].explore			=	1500			
		briefingDestroyKerberos[page].dialogCamera 		= 	true

		briefingDestroyKerberos[page].quest				=	{}
		briefingDestroyKerberos[page].quest.id			=	8
		briefingDestroyKerberos[page].quest.type		=	MAINQUEST_OPEN
		briefingDestroyKerberos[page].quest.title		=	String.MainKey.."briefingDestroyKerberos[5].quest.title"
		briefingDestroyKerberos[page].quest.text		=	String.MainKey.."briefingDestroyKerberos[5].quest.text"

	--	page 6
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("Dialog_aftercutscene1a")
		briefingDestroyKerberos[page].position			=	GetPosition("Helias")
		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	page 7
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.Key("Cutscene_Cutscene1_Text2")
		briefingDestroyKerberos[page].text				=	String.Key("Cutscene_Cutscene1_Text7")
		briefingDestroyKerberos[page].position			=	GetPosition(getLeadingHero())
--		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	page 8
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.Key("Cutscene_Cutscene1_Text2")
		briefingDestroyKerberos[page].text				=	String.Key("Cutscene_Cutscene1_Text8")
		briefingDestroyKerberos[page].position			=	GetPosition(getLeadingHero())
		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	page 9
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("Helias")
		briefingDestroyKerberos[page].text				=	String.Key("Dialog_aftercutscene1b")
		briefingDestroyKerberos[page].position			=	GetPosition("Helias")
		briefingDestroyKerberos[page].dialogCamera 		= 	true


	--	page 10
	
		page = page +1

		briefingDestroyKerberos[page] 					= 	{}
		briefingDestroyKerberos[page].title				= 	String.GenericKey("MissionObjectives")
		briefingDestroyKerberos[page].text				=	String.Key("briefingDestroyKerberos[6].text")
		briefingDestroyKerberos[page].position			=	GetPosition(getLeadingHero())
		briefingDestroyKerberos[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingDestroyKerberos)

	end
	
	
