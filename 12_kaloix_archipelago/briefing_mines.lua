createBriefingMines = function()

--		Break()

		briefingMines = 	{}	

		local page = 0

		briefingMines.finished = BriefingMinesFinished

	--	page 1
	
		page = page +1
	
		briefingMines[page] 					= 	{}
		briefingMines[page].title				= 	String.GenericKey("Morfichet")
		briefingMines[page].text				=	String.Key("briefingMines1.text")
		briefingMines[page].position 			= 	GetPosition("HeliasNPC")
--		briefingMines[page].explore			=	3000	

	--	page 2

		page = page +1
	
		briefingMines[page] 					= 	{}
		briefingMines[page].title				= 	String.GenericKey("Morfichet")
		briefingMines[page].text				=	String.Key("briefingMines2.text")
		

	--	page 3

		page = page + 1

		briefingMines[page] 					= 	{}
		briefingMines[page].position 			= 	GetPosition("BuyStoneMine")
		briefingMines[page].explore			=	1000
		briefingMines[page].title				= 	String.Key("briefingMines3.title")
		briefingMines[page].text				=	String.Key("briefingMines3.text")

	--	page 4
	
		page = page + 1

		briefingMines[page] 					= 	{}
		briefingMines[page].position 			= 	GetPosition("BuyClayMine")
		briefingMines[page].explore				=	1000
		briefingMines[page].title				= 	String.Key("briefingMines4.title")
		briefingMines[page].text				=	String.Key("briefingMines4.text")

	--	page 5
		
		page = page + 1

		briefingMines[page] 					= 	{}
		briefingMines[page].position 			= 	GetPosition("BuyIronMine")
		briefingMines[page].explore				=	1000
		briefingMines[page].title				= 	String.Key("briefingMines5.title")
		briefingMines[page].text				=	String.Key("briefingMines5.text")
		
	--	page 6
	
		page = page + 1

		briefingMines[page] 					= 	{}
		briefingMines[page].position 			= 	GetPosition("BuySulfurMine")
		briefingMines[page].explore				=	1000
		briefingMines[page].title				= 	String.Key("briefingMines6.title")
		briefingMines[page].text				=	String.Key("briefingMines6.text")

	-- page 7

		page = page +1
	
		briefingMines[page] 					= 	{}
		briefingMines[page].title				= 	String.GenericKey("Morfichet")
		briefingMines[page].text				=	String.Key("briefingMines7.text")
		briefingMines[page].position 			= 	{}
		briefingMines[page].position.X,briefingMines[page].position.Y = Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingMines)
end

BriefingMinesFinished = function()

		-- Disable NPC and send back to hq
--		DisableNpcMarker("CountessSerf")
		-- Stop looking and following heros
--		SetNPCLookAtTarget("CountessSerf",0)
--		SetNPCFollow("CountessSerf", nil)

--		Move("CountessSerf","CountessHQ")
	

		-- Clear exploration of hq
	ResolveBriefing(briefingMorfichet[1])

end
