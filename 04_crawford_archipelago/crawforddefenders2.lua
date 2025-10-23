-- Init by 1 fullfilled regent quest
function InitCrawfordDefenders2()

	gvMission.CrawfordDefenders2 = {}

	gvMission.CrawfordDefenders2.Position 	= {}
	gvMission.CrawfordDefenders2.Army 		= 2
	gvMission.CrawfordDefenders2.Player		= 2
	gvMission.CrawfordDefenders2.SupplyPosition	= {}
	gvMission.CrawfordDefenders2.DefendRange	= 5000
	
	gvMission.CrawfordDefenders2.CannonAttack	= 0
	

	AI.Player_EnableAi(gvMission.CrawfordDefenders2.Player)

	GlobalMissionScripting.GetEntityPosition(Logic.GetEntityIDByName("defTargetPoint4_OO2"),gvMission.CrawfordDefenders2.Position)
	-- random supply origin
	GlobalMissionScripting.GetPositionsAndIDs("defSpawnPoint", 5, "_CD",gvMission.CrawfordDefenders2.SupplyPosition)

	-- set up anchor
	
	AI.Army_SetAnchor(
		gvMission.CrawfordDefenders2.Player,
		gvMission.CrawfordDefenders2.Army,
		gvMission.CrawfordDefenders2.Position.X, 
		gvMission.CrawfordDefenders2.Position.Y, 
		gvMission.CrawfordDefenders2.DefendRange
	)
	
	AI.Army_SetScatterTolerance(gvMission.CrawfordDefenders2.Player,gvMission.CrawfordDefenders2.Army,4)		
	

	Counter.SetLimit("SetUpArmyCrawfordDefenders2",6)

	Counter.SetLimit("AttackController_CD2",10000)

	GlobalMissionScripting.RequestTrigger("SetUpArmyCrawfordDefenders2")
	
	-- trigger for CD attacks : fullfilled quests (moved to quest part)
	-- GlobalMissionScripting.RequestTrigger("AttackController_CD2")

end


-------------------------------------------------------------------------------------------------------------------
function Condition_SetUpArmyCrawfordDefenders2()
-------------------------------------------------------------------------------------------------------------------
	return AI.Army_GetNumberOfTroops(gvMission.CrawfordDefenders2.Player,gvMission.CrawfordDefenders2.Army) < 3
	and	Counter.Tick("SetUpArmyCrawfordDefenders2")
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_SetUpArmyCrawfordDefenders2()
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
		gvMission.CrawfordDefenders2.Player, 
		entityType, 
		6, 
		gvMission.CrawfordDefenders2.SupplyPosition[PosIndex].X, 
		gvMission.CrawfordDefenders2.SupplyPosition[PosIndex].Y, 
		90 
	)

	AI.Entity_ConnectLeader(leaderId,gvMission.CrawfordDefenders2.Army)

	Counter.SetLimit("SetUpArmyCrawfordDefenders2",30 + Logic.GetRandom(30))

	return false

end


-------------------------------------------------------------------------------------------------------------------
function Condition_AttackController_CD2()
-------------------------------------------------------------------------------------------------------------------
	return true
	end
	
-------------------------------------------------------------------------------------------------------------------
function Action_AttackController_CD2()
-------------------------------------------------------------------------------------------------------------------
	Counter.Tick("AttackController_CD2")	
	local currentTick = Counter.GetTick("AttackController_CD2")	
	if currentTick > 140 and currentTick < 390 then
		local distanceToEnemy = AI.Army_GetDistanceBetweenAnchorAndEnemy(gvMission.CrawfordDefenders2.Player,gvMission.CrawfordDefenders2.Army)
		AI.Army_SetAnchorRodeLength(gvMission.CrawfordDefenders2.Player,gvMission.CrawfordDefenders2.Army,distanceToEnemy)		
	elseif currentTick == 390 then
		AI.Army_SetAnchor(
			gvMission.CrawfordDefenders2.Player,
			gvMission.CrawfordDefenders2.Army,
			gvMission.CrawfordDefenders2.Position.X, 
			gvMission.CrawfordDefenders2.Position.Y, 
			gvMission.CrawfordDefenders2.DefendRange
		)
		Counter.Reset("AttackController_CD2")
		end
		
	return false
end