--       [fun]  GetWeatherState
--               Get current weather state.
--        Return: Weather state 1 = normal, 2 = rain, 3 = snow


----------------------------------------------------------------
Condition_PlayerWeatherChange = function()
----------------------------------------------------------------

	return Logic.GetWeatherState() ~= 3 and IsBriefingActive() ~= true

end

----------------------------------------------------------------
Action_PlayerWeatherChange = function()
----------------------------------------------------------------
	
	createBriefingPlayerWeatherChange()
	
	if WeathermachineQuestPage ~= nil then
		ResolveBriefing(WeathermachineQuestPage)
	end
	
	
	return true
	
end
