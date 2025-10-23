
function GameCallback_FulfillTribute(_player,_tribute)

	TRIBUTE_ERROR_MESSAGE = Message(String.Get("PopulationLimit"))


	Report("keep tribute ".._tribute.." valid!")

	local populationLimit 	= Logic.GetPlayerAttractionLimit(_player)
	local population 		= Logic.GetPlayerAttractionUsage(_player)


	-- Trader 1: Galileo. Cutscene bought
	if _tribute == 001 then

		checkLocation("battleofevelance_tribute_view")

		--	briefing	
		if IsBriefingActive() ~= true then
	
		    StartCutscene("Trader1")
	
		else
	
			Trader1Briefing_Started = StartJob("DelayBriefing1")
	
		end
		
	end
	

	-- Trader 2: Sells canons
	if _tribute == 002 then

		checkLocation("battleofevelance_tribute_cannon")

		if population + Logic.GetLeadersGroupAttractionLimitValue(TRIBUTE002_LEADER_TYPE) > populationLimit then
	
			TributeMessage(TRIBUTE_ERROR_MESSAGE)
			
			return 0
			
		else
		
			--	briefing	
			if IsBriefingActive() ~= true then

			    createBriefingTrader2Paid()
				return 2

			else
				Trader2Briefing_Started = StartJob("DelayBriefing2")
			end
		end	
	end
	
		
	-- Trader 3. Shows secret path

	if _tribute == 003 then

		checkLocation("battleofevelance_tribute_secretpath")

		--	briefing	
		if IsBriefingActive() ~= true then
	
		    StartCutscene("Trader3")
			
			return 1
		else
			Trader3Briefing_Started = StartJob("DelayBriefing3")
		end

	end

	-- WeatherMaker
	
	if _tribute == 004 then

		checkLocation("battleofevelance_tribute_weathermaker")

		--	briefing	
		if IsBriefingActive() ~= true then
	
		    StartCutscene("WeatherMaker")
			
			return 1
		else
			Trader4Briefing_Started = StartJob("DelayBriefing4")
		end

	end


	return 2

end



	----------------------------------------------------------------
	Condition_DelayBriefing1 = function()                               
	----------------------------------------------------------------
			                                                                   
			if IsBriefingActive() ~= true then
				return true
			end
			return false
		end                                                             
		                                                                    
		----------------------------------------------------------------
		Action_DelayBriefing1 = function()                                  
		----------------------------------------------------------------
			                                                            
		    StartCutscene("Trader1")
			EndJob(Trader1Briefing_Started)
		end
		

		
	----------------------------------------------------------------
	Condition_DelayBriefing2 = function()                               
	----------------------------------------------------------------
			                                                                   
			if IsBriefingActive() ~= true then
				return true
			end
			return false
		end                                                             
		                                                                    
		----------------------------------------------------------------
		Action_DelayBriefing2 = function()                                  
		----------------------------------------------------------------
			                                                            
		    createBriefingTrader2Paid()
			EndJob(Trader2Briefing_Started)
			return 2
		
		end



	----------------------------------------------------------------
	Condition_DelayBriefing3 = function()                               
	----------------------------------------------------------------
			                                                                   
			if IsBriefingActive() ~= true then
				return true
			end
			return false
					                                                            
		end                                                             
		                                                                    
		----------------------------------------------------------------
		Action_DelayBriefing3 = function()                                  
		----------------------------------------------------------------
			                                                            
		    StartCutscene("Trader3")
			EndJob(Trader3Briefing_Started)
			return 1
		end



	----------------------------------------------------------------
	Condition_DelayBriefing4 = function()                               
	----------------------------------------------------------------
			                                                                   
			if IsBriefingActive() ~= true then
				return true
			end
			return false
		end                                                             
		                                                                    
		----------------------------------------------------------------
		Action_DelayBriefing4 = function()                                  
		----------------------------------------------------------------
			                                                            
		    StartCutscene("WeatherMaker")
			EndJob(Trader4Briefing_Started)
			return 1
		end
