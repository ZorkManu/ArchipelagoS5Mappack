
createPlayer4 = function()

	--	describe the player structure
	
		player4 					= {}
		player4.id 					= 4
		Logic.SetPlayerName(4, String.MainKey.."_Player4Name")

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
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
				updateTime			=	25
			},
		}
		
		SetupPlayerAi(player4.id,description)
	
	end
