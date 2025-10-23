
-- Changes Weather for player

createQuestWeatherMaker = function()
	InitNPCLookAt("WeatherMaker")
end

	
	
destroyQuestWeatherMaker = function()

	DisableNpcMarker("WeatherMaker")

	local job = {}
	
		job.Tribute = 004
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							String.MainKey.."tribute_WeatherMaker", 
							ResourceType.Gold, 
							5000 )
	
		job.Callback 	= TributePaid004

	SetupTributePaid(job)

end

	
	
TributePaid004 = function()

	Report("tribute 001 paid")

end