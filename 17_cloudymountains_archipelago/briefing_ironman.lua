
createBriefingIronMan = function()

		briefingIronMan							= 	{}	
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingIronMan[page] 					= 	{}
		briefingIronMan[page].title				=	String.Key("briefingIronMan1.title")
		briefingIronMan[page].text				=	String.Key("briefingIronMan1.text")
		briefingIronMan[page].position 			= 	GetPosition("IronMan")
		briefingIronMan[page].explore			=	2000
		
	--	page 2

		page = page +1
	
		briefingIronMan[page] 					= 	{}
		briefingIronMan[page].title				=	String.Key("briefingIronMan1.title")
		briefingIronMan[page].text				=	String.Key("briefingIronMan2.text")
		briefingIronMan[page].position 			= 	GetPosition("IronMan")	


	--	page 3

		page = page + 1

		briefingIronMan[page] 					= 	{}
		briefingIronMan[page].title				=	String.Key("briefingIronMan1.title")
		briefingIronMan[page].text				=	String.Key("briefingIronMan3.text")
		briefingIronMan[page].position 			= 	{}
		briefingIronMan[page].position.X,
		briefingIronMan[page].position.Y 		= Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingIronMan)
	
end
