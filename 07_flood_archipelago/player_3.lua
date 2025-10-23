
createPlayer3 = function()

	--	describe the player structure
	
		player3 					= {}
		player3.id 					= 3
		Logic.SetPlayerName(3, String.MainKey.."_Player3Name")

	--	set up default information

		local description = {
		
			serfLimit				=	5,
			--------------------------------------------------
			extracting				=	false,
			--------------------------------------------------
			resources = {
				gold				=	1000,
				clay				=	1000,
				iron				=	1000,
				sulfur				=	300,
				stone				=	300,
				wood				=	1000
			},
			--------------------------------------------------
			refresh = {
				gold				=	100,
				clay				=	10,
				iron				=	100,
				sulfur				=	50,
				stone				=	10,
				wood				=	100,
				updateTime			=	15
			},
				rebuild	=	{
				delay				=	5,
				randomTime			=	10
			},
		}
		
		SetupPlayerAi(player3.id,description)
	
	end
