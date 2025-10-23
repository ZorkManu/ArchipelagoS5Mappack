createBriefingEscaped = function(_Callback)
		
	BriefingEscaped = 	{}	

	--	create refugee
	
		BriefingEscaped.finished = BriefingEscapedFinished
		BriefingEscaped.UserCallback = _Callback
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingEscaped[page] 					  = 	{}
		BriefingEscaped[page].title				= 	String.GenericKey("Mentor")
		BriefingEscaped[page].text				=	String.Key("BriefingEscaped[1].text")
		BriefingEscaped[page].position		= GetPosition("BigBadGuy")
		BriefingEscaped[page].npc					= {}
		BriefingEscaped[page].npc.id			= "BigBadGuy"
				
		StartBriefing(BriefingEscaped)
end


BriefingEscapedFinished = function()
	ResolveBriefing(BriefingEscaped[1])
	BriefingEscaped.UserCallback()
end