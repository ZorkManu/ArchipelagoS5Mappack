createPlayer7 = function()

	local playerId = 7
	Logic.SetPlayerName(7, String.MainKey.."_Player7Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	0,
		extracting = false
	}

	SetupPlayerAi(playerId,aiDescription)

	-- Setup armies
	setupArmyDefenseLeftMines()
	setupArmyDefenseRightMines()

end