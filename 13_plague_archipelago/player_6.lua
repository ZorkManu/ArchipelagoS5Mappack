
-- Aris leader merchant and support troops that follow heroes

createPlayer6 = function()

	--	describe the player structure
	--		Logic.SetPlayerName(6, String.MainKey.."_Player6Name")
	
		player6 					= {}
		player6.id 					= 6

	--	set up default information

		local description = {
		
			serfLimit				=	0,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	0,
				clay				=	0,
				iron				=	0,
				sulfur				=	0,
				stone				=	0,
				wood				=	0
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
		
		SetupPlayerAi(player6.id,description)
	
	end
