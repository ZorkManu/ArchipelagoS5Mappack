createBriefingChestFound = function()

	briefingChestFound = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingChestFound[page] 					= 	{}
		briefingChestFound[page].title			= 	String.GenericKey("Ari")
		briefingChestFound[page].text				=	String.Key("briefingChestFound[1].text")
		briefingChestFound[page].position			=	GetPosition("chest3")

	--	page 2

		page = page +1

		page_ChestFound = page
	
		briefingChestFound[page] 					= 	{}
		briefingChestFound[page].title			= 	String.GenericKey("Ari")
		briefingChestFound[page].text				=	String.Key("briefingChestFound[2].text")
		briefingChestFound[page].position			=	GetPosition("merchant3")

--	if QuestSearchKeyFlag == nil
--	then 
--		briefingChestFound[page].quest			=	{}
--		briefingChestFound[page].quest.id			=	7
--		briefingChestFound[page].quest.type		=	MAINQUEST_OPEN
--		briefingChestFound[page].quest.title		=	String.MainKey.."briefingChestFound[1].quest.title"
--		briefingChestFound[page].quest.text		=	String.MainKey.."briefingChestFound[1].quest.text"
--	QuestSearchKeyFlag = true
--	end
	
	--	page 3

		page = page +1

		briefingChestFound[page] 					= 	{}
		briefingChestFound[page].title			= 	String.GenericKey("Ari")
		briefingChestFound[page].text				=	String.Key("briefingChestFound[3].text")
		briefingChestFound[page].position			=	GetPosition("Ari")

	--	go!
	
		
end
	