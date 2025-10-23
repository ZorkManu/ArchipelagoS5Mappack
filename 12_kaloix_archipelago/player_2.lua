createPlayer2 = function()

	-- Setup ai
	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")


	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	2,
		--------------------------------------------------
		resources = {
			gold				=	5000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	5,
			iron				=	5,
			sulfur				=	5,
			stone				=	5,
			wood				=	5,
			updateTime			=	5
		},
		--------------------------------------------------
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)

	setupArmyKI2()
	setupArmyKI2Defense()

end

