WAVE = 1


function initSouthernAttacker()
	StartSimpleJob("checkForSouthernAttacker")
end

function checkForSouthernAttacker()
	local respawnTime = 520 - getArchipelagoDifficulty()*30
	if Counter.Tick2("initSouthernAttacker", respawnTime) then
		createArmySouthernAssault()
	end
end

function createArmySouthernAssault()
	local southern_attack_pos = GetPosition("KI4_Spawnpoint")
	local diff = getArchipelagoDifficultyMultiplier()
	local leaderLevel = math.min(4, math.max(2,diff-1))
	local leaderLevelCav = 1
	if diff > 3 then
		leaderLevelCav = 2
	end
	local soldierAmount = math.min(8, diff + 2)
	local waveArmy = UnlimitedArmy:New({
		Player = 2,
		Area = 20000,
		TransitAttackMove = true,
		AutoDestroyIfEmpty = true
	})
	if Modulo(WAVE,3) == 2 then
		for i = 1, 1 + math.floor(diff/4) + math.floor(WAVE/3) do
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderPoleArm" .. leaderLevel], soldierAmount, southern_attack_pos, 2)
		end
		for i = 1, 2 + math.floor(diff/3) do
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderBow" .. leaderLevel], soldierAmount, southern_attack_pos, 2)
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderSword" .. leaderLevel], soldierAmount, southern_attack_pos, 2)
		end
	end
	if Modulo(WAVE,3) == 1 then
		for i = 1, 2 + math.floor(diff/3) + math.floor(WAVE/3) do
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderHeavyCavalry" .. leaderLevelCav], 3, southern_attack_pos, 2)
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderCavalry" .. leaderLevelCav], 3, southern_attack_pos, 2)
		end
	end
	if Modulo(WAVE,3) == 0 then
		waveArmy:CreateLeaderForArmy(Entities["PU_LeaderPoleArm" .. leaderLevel], soldierAmount, southern_attack_pos, 2)
		for i = 1, 2 + math.floor(diff/3) + math.floor(WAVE/3) do
			waveArmy:CreateLeaderForArmy(Entities["PU_Cannon" .. leaderLevel], soldierAmount, southern_attack_pos, 2)
			waveArmy:CreateLeaderForArmy(Entities["PU_LeaderRifle" .. leaderLevelCav], soldierAmount, southern_attack_pos, 2)
		end
	end
	WAVE = WAVE + 1
	if math.random(0,1) then
		waveArmy:AddCommandMove(GetPosition("attack1"))
	else
		waveArmy:AddCommandMove(GetPosition("attack2"))
		waveArmy:AddCommandWaitForIdle()
		waveArmy:AddCommandMove(GetPosition("base_attack"))
	end
	waveArmy:AddCommandWaitForIdle()
	waveArmy:AddCommandAttackNearestTarget(true)
end