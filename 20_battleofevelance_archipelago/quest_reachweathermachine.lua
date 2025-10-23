
createQuestReachWeatherMachine = function()

	local quest = {}

	quest.Heroes 	 	= 1
	quest.Serfs			= 1
	quest.TargetName 	= "WeatherMachine"		
	quest.Distance 		= 1500			
	quest.Callback 		= MachineReached	

	SetupExpedition(quest)

end
	
	
	
	
MachineReached = function()

	if IsDead("WeatherMachine") then
		return
	end

	--	check if briefing is active
	if IsBriefingActive() ~= true then

		createBriefingWeatherMachine()

	else
		MapBriefing_StartedWM = StartJob("DelayBriefingWM")
	end
	
end
	
	----------------------------------------------------------------
	Condition_DelayBriefingWM = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingWM = function()                                  
	----------------------------------------------------------------
		                                                            
		createBriefingWeatherMachine()
		EndJob(MapBriefing_StartedWM)

	end