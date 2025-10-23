

createBriefingTower2 = function()

	MapLocal_CameraPositionBackup()

	briefingTower2 = 	{}	

	briefingTower2.finished		= BriefingTower2

		local page = 0

	--	page1
	
		page = page +1


		briefingTower2[page] 					= 	{}
		briefingTower2[page].title				= 	String.GenericKey("Helias")
		briefingTower2[page].text				=	String.Key("briefingTower2[1].text")
		briefingTower2[page].position			=	GetPosition("Helias")
		briefingTower2[page].dialogCamera 		= 	true

	--	page2
	
		page = page +1

		page_tower2 = page

		briefingTower2[page] 					= 	{}
		briefingTower2[page].title				= 	String.GenericKey("Helias")
		briefingTower2[page].text				=	String.Key("briefingTower2[2].text")
		briefingTower2[page].position			=	GetPosition("tower2")
		briefingTower2[page].marker				=	ANIMATED_MARKER
		briefingTower2[page].explore			=	1000			
		briefingTower2[page].pointer			=	GetPosition("tower2")

		briefingTower2[page].quest				=	{}
		briefingTower2[page].quest.id			=	2
		briefingTower2[page].quest.type			=	MAINQUEST_OPEN
		briefingTower2[page].quest.title		=	String.MainKey.."briefingTower2[2].quest.title"
		briefingTower2[page].quest.text			=	String.MainKey.."briefingTower2[2].quest.text"

	--	page3
	
		page = page +1

		briefingTower2[page] 					= 	{}
		briefingTower2[page].title				= 	String.GenericKey("Helias")
		briefingTower2[page].text				=	String.Key("briefingTower2[3].text")
		briefingTower2[page].position			=	GetPosition("defRange_OO2")
		briefingTower2[page].explore			=	1000			


	--	page4
	
		page = page +1

		briefingTower2[page] 					= 	{}
		briefingTower2[page].title				= 	String.GenericKey("MissionObjectives")
		briefingTower2[page].text				=	String.Key("briefingTower2[4].text")
		briefingTower2[page].position			=	GetPosition("Dario")
		briefingTower2[page].dialogCamera 		= 	true

	--	page5
	
		page = page +1

		briefingTower2[page] 					= 	{}
		briefingTower2[page].title				= 	String.GenericKey("Mentor")
		briefingTower2[page].text				=	String.GenericKey("DestroyBuildings")
		briefingTower2[page].position			=	GetPosition("attSpawnPoint3_OO1")
		briefingTower2[page].explore			=	2000			



	--	go!
	
		StartBriefing(briefingTower2)

	end
	
	
BriefingTower2 = function()

	MapLocal_CameraPositionRestore()

end
