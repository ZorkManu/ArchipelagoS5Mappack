--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Check tributes
function GameCallback_FulfillTribute(_PlayerID, _TributeID )

	-- Is weathermaster tribute valid
	if WeatherMasterTribute ~= nil then
	
		-- Is this tribute
		if WeatherMasterTribute.Tribute == _TributeID then
			
			-- Is weather currently switching
			if Logic.IsWeatherChangeActive() then
				
				-- Warn player
--				TributeMessage("WeatherMaster: You have to wait until current weather change is finished!")
			SpokenMessage(String.Key.."WeatherMasterError")
				
				-- Not possible
				return 0
			else
				return 1
			end
			
		end
		
	end

	-- Tribute is not allowed
	return 0
end