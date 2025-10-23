createQuestSnow = function()

	-- Create weather change quest
	Trigger.RequestTrigger( Events.LOGIC_EVENT_WEATHER_STATE_CHANGED,
				nil,
				"SnowQuest",
				1)

	-- Add new quest
	Logic.AddQuest(
		1,									
		4,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest004_name_Snow",
		"CM01_19_Wasteland_Txt/mainquest004_desc_Snow",			
		1	
	)

end





SnowQuest = function()

	-- Is new state snow
	if Event.GetNewWeatherState() == 3 then
		
		-- Start attacks
		StartLeftFortress_Attack()
		StartCenterOutpost_Attack()
		
		-- Quest done
		Logic.SetQuestType(
			1, 					
			4,
			MAINQUEST_OPEN +1,
			1
		)
		-- end quest 
		end2ndQuest()
		
		-- Quest done
		return true
		
	end

end