createBriefingMorfichet = function()

--		Break()

		briefingMorfichet = 	{}	

		local page = 0

		briefingMorfichet.finished = BriefingMorfichetFinished

	--	page 1
	
		page = page +1
	
		briefingMorfichet[page] 					= 	{}
		briefingMorfichet[page].title				= 	String.GenericKey("Mentor")
		briefingMorfichet[page].text				=	String.Key("briefingMorfichet1.text")
		briefingMorfichet[page].position 			= 	GetPosition("HeliasNPC")
		briefingMorfichet[page].explore			=	3000	

	--	page 2

		page = page +1
	
		briefingMorfichet[page] 					= 	{}
		briefingMorfichet[page].title				= 	String.GenericKey("Mentor")
		briefingMorfichet[page].text				=	String.Key("briefingMorfichet2.text")
		
		briefingMorfichet[page].quest				=	{}
		briefingMorfichet[page].quest.id			=	4
		briefingMorfichet[page].quest.type		=	MAINQUEST_OPEN
		briefingMorfichet[page].quest.title		=	"CM01_12_Kaloix/subquest0_name_morfichet"
		briefingMorfichet[page].quest.text		=	"CM01_12_Kaloix/subquest0_desc_morfichet"


	--	go!
	
		StartBriefing(briefingMorfichet)
end

BriefingMorfichetFinished = function()
	

		-- Clear exploration of hq
--	ResolveBriefing(briefingMorfichet[1])

end
