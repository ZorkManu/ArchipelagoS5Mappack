
createBriefingLeonardoDialog = function()

	briefingLeonardoDialog = 	{}	
	
	briefingLeonardoDialog.finished = BriefingLeonardoDialogFinished 

	local page = 0

	--	page
	
		page = page +1
	
		briefingLeonardoDialog[page] 			= 	{}
		briefingLeonardoDialog[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardoDialog[page].text		=	String.Key("briefingLeonardoDialog[1].text")
		briefingLeonardoDialog[page].position	=	GetPosition("Leonardo")
		briefingLeonardoDialog[page].dialogCamera 	= 	true

	--	page
	
		page = page +1
	
		briefingLeonardoDialog[page] 				= 	{}
		briefingLeonardoDialog[page].title			= 	String.GenericKey("NewTechnology")
		briefingLeonardoDialog[page].position 		= 	GetPosition(getLeadingHero())
		briefingLeonardoDialog[page].dialogCamera 	= 	true
		briefingLeonardoDialog[page].text			=	{	String.GenericKey("GetNewBuilding"),
														String.GenericKey("Ballistatower")
														}
	
	--	go!
	
		StartBriefing(briefingLeonardoDialog)
		
	end
	
	
	
BriefingLeonardoDialogFinished = function()

	InitNPC("Leonardo")
	MoveAndVanish("Leonardo", "GoldChest1")

end
