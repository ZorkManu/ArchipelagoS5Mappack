

createBriefingTower3 = function()

	MapLocal_CameraPositionBackup()

	briefingTower3 = 	{}	
	
	briefingTower3.finished		= BriefingTower3


		local page = 0

	--	page1
	
		page = page +1

		briefingTower3[page] 					= 	{}
		briefingTower3[page].title				= 	String.GenericKey("Helias")
		briefingTower3[page].text				=	String.Key("briefingTower3[1].text")
		briefingTower3[page].position			=	GetPosition("Helias")
		briefingTower3[page].dialogCamera 		= 	true

	--	page2
	
		page = page +1

		page_tower3 = page

		briefingTower3[page] 					= 	{}
		briefingTower3[page].title				= 	String.GenericKey("Helias")
		briefingTower3[page].text				=	String.Key("briefingTower3[2].text")
		briefingTower3[page].position			=	GetPosition("tower3")
		briefingTower3[page].marker				=	ANIMATED_MARKER
		briefingTower3[page].explore			=	1000			
		briefingTower3[page].pointer			=	GetPosition("tower3")

		briefingTower3[page].quest				=	{}
		briefingTower3[page].quest.id			=	3
		briefingTower3[page].quest.type			=	MAINQUEST_OPEN
		briefingTower3[page].quest.title		=	String.MainKey.."briefingTower3[2].quest.title"
		briefingTower3[page].quest.text			=	String.MainKey.."briefingTower3[2].quest.text"

	--	page3
	
		page = page +1

		briefingTower3[page] 					= 	{}
		briefingTower3[page].title				= 	String.GenericKey("MissionObjectives")
		briefingTower3[page].text				=	String.Key("briefingTower3[3].text")
		briefingTower3[page].position			=	GetPosition(getLeadingHero())
		briefingTower3[page].dialogCamera 		= 	true

	--	page4
	
		page = page +1

		briefingTower3[page] 					= 	{}
		briefingTower3[page].title				= 	String.GenericKey("Mentor")
		briefingTower3[page].text				=	String.GenericKey("DestroyBuildings")
		briefingTower3[page].position			=	GetPosition("attSpawnPoint3_OO2")
		briefingTower3[page].explore			=	2000			


	--	go!
	
		StartBriefing(briefingTower3)

	end
	
	
BriefingTower3 = function()

	MapLocal_CameraPositionRestore()

end
