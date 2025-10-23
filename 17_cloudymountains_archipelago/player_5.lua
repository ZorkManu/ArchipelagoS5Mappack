createPlayer5 = function()

	local playerId = 5
	Logic.SetPlayerName(5, "CM01_17_CloudyMountains_Txt/_Player5Name")


	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	1000,
			clay				=	400,
			iron				=	400,
			sulfur				=	400,
			stone				=	400,
			wood				=	400
		},
		--------------------------------------------------
		refresh = {
			gold				=	10,
			clay				=	10,
			iron				=	10,
			sulfur				=	10,
			stone				=	10,
			wood				=	10,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false
	}
	SetupPlayerAi(playerId,aiDescription)

	-- upgrade soldiers
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 5)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 5)
	
	setupArmyAI1Attack()
	setupArmyAI1DefendIron()
	setupArmyAI1Defense()
end