createBriefingRock1Destroyed = function()
        ResolveBriefing(QuestDestroyRock)
		BriefingRock1Destroyed = 	{}	

	--	create refugee
	
		BriefingRock1Destroyed.finished = BriefingRock1DestroyedFinished
	
		local page = 0

	--	page 
	
		page = page +1
	
		BriefingRock1Destroyed[page] 					= 	{}
		BriefingRock1Destroyed[page].title				= 	String.GenericKey("Mentor")
		BriefingRock1Destroyed[page].text				=   String.Key("BriefingRock1Destroyed[1].text")
		BriefingRock1Destroyed[page].position		    =   GetPosition("TheRockPos")

	
	--	go!
		StartBriefing(BriefingRock1Destroyed)
end

BriefingRock1DestroyedFinished = function()
createArmyAttackPlayerA()
end