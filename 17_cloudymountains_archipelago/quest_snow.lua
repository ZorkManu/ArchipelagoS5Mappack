createQuestSnow = function()

	-- Create weather change quest
	Trigger.RequestTrigger( Events.LOGIC_EVENT_WEATHER_STATE_CHANGED,
				nil,
				"SnowQuest",
				1)
end

SnowQuest = function()

	-- Is new state snow
	if Event.GetNewWeatherState() == 3 and briefingIsActive ~= true then 
		
		end4thQuest()
		
		-- Quest done
		return true
		
	end

end