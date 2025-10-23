createPlayer6 = function()

	local playerId = 6

	Logic.SetPlayerName(6, String.MainKey.."_Player6Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
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

	local i
	for i=1,3 do
		Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderBow, 6)
		Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierBow, 6)
	end

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderHeavyCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierCavalry, 6)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierHeavyCavalry, 6)
end