createPlayer2 = function()

	local playerId = 2
	Logic.SetPlayerName(2, String.MainKey.."_Player2Name")


	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
		--------------------------------------------------
		resources = {
			gold				=	3000,
			clay				=	800,
			iron				=	800,
			sulfur				=	800,
			stone				=	800,
			wood				=	800
		},
		--------------------------------------------------
		refresh = {
			gold				=	30 + getArchipelagoDifficultyMultiplier() * 50,
			clay				=	10 + getArchipelagoDifficultyMultiplier() * 50,
			iron				=	20 + getArchipelagoDifficultyMultiplier() * 50,
			sulfur				=	1 + getArchipelagoDifficultyMultiplier() * 50,
			stone				=	20 + getArchipelagoDifficultyMultiplier() * 50,
			wood				=	10 + getArchipelagoDifficultyMultiplier() * 50,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
			delay				=	30,
			randomTime			=	30
		}
	}
	SetupPlayerAi(playerId,aiDescription)

	local position = GetPosition("SulfurTowerCheck")
	
	local sulfur = 
				{
					{ type	= Entities.PB_Tower1			,	pos = position,	level = 2	},
					{ type	= Entities.PB_SulfurMine1		,	pos = position	},
					{ type	= Entities.PB_Farm1				,	pos = position	},
					{ type	= Entities.PB_Residence1		,	pos = position	},
					{ type	= Entities.PB_Tower1			,	pos = position,	level = 2	},
					{ type	= Entities.PB_SulfurMine1		,	pos = position	},
					{ type	= Entities.PB_Farm1				,	pos = position	},
					{ type	= Entities.PB_Residence1		,	pos = position	},
				}
	FeedAiWithConstructionPlanFile(playerId, sulfur)	

	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierSword, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.LeaderPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)
	Logic.UpgradeSettlerCategory(UpgradeCategories.SoldierPoleArm, 2)

	setupArmyP2Attacker()
	setupArmyP2Defense()
	
end