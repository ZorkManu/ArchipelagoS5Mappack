createBriefingFugitive = function()

	BriefingFugitive = 	{}	

	BriefingFugitive.finished = BriefingFugitiveFinished

	local page = 0

	--	page 1
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive1.text")
	BriefingFugitive[page].position 			= 	GetPosition("Fugitive")

	--	page 2
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive2.text")
	BriefingFugitive[page].position 			= 	GetPosition("VillagersRescuePos")
	BriefingFugitive[page].explore			=	2000

	--	page 3
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive3.text")
	BriefingFugitive[page].position 			= 	GetPosition("VillagersRescuePos")


	--	page 4
	
	page = page +1

	BriefingFugitive[page] 					= 	{}
	BriefingFugitive[page].title				=	String.GenericKey("Serf")
	BriefingFugitive[page].text				=	String.Key("BriefingFugitive4.text")
	BriefingFugitive[page].position 			= 	GetPosition("Fugitive")

	--	go!
	
	StartBriefing(BriefingFugitive)


end

BriefingFugitiveFinished = function()

	BriefingFugitive.refugee = GetID("Fugitive")
	Move(BriefingFugitive.refugee,"FugitiveTarget",50)


	DisableNpcMarker("Fugitive")
--	InitNPC("Banned_Info_NPC")
	
	-- Remove exploration
	ResolveBriefing(BriefingFugitive[2])
end