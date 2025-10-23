createBriefingGetKey = function()

		briefingGetKey 						= 	{}	

	
		briefingGetKey.finished 			=	briefingGetKeyFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingGetKey[page] 				= 	{}
		briefingGetKey[page].title			= 	String.GenericKey("Mentor")
		briefingGetKey[page].text			=	String.Key("briefingGetKey[1].text")
		briefingGetKey[page].position 		= 	GetPosition("Gate1")
		briefingGetKey[page].explore		=	1000
		briefingGetKey[page].dialogCamera 	= 	true

	--	page 2

		page = page +1
	
		briefingGetKey[page] 				= 	{}
		briefingGetKey[page].title			= 	String.GenericKey("Mentor")
		briefingGetKey[page].text			=	String.Key("briefingGetKey[2].text")
		briefingGetKey[page].position 		= 	GetPosition("GateKey1")	
		briefingGetKey[page].explore		=	1000

		briefingGetKey[page].quest			=	{}
		briefingGetKey[page].quest.id		=	6
		briefingGetKey[page].quest.type		=	SUBQUEST_OPEN
		briefingGetKey[page].quest.title	=	String.MainKey.."briefingGetKey[2].quest.title"
		briefingGetKey[page].quest.text		=	String.MainKey.."briefingGetKey[2].quest.text"

		KeyPage								=	briefingGetKey[2]
	
	--	page 3

		page = page + 1

		briefingGetKey[page] 				= 	{}
		briefingGetKey[page].title			= 	String.GenericKey("Mentor")
		briefingGetKey[page].text			=	String.Key("briefingGetKey[3].text")
		briefingGetKey[page].position 		= 	GetPosition("Ari")	
		briefingGetKey[page].dialogCamera 	= 	true

	--	go!
	
		MapLocal_CameraPositionBackup()
		StartBriefing(briefingGetKey)
		
end


briefingGetKeyFinished = function()

	ResolveBriefing(briefingGetKey[1])
	MapLocal_CameraPositionRestore()

end