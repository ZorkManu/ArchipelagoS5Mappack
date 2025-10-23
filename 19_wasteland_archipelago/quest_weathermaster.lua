createQuestWeatherMaster = function()

	-- Tribute job
	WeatherMasterTribute = {}
	WeatherMasterTribute.Tribute = 001

	-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
				WeatherMasterTribute.Tribute,
				0,
				0,
				"CM01_19_Wasteland_Txt/mainquest004_tribute_Snow", 
				ResourceType.Gold, 
				2000 )
	

	WeatherMasterTribute.Callback = end1stSubQuest

	-- Create tribute paid Job
	SetupTributePaid(WeatherMasterTribute)
end