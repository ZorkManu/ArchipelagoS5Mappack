
createBriefingMerchant3 = function()

	briefingMerchant3 = 	{}	

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingMerchant3[page] 				= 	{}
		briefingMerchant3[page].title			= 	String.GenericKey("Merchant")
		briefingMerchant3[page].text			=	String.Key("briefingMerchant3[1].text")
		briefingMerchant3[page].position		=	GetPosition("merchant3")

	--	page 2
	
		page = page +1
	
		briefingMerchant3[page] 				= 	{}
		briefingMerchant3[page].title			= 	String.GenericKey("Merchant")
		briefingMerchant3[page].text			=	String.Key("briefingMerchant3[2].text")
		briefingMerchant3[page].position		=	GetPosition("merchant3")
		briefingMerchant3[page].dialogCamera 		= 	true

	--	page 3
	
		page = page +1
	
		page_Key = page
	
		briefingMerchant3[page] 				= 	{}
		briefingMerchant3[page].title			= 	String.GenericKey("Merchant")
		briefingMerchant3[page].text			=	String.Key("briefingMerchant3[3].text")
		briefingMerchant3[page].position		=	GetPosition("Ari")
		briefingMerchant3[page].dialogCamera 		= 	true

		briefingMerchant3[page].quest			=	{}
		briefingMerchant3[page].quest.id			=	6
		briefingMerchant3[page].quest.type		=	MAINQUEST_OPEN
		briefingMerchant3[page].quest.title		=	String.MainKey.."briefingMerchant3[2].quest.title"
		briefingMerchant3[page].quest.text		=	String.MainKey.."briefingMerchant3[2].quest.text"

	--	page 4
	
		page = page +1

		briefingMerchant3[page] 				= 	{}
		briefingMerchant3[page].title			= 	String.GenericKey("Mentor")
		briefingMerchant3[page].text			=	String.Key("briefingMerchant3[4].text")
		briefingMerchant3[page].position		=	GetPosition("entry")
		briefingMerchant3[page].marker			=	ANIMATED_MARKER
		briefingMerchant3[page].noScrolling		= true

	--	page 5
	
		page = page +1
	
		briefingMerchant3[page] 				= 	{}
		briefingMerchant3[page].title			= 	String.GenericKey("Mentor")
		briefingMerchant3[page].text			=	String.Key("briefingMerchant3[5].text")
		briefingMerchant3[page].position		=	GetPosition("Ari")
		briefingMerchant3[page].dialogCamera 		= 	true

	--	go!
	
		StartBriefing(briefingMerchant3)
		
	end



	