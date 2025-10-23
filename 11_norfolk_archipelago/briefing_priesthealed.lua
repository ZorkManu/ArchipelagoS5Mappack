createBriefingPriestHealed = function()

		briefingPriestHealed 					= 	{}	

	
		briefingPriestHealed.finished 			=	briefingPriestHealedFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPriestHealed[page] 				= 	{}
--		briefingPriestHealed[page].title		= 	COLOR2.."< Monk >"
--		briefingPriestHealed[page].text			=	"Thank your for the potion."
		briefingPriestHealed[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriestHealed[page].text			=	String.Key("briefingPriestHealed1.text")
		briefingPriestHealed[page].position 	= 	GetPosition("Monk")

	--	page 2

		page = page +1
	
		briefingPriestHealed[page] 				= 	{}
--		briefingPriestHealed[page].title		= 	COLOR2.."< Monk >"
--		briefingPriestHealed[page].text			=	"Before i drink it, i will open the hidden path to Kerberos."
		briefingPriestHealed[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriestHealed[page].text			=	String.Key("briefingPriestHealed2.text")

		briefingPriestHealed[page].position 	= 	GetPosition("rock1")
		briefingPriestHealed[page].explore		=	1000
		
		hiddenPathPage							=	briefingPriestHealed[page]
	
	--	page 3

		page = page + 1

		briefingPriestHealed[page] 				= 	{}
--		briefingPriestHealed[page].title		= 	COLOR2.."< Monk >"
--		briefingPriestHealed[page].text			=	"Take also my gold (3000), i don't need it anymore."
		briefingPriestHealed[page].title			= 	String.Key("briefingPriest1.title")
		briefingPriestHealed[page].text			=	String.Key("briefingPriestHealed3.text")

		briefingPriestHealed[page].position 	= 	{}
		briefingPriestHealed[page].position.X,
		briefingPriestHealed[page].position.Y 	=	Camera.ScrollGetLookAt()

	--	go!

	
	
		StartBriefing(briefingPriestHealed)
	
	end


briefingPriestHealedFinished = function()

	ResolveBriefing(hiddenPathPage)

	end1stSubQuest()

	InitNPC("Monk")
	DisableNpcMarker("Monk")

end