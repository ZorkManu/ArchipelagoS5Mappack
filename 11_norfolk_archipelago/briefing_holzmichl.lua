createBriefingHolzMichl = function()

		briefingHolzMichl 					= 	{}	

	
		briefingHolzMichl.finished 			=	briefingHolzMichlFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingHolzMichl[page] 			= 	{}
		briefingHolzMichl[page].title		= 	String.Key("briefingHolzMichl1.title")
		briefingHolzMichl[page].text		=	String.Key("briefingHolzMichl1.text")
		briefingHolzMichl[page].position 	= 	GetPosition("HolzMichl")

	--	page 2

		page = page +1
	
		briefingHolzMichl[page] 			= 	{}
		briefingHolzMichl[page].title		= 	String.Key("briefingHolzMichl1.title")
		briefingHolzMichl[page].text		=	String.Key("briefingHolzMichl2.text")
		
--		briefingHolzMichl[page].position 	= 	{}
--		briefingHolzMichl[page].position.X,
--		briefingHolzMichl[page].position.Y 	= 	Camera.ScrollGetLookAt()
		briefingHolzMichl[page].position 	= 	GetPosition("WoodBlocking")


	--	go!

	
	
		StartBriefing(briefingHolzMichl)
	
	end


briefingHolzMichlFinished = function()

	DisableNpcMarker("HolzMichl")

	briefingHolzMichl.HolzMichl = GetID("HolzMichl")
	MoveAndVanish(briefingHolzMichl.HolzMichl,"MayorNPC")


end