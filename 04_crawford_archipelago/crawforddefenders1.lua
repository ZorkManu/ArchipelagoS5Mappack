function InitCrawfordDefenders1Quest()
	GlobalMissionScripting.RequestTrigger("CrawfordDefenders1")
end

function Condition_CrawfordDefenders1()
	return gvMission.DoneRegentQuestCount >= 1
end
-- Init by 1 fullfilled regent quest
function Action_CrawfordDefenders1()

	gvMission.CrawfordDefenders1 = {}

	gvMission.CrawfordDefenders1.Position 	= {}
	gvMission.CrawfordDefenders1.Army 		= 1
	gvMission.CrawfordDefenders1.Player		= 2
	gvMission.CrawfordDefenders1.SupplyPosition	= {}
	gvMission.CrawfordDefenders1.DefendRange	= 5000
	
	gvMission.CrawfordDefenders1.CannonAttack	= 0
	

	AI.Player_EnableAi(gvMission.CrawfordDefenders1.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defTargetPoint2_OO1"),gvMission.CrawfordDefenders1.Position)
	GlobalMissionScripting.GetPositionsAndIDs("defSpawnPoint", 5, "_CD", gvMission.CrawfordDefenders1.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.CrawfordDefenders1.Player,
		gvMission.CrawfordDefenders1.Army,
		gvMission.CrawfordDefenders1.Position.X, 
		gvMission.CrawfordDefenders1.Position.Y, 
		gvMission.CrawfordDefenders1.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.CrawfordDefenders1.Player,gvMission.CrawfordDefenders1.Army,4)		
	

	Counter.SetLimit("SetUpArmyCrawfordDefenders1",6)

	Counter.SetLimit("AttackController_CD1",10000)

	GlobalMissionScripting.RequestTrigger("SetUpArmyCrawfordDefenders1")
	
	-- trigger for CD attacks : fullfilled quests (moved to quest part)
	GlobalMissionScripting.RequestTrigger("AttackController_CD1")

	Script.Load( Folders.Map.."CrawfordDefenders2.lua")
	Script.Load( Folders.Map.."CrawfordDefenders3.lua")
	InitCrawfordDefenders2()
	InitCrawfordDefenders3()
	
	return 1
end


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyCrawfordDefenders1()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.CrawfordDefenders1.Player,gvMission.CrawfordDefenders1.Army) < 3
	and	Counter.Tick("SetUpArmyCrawfordDefenders1")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyCrawfordDefenders1()
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
		gvMission.CrawfordDefenders1.Player, 
		entityType, 
		6, 
		gvMission.CrawfordDefenders1.SupplyPosition[PosIndex].X, 
		gvMission.CrawfordDefenders1.SupplyPosition[PosIndex].Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.CrawfordDefenders1.Army)

	Counter.SetLimit("SetUpArmyCrawfordDefenders1",30 + Logic.GetRandom(30))

	return false

	end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_CD1()
-------------------------------------------------------------------------------------------------------------------
	return true
end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_CD1()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_CD1")	
	local currentTick = Counter.GetTick("AttackController_CD1")	
	if currentTick > 140 and currentTick < 390 then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.CrawfordDefenders1.Player,gvMission.CrawfordDefenders1.Army)
		AI.Army_SetAnchorRodeLength(gvMission.CrawfordDefenders1.Player,gvMission.CrawfordDefenders1.Army,distanceToEnemy)		
	elseif currentTick == 390 then
		AI.Army_SetAnchor(
			gvMission.CrawfordDefenders1.Player,
			gvMission.CrawfordDefenders1.Army,
			gvMission.CrawfordDefenders1.Position.X, 
			gvMission.CrawfordDefenders1.Position.Y, 
			gvMission.CrawfordDefenders1.DefendRange
		)
		Counter.Reset("AttackController_CD1")
	end
	return false
end

