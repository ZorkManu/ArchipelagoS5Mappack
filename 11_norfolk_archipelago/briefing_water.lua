createBriefingWater = function()

	briefingWater 					= 	{}	

	local page = 0

	--	page 1
	
	if potionCount == 1 then

		page = page +1
	
		briefingWater[page] 			= 	{}
--		briefingWater[page].title		= 	COLOR2.."< Mentor >"
--		briefingWater[page].text		=	"We have the clean water."
		briefingWater[page].title		= 	String.GenericKey("Mentor")
		briefingWater[page].text		=	String.Key("briefingWater1.text")
		briefingWater[page].position 	= 	GetPosition("Waterfall")

	--	page 2

		page = page +1
	
		briefingWater[page] 			= 	{}
--		briefingWater[page].title		= 	COLOR2.."< Mentor >"
--		briefingWater[page].text		=	"Now only the ingredients are missing."
		briefingWater[page].title		= 	String.GenericKey("Mentor")
		briefingWater[page].text		=	String.Key("briefingWater2.text")
		briefingWater[page].position 	= 	GetPosition("Ingredient")
	
	else
	
		page = page +1
	
		briefingWater[page] 			= 	{}
--		briefingWater[page].title		= 	COLOR2.."< Mentor >"
--		briefingWater[page].text		=	"We got all parts!"
		briefingWater[page].title		= 	String.GenericKey("Mentor")
		briefingWater[page].text		=	String.Key("briefingWater3.text")
		briefingWater[page].position 	= 	GetPosition("Waterfall")

	--	page 2

		page = page +1
	
		briefingWater[page] 			= 	{}
--		briefingWater[page].title		= 	COLOR2.."< Mentor >"
--		briefingWater[page].text		=	"Let bring it to the monk."
		briefingWater[page].title		= 	String.GenericKey("Mentor")
		briefingWater[page].text		=	String.Key("briefingWater4.text")

		briefingWater[page].position 	= 	GetPosition("Monk")
		briefingWater[page].explore		=	1500
		briefingWater[page].marker		=	STATIC_MARKER
		
		MonkPage						=	briefingWater[2]

	end

	--	go!
	
	StartBriefing(briefingWater)


end
