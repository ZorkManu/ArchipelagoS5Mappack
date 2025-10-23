
createBriefingKey = function()

		briefingKey							= 	{}	
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingKey[page] 					= 	{}
--		briefingKey[page].title				= 	COLOR2.."< Major >"
--		briefingKey[page].text				=	"Thank you for your help."
		briefingKey[page].title				=	String.GenericKey("Mayor")
		briefingKey[page].text				=	String.Key("briefingKey1.text")
		briefingKey[page].position 			= 	GetPosition("Major")

	--	page 2

		page = page +1
	
		briefingKey[page] 					= 	{}
--		briefingKey[page].title				= 	COLOR2.."< Major >"
--		briefingKey[page].text				=	"We have opened the northern gate to the village, so you can get it without any fight.\n"
		briefingKey[page].title				=	String.GenericKey("Mayor")
		briefingKey[page].text				=	String.Key("briefingKey2.text")
		briefingKey[page].position 			= 	GetPosition("GateToVillage")	
		briefingKey[page].explore			=	1000

	--	page 3

		page = page + 1

		briefingKey[page] 					= 	{}
--		briefingKey[page].title				= 	COLOR2.."< Major >"
--		briefingKey[page].text				=	"I hope you can destroy kerberos troops.\n"
		briefingKey[page].title				=	String.GenericKey("Mayor")
		briefingKey[page].text				=	String.Key("briefingKey3.text")
		briefingKey[page].position 			= 	{}
		briefingKey[page].position.X,
		briefingKey[page].position.Y 		= Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingKey)
	
end
