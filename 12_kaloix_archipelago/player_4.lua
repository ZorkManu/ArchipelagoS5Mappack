createPlayer4 = function()

	local playerId = 4
	Logic.SetPlayerName(4, String.MainKey.."_Player4Name")

	--	set up  player ai

	local aiDescription = {
	
		serfLimit				=	4,
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
			gold				=	10,
			clay				=	0,
			iron				=	0,
			sulfur				=	0,
			stone				=	0,
			wood				=	0,
			updateTime			=	10
		},
		--------------------------------------------------
		extracting = false,
		--------------------------------------------------
		rebuild	=	{
				delay				=	5,
				randomTime			=	10
			},	

		
	}
	SetupPlayerAi(playerId,aiDescription)

	--	create village

		local position = GetPosition("VillagePosition")
		
		local countessVillage = 
					{
						{ type	= Entities.PB_Tower1, pos = GetPosition("CountessVillageTower1"), level = 1	},
						{ type	= Entities.PB_Tower1, pos = GetPosition("CountessVillageTower2"), level = 1	},
						{ type	= Entities.PB_Brickworks1	,	pos = position	},
						{ type	= Entities.PB_Sawmill1	,	pos = position	},
						{ type	= Entities.PB_Residence1	,	pos = position	},
						{ type	= Entities.PB_Farm1			,	pos = position	},
						{ type	= Entities.PB_Residence1	,	pos = position	}
--						{ type	= Entities.PB_Tower1		,	pos = GetPosition("CountessVillageTower1") },
--						{ type	= Entities.PB_Tower1		,	pos = GetPosition("CountessVillageTower2") }
					}
	FeedAiWithConstructionPlanFile(playerId,countessVillage)
	
	local researchFile =	{
            					{ type	= Entities.PB_Tower1,   prob = 100, command = UPGRADE},
            					{ type	= Entities.PB_Tower1,   prob = 100, command = UPGRADE}
	    					}
	    
	FeedAiWithResearchPlanFile(playerId,researchFile)

	AI.Player_SetResourceLimits(4, 150, 1000, 1000, 1000, 1000, 1000)
end