createBriefingBergstadtAttack = function()

	briefingBergstadtAttack = 	{}	

	briefingBergstadtAttack.finished = briefingBergstadtAttackFinished

	local page = 0

	--	page 1
	
	page = page +1

	briefingBergstadtAttack[page] 					= 	{}
	briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
	briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[1].text")
	briefingBergstadtAttack[page].position 			= 	GetPosition("BergstadtNPC")
	briefingBergstadtAttack[page].explore			=	1000
	briefingBergstadtAttack[page].dialogCamera 		= 	true

	--	page 2

	page = page +1

	briefingBergstadtAttack[page] 					= 	{}
	briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
	briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[2].text")
	briefingBergstadtAttack[page].position 			= 	GetPosition("RockSouth")
	briefingBergstadtAttack[page].explore			=	1500

	--	page 3

	page = page +1

	briefingBergstadtAttack[page] 					= 	{}
	briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")

	if IsAlive("RockNorth2") then
		briefingBergstadtAttack[page].text			=	String.Key("briefingBergstadtAttack[3a].text")
	else
		briefingBergstadtAttack[page].text			=	String.Key("briefingBergstadtAttack[3b].text")
	end
	briefingBergstadtAttack[page].position 			= 	GetPosition("BergstadtPathPos")
	briefingBergstadtAttack[page].explore			=	1000


	--	page 4

	page = page +1

	if kerberosGivedUp == nil then

		briefingBergstadtAttack[page] 					= 	{}
		briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
		briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[4].text")
		briefingBergstadtAttack[page].position 			= 	GetPosition("P6Stable")
		briefingBergstadtAttack[page].explore			=	1000

		--	page 5
		
		page = page +1
	
		briefingBergstadtAttack[page] 					= 	{}
		briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
		briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[5].text")
		briefingBergstadtAttack[page].position 			= 	GetPosition("P6Archery")
		briefingBergstadtAttack[page].explore			=	1000
	
		--	page 6
		
		page = page +1
	
		briefingBergstadtAttack[page] 					= 	{}
		briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
		briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[6a].text")
		briefingBergstadtAttack[page].position 			= 	{}
		briefingBergstadtAttack[page].position.X,
		briefingBergstadtAttack[page].position.Y 		=	Camera.ScrollGetLookAt()

	else
	
		briefingBergstadtAttack[page] 					= 	{}
		briefingBergstadtAttack[page].title				= 	String.GenericKey("Mayor")
		briefingBergstadtAttack[page].text				=	String.Key("briefingBergstadtAttack[6b].text")
		briefingBergstadtAttack[page].position 			= 	{}
		briefingBergstadtAttack[page].position.X,
		briefingBergstadtAttack[page].position.Y 		=	Camera.ScrollGetLookAt()

	end

	--	go!
	
	StartBriefing(briefingBergstadtAttack)


end

briefingBergstadtAttackFinished = function()

	-- Remove exploration
	ResolveBriefing(briefingBergstadtAttack[1])
	ResolveBriefing(briefingBergstadtAttack[2])
	ResolveBriefing(briefingBergstadtAttack[3])
	ResolveBriefing(briefingBergstadtAttack[4])
	
	if briefingBergstadtAttack[5] ~= nil then
		ResolveBriefing(briefingBergstadtAttack[5])
	end
end