
createEstablishBaseBriefing = function()



	briefingEstablishBase =	{}	

	--	briefing finished callback function

		briefingEstablishBase.finished = BriefingEstablishBaseFinished

		local page = 0

	--	page 1
	
		page = page +1
		page_SeeJohannes = page
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[1].text")
		briefingEstablishBase[page].position 	= 	GetPosition("Johannes")
		briefingEstablishBase[page].explore		=	1000
		briefingEstablishBase[page].dialogCamera 	= 	true

	--	page 
	
		page = page +1
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[2].text")
		briefingEstablishBase[page].position 	= 	GetPosition(getLeadingHero())	
		briefingEstablishBase[page].dialogCamera 	= 	true

	--	page 

		page = page +1
	
		page_constructBarracks = page
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].position 	= 	GetPosition("HomeVillage1")	
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[3].text")
		briefingEstablishBase[page].marker		=	ANIMATED_MARKER

		briefingEstablishBase[page].quest		=	{}
		briefingEstablishBase[page].quest.id	=	3
		briefingEstablishBase[page].quest.type	=	MAINQUEST_OPEN
		briefingEstablishBase[page].quest.title	=	String.MainKey.."briefingEstablishBase[3].quest.title"
		briefingEstablishBase[page].quest.text	=	String.MainKey.."briefingEstablishBase[3].quest.text"

	--	page 

		page = page +1
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].position 	= 	GetPosition("castle")	
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[4].text")
		briefingEstablishBase[page].explore		=	2000

	--	page 

		page = page +1
	
		page_searchFriendlyVillage = page
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].position 	= 	GetPosition("NPC_Village2_2")	
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[5].text")
		briefingEstablishBase[page].marker		=	STATIC_MARKER
		briefingEstablishBase[page].explore		=	2000
		briefingEstablishBase[page].dialogCamera 	= 	true
		
	--	page 	
	
		page = page +1
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.GenericKey("MissionObjectives")
		briefingEstablishBase[page].position 	= 	GetPosition(getLeadingHero())
		briefingEstablishBase[page].text		=	{	String.Key("briefingEstablishBase[task1].text"),
														String.Key("briefingEstablishBase[task2].text"),
														String.Key("briefingEstablishBase[task3].text")
													}
													
		briefingEstablishBase[page].dialogCamera 	= 	true

	--	page 

		page = page +1
	
		briefingEstablishBase[page] 			= 	{}
		briefingEstablishBase[page].title		= 	String.Key("_Johannes")
		briefingEstablishBase[page].position 	= 	GetPosition("Abbey")	
		briefingEstablishBase[page].text		=	String.Key("briefingEstablishBase[6].text")

	--	go!
	
		StartBriefing(briefingEstablishBase)
	
	end



BriefingEstablishBaseFinished = function()

	-- Create serfs for player at Abbey
	for i = 1, 3, 1 do 
		local serfId = CreateEntity(GetHumanPlayer(), Entities.PU_Serf, GetPosition("abbey"))
		Move(serfId,"HomeVillage1")
		
	end

	-- explore Mayor west village
		local x, y = Tools.GetPosition("Mayor_Archers")
		Tools.ExploreArea(x, y, 20)
		
		GUI.CreateMinimapMarker(x, y, 0)

	ResolveBriefing(briefingEstablishBase[page_SeeJohannes])

end	
