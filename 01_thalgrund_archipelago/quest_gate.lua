
createQuestGate = function()

	local quest = {}

	quest.EntityName 	= getLeadingHero()				-- Which unit should do the expedition
	quest.TargetName 	= "gate"				-- Where is the expedition center
	quest.Distance 		= 1000					-- When is the expedition done
	quest.Callback 		= ExpeditionPosReached	-- Call this function if expedition quest done, return true if quest should be destroyed

	SetupExpedition(quest)

end



-- Gate reached?	
ExpeditionPosReached = function()

	if IsBriefingActive() ~= true then

		Report("gate reached")
		Report("key state "..keymaster.key)
	
		if (keymaster.key == 1 or keymaster.key == 2) and GateQuest_Started == 1 then
		
			Report("open gate")
		                               
		    -- keymaster opens gate
			createBriefingDestroyGate()		
	
			-- Questmaster has opened gate		
			keymaster.key = 3
			DisableNpcMarker("keymaster")
			
			return true
			
		end
	
		if gateVisited == nil and keymaster.key == 0 then
		
			gateVisited = 1
			
			-- Gate closed, no keymaster there. PLayer needs to free him
			createBriefingGate()
		
		end

	end

	return false

end