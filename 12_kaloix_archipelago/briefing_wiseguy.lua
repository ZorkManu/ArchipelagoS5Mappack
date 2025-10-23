createBriefingWiseguy = function()


		briefingWiseguy = 	{}	

		local page = 0

		briefingWiseguy.finished = BriefingWiseguyFinished

	--	page 1
	
		page = page +1
	
		briefingWiseguy[page] 					= 	{}
		briefingWiseguy[page].title				= 	String.Key("briefingNPC[6].title")
		briefingWiseguy[page].text				=	String.Key("briefingNPC[6].text")
		briefingWiseguy[page].position 			= 	GetPosition("wiseguy")
--		briefingWiseguy[page].explore			=	3000	
		briefingWiseguy[page].dialogCamera 		= 	true

	--	page 2

		page = page +1
	
		briefingWiseguy[page] 					= 	{}
		briefingWiseguy[page].title				= 	String.Key("briefingNPC[6].title")
		briefingWiseguy[page].text				=	String.Key("noText")
		briefingWiseguy[page].position 			= 	GetPosition("Harbour2")
		briefingWiseguy[page].explore			=	2000	
		

	--	go!
	
		StartBriefing(briefingWiseguy)
end

BriefingWiseguyFinished = function()
	


end
