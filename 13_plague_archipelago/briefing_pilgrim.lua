
createBriefingPilgrim = function()

	briefingPilgrim = {}	

	briefingPilgrim.finished		= BriefingPilgrim

		local page = 0

	--	page
	
		page = page +1
	
		briefingPilgrim[page] 					= 	{}
		briefingPilgrim[page].title				= 	String.GenericKey("Pilgrim")
		briefingPilgrim[page].text				=	String.Key("briefingPilgrim[1].text")
		briefingPilgrim[page].position 			= 	GetPosition("PilgrimNPC")	
		briefingPilgrim[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingPilgrim[page] 					= 	{}
		briefingPilgrim[page].title				= 	String.GenericKey("PilgrimNPC")
		briefingPilgrim[page].text				=	String.Key("briefingPilgrim[2].text")
		briefingPilgrim[page].position 			= 	GetPosition("CountessCastle")	

	--	page
	
		page = page +1
	
		briefingPilgrim[page] 					= 	{}
		briefingPilgrim[page].title				= 	String.GenericKey("Pilgrim")
		briefingPilgrim[page].text				=	String.Key("briefingPilgrim[3].text")
		briefingPilgrim[page].position 			= 	GetPosition("PilgrimNPC")	
		briefingPilgrim[page].dialogCamera 		= 	true

	-- go!
	
		StartBriefing(briefingPilgrim)
	
	end




BriefingPilgrim = function()


end