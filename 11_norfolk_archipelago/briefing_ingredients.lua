createBriefingIngredients = function()

	briefingIngredients 					= 	{}	

	local page = 0

	--	page 1
	
	if potionCount == 1 then

		page = page +1
	
		briefingIngredients[page] 			= 	{}
--		briefingIngredients[page].title		= 	COLOR2.."< Mentor >"
--		briefingIngredients[page].text		=	"We have the ingredients."
		briefingIngredients[page].title		= 	String.GenericKey("Mentor")
		briefingIngredients[page].text		=	String.Key("briefingIngredients1.text")
		briefingIngredients[page].position 	= 	GetPosition("Ingredient")

	--	page 2

		page = page +1
	
		briefingIngredients[page] 			= 	{}
--		briefingIngredients[page].title		= 	COLOR2.."< Mentor >"
--		briefingIngredients[page].text		=	"Now only the clean water is missing."
		briefingIngredients[page].title		= 	String.GenericKey("Mentor")
		briefingIngredients[page].text		=	String.Key("briefingIngredients2.text")
		briefingIngredients[page].position 	= 	GetPosition("Waterfall")
	
	else
	
		page = page +1
	
		briefingIngredients[page] 			= 	{}
--		briefingIngredients[page].title		= 	COLOR2.."< Mentor >"
--		briefingIngredients[page].text		=	"We got all parts!"
		briefingIngredients[page].title		= 	String.GenericKey("Mentor")
		briefingIngredients[page].text		=	String.Key("briefingIngredients3.text")
		briefingIngredients[page].position 	= 	GetPosition("Ingredient")

	--	page 2

		page = page +1
	
		briefingIngredients[page] 			= 	{}
--		briefingIngredients[page].title		= 	COLOR2.."< Mentor >"
--		briefingIngredients[page].text		=	"Let bring it to the monk."
		briefingIngredients[page].title		= 	String.GenericKey("Mentor")
		briefingIngredients[page].text		=	String.Key("briefingIngredients4.text")

		briefingIngredients[page].position 	= 	GetPosition("Monk")
		briefingIngredients[page].explore	=	1500
		briefingIngredients[page].marker	=	STATIC_MARKER
		
		MonkPage							=	briefingIngredients[2]

	end

	--	go!
	
	StartBriefing(briefingIngredients)


end
