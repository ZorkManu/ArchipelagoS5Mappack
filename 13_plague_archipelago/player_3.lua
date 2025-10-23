
-- Defenders of Morfichets Castle

createPlayer3 = function()

	--	describe the player structure
--		Logic.SetPlayerName(3, String.MainKey.."_Player3Name")

		player3 					= {}
		player3.id 					= 3

	--	set up default information

		local description = {
		
			serfLimit				=	10,
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
		
		SetupPlayerAi(player3.id,description)
	
	end
