createQuestRain = function()

	-- Create weather change quest
	Trigger.RequestTrigger( Events.LOGIC_EVENT_WEATHER_STATE_CHANGED,
				nil,
				"RainQuest",
				1)
	Logic.AddQuest(
		1,									
		2,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest002_name_DryVillage",
		"CM01_19_Wasteland_Txt/mainquest002_desc_DryVillage",			
		1	
	)
end

RainQuest = function()

	-- Is new state snow
	if Event.GetNewWeatherState() == 2 
	
	and 	talkedToRainNPC == true
	
		then
		
			-- Quest done
			Logic.SetQuestType(
			1, 					
			2,
			MAINQUEST_OPEN +1,
			1
			)
			-- end quest 
			end3rdQuest()
	
			
			-- Quest done
			return true
		
	end

end