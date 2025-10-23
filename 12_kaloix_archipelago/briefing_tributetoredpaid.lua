createBriefingTributeToRedPaid = function()

		BriefingTributeToRedPaid = 	{}	

		local page = 0

		BriefingTributeToRedPaid.finished = BriefingTributeToRedPaidFinished

	--	page 1
	
		page = page +1
	
		BriefingTributeToRedPaid[page] 					= 	{}
		BriefingTributeToRedPaid[page].title				= 	String.Key("BriefingTributeToRedPaid.title")
 		BriefingTributeToRedPaid[page].text				=	String.Key("BriefingTributeToRedPaid.text")

	--	go!
	
		StartBriefing(BriefingTributeToRedPaid)
end

BriefingTributeToRedPaidFinished = function()



end
