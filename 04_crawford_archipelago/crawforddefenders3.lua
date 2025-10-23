-- Init by 1 fullfilled regent quest
function InitCrawfordDefenders3()

	gvMission.CrawfordDefenders3 = {}

	gvMission.CrawfordDefenders3.Position 	= {}
	gvMission.CrawfordDefenders3.Army 		= 3
	gvMission.CrawfordDefenders3.Player		= 2
	gvMission.CrawfordDefenders3.SupplyPosition	= {}
	gvMission.CrawfordDefenders3.DefendRange	= 5000
	gvMission.CrawfordDefenders3.CannonAttack	= 0
	

	AI.Player_EnableAi(gvMission.CrawfordDefenders3.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defTargetPoint3_OO3"),gvMission.CrawfordDefenders3.Position)
	-- random supply origin
	GlobalMissionScripting.GetPositionsAndIDs("defSpawnPoint", 5, "_CD",gvMission.CrawfordDefenders3.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.CrawfordDefenders3.Player,
		gvMission.CrawfordDefenders3.Army,
		gvMission.CrawfordDefenders3.Position.X, 
		gvMission.CrawfordDefenders3.Position.Y, 
		gvMission.CrawfordDefenders3.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.CrawfordDefenders3.Player,gvMission.CrawfordDefenders3.Army,4)		
	

	Counter.SetLimit("SetUpArmyCrawfordDefenders3",6)

	Counter.SetLimit("AttackController_CD3",10000)

	GlobalMissionScripting.RequestTrigger("SetUpArmyCrawfordDefenders3")
	
	-- trigger for CD attacks : fullfilled quests (moved to quest part)
	-- GlobalMissionScripting.RequestTrigger("AttackController_CD3")

end


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyCrawfordDefenders3()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.CrawfordDefenders3.Player,gvMission.CrawfordDefenders3.Army) < 3
	and	Counter.Tick("SetUpArmyCrawfordDefenders3")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyCrawfordDefenders3()
-------------------------------------------------------------------------------------------------------------------
	local entityType
	
	local distribution = Logic.GetRandom(100)
	
	if distribution > 60 then
		entityType = Entities.PU_LeaderSword2
	elseif distribution > 40 then
		entityType = Entities.PU_LeaderBow2
	elseif distribution >= 0 then
		entityType = Entities.PU_LeaderPoleArm2
		end
		
	-- Get random position..1-5
	local PosIndex = Logic.GetRandom(5)+1
	
	local leaderId = GlobalMissionScripting.CreateGroup(
		gvMission.CrawfordDefenders3.Player, 
		entityType, 
		6, 
		gvMission.CrawfordDefenders3.SupplyPosition[PosIndex].X, 
		gvMission.CrawfordDefenders3.SupplyPosition[PosIndex].Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.CrawfordDefenders3.Army)

	Counter.SetLimit("SetUpArmyCrawfordDefenders3",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_CD3()
-------------------------------------------------------------------------------------------------------------------
	return true
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_CD3()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_CD3")	
	local currentTick = Counter.GetTick("AttackController_CD3")	
	if currentTick > 140 and currentTick < 390 then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.CrawfordDefenders3.Player,gvMission.CrawfordDefenders3.Army)
		AI.Army_SetAnchorRodeLength(gvMission.CrawfordDefenders3.Player,gvMission.CrawfordDefenders3.Army,distanceToEnemy)		
	elseif currentTick == 390 then
		AI.Army_SetAnchor(
			gvMission.CrawfordDefenders3.Player,
			gvMission.CrawfordDefenders3.Army,
			gvMission.CrawfordDefenders3.Position.X, 
			gvMission.CrawfordDefenders3.Position.Y, 
			gvMission.CrawfordDefenders3.DefendRange
		)
		Counter.Reset("AttackController_CD3")
		end

	return false
	end