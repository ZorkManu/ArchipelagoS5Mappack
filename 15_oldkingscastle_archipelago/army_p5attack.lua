setupArmyP5Attack = function()

	ArmyAttackP5= UnlimitedArmy:New({
		Player = 5,
		Area = 40000,
		Formation = UnlimitedArmy.Formations.Lines,
		LeaderFormation  = FormationFunktion,
		TransitAttackMove = true,
	})

	local diff = getArchipelagoDifficultyMultiplier()
	local cannonCategory = UpgradeCategories.Cannon1
	if diff > 2 then
		cannonCategory = UpgradeCategories.Cannon2
		if diff > 3 then
			cannonCategory = UpgradeCategories.Cannon3
			if diff > 4 then
				cannonCategory = UpgradeCategories.Cannon4
			end
		end
	end

	ArmyAttackP5Recruiter = UnlimitedArmyRecruiter:New(ArmyAttackP5, {
		Buildings = {
			Logic.GetEntityIDByName("barracksP5"),
			Logic.GetEntityIDByName("Reward5"),
			Logic.GetEntityIDByName("foundryP5"),
			Logic.GetEntityIDByName("stableP5"),
		},
		ArmySize = 5 + diff,
		UCats = {
			{UCat = UpgradeCategories.LeaderSword, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderBow, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderPoleArm, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderCavalry, SpawnNum = 1, Looped = true},
			{UCat = UpgradeCategories.LeaderHeavyCavalry, SpawnNum = 1, Looped = true},
			{UCat = cannonCategory, SpawnNum = 1, Looped = true},
		},
		ResCheat = true
	})
	ArmyAttackP5:AddCommandMove(GetPosition("AI2_ConcentratingArea"),true)
	ArmyAttackP5:AddCommandWaitForIdle(true)
	ArmyAttackP5:AddCommandAttackNearestTarget(40000, true)

	StartSimpleJob("increaseEnemySoldiersArmyP5")
end

function increaseEnemySoldiersArmyP5()
    if Counter.Tick2("increaseEnemySoldiersArmyP5",1200-getArchipelagoDifficultyMultiplier()*30) then
		if IsDead("barracksP5") and IsDead("Reward5") and IsDead("stableP5") and IsDead("foundryP5") then
			return true
		end
        ArmyAttackP5Recruiter.ArmySize = ArmyAttackP5Recruiter.ArmySize +1
    end
end


StartArmyP5Attack = function()

	-- Begin attack
	ArmyP5Attack.AttackAllowed = true

	local i
	for i=2,10 do
		TimeLine.Enter("P5 Attack Wave"..i, TimeLine.Seconds + i*10*60, "GiveP5ArmyResources")
	end

end

SetupArmyP5Upgrading = function()

	TimeLine.Enter("Upgrade P5pole to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5PoleArm")
	TimeLine.Enter("Upgrade P5pole to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5PoleArm")
	TimeLine.Enter("Upgrade P5pole to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5PoleArm")
	
	TimeLine.Enter("Upgrade P5sword to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5Sword")
	TimeLine.Enter("Upgrade P5sword to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5Sword")
	TimeLine.Enter("Upgrade P5sword to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5Sword")

	TimeLine.Enter("Upgrade P5bow to lvl 2", TimeLine.Seconds + 25*60, "UpgradeP5Bow")
	TimeLine.Enter("Upgrade P5bow to lvl 3", TimeLine.Seconds + 45*60, "UpgradeP5Bow")
	TimeLine.Enter("Upgrade P5bow to lvl 4", TimeLine.Seconds + 65*60, "UpgradeP5Bow")

	TimeLine.Enter("Upgrade P5cavalry to lvl 2", TimeLine.Seconds + 60*60, "UpgradeP2Cavalry")
	TimeLine.Enter("Upgrade P5heavycavalry to lvl 2", TimeLine.Seconds + 65*60, "UpgradeP2HeavyCavalry")

end


IncreaseArmyP5AttackSize = function()

	ArmyP5Attack.strength 			=	ArmyP5Attack.strength + 1
	ArmyP5Attack.retreatStrength	=	ArmyP5Attack.strength / 3

end

-----------------------------------------------------------------------------------------------------------------------
--
--	JOB: "ControlArmyP5Attack"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyP5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlArmyP5Attack",10)
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyP5Attack = function()
	-------------------------------------------------------------------------------------------------------------------
		TickOffensiveAIController(ArmyP5Attack)
		return false		
	end
-----------------------------------------------------------------------------------------------------------------------
