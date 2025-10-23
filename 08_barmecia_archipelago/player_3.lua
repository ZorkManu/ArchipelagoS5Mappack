createPlayer3 = function()

			player3 					= {}
			player3.id 					= gvMission.PlayerIDBarmecia
	
			Logic.SetPlayerName(gvMission.PlayerIDBarmecia, String.MainKey.."_Player3Name")

	--	describe the player structure
			local description = {
		
				serfLimit				=	10,
				--------------------------------------------------
				extracting				=	false,
				--------------------------------------------------
				rebuild = {
					delay				=	0,
					randomTime			=	0
				},
				--------------------------------------------------
				resources = {
					gold				=	2000,
					clay				=	1000,
					iron				=	1500,
					sulfur				=	1000,
					stone				=	1000,
					wood				=	2000
				},
				--------------------------------------------------
				refresh = {
					gold				=	100,
					clay				=	10,
					iron				=	100,
					sulfur				=	50,
					stone				=	10,
					wood				=	100,
					updateTime			=	5
				},
			}
		
		SetupPlayerAi(player3.id, description)	  
	
end
