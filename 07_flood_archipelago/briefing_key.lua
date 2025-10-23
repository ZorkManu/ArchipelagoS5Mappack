
createBriefingKey = function()

	briefingKey = 	{}	

	local page = 0

	--	page1
	
		page = page +1
	
		briefingKey[page] 				= 	{}
		briefingKey[page].title			= 	String.GenericKey("Merchant")
		briefingKey[page].text			=	String.Key("briefingKey[1].text")
		briefingKey[page].position		=	GetPosition("merchant3")

	--	page2
	
		page = page +1

		briefingKey[page] 				= 	{}
		briefingKey[page].title			= 	String.GenericKey("Merchant")
		briefingKey[page].text			=	String.Key("briefingKey[2].text")
		briefingKey[page].position		=	GetPosition("Ari")

	--	go!
	
		StartBriefing(briefingKey)
		
	end
