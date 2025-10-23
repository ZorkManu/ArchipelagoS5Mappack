createQuestDefendNorfolk = function()

	setupDestroyAttackArmy(ArmyP2WinterAttacker1)
	setupDestroyAttackArmy(ArmyP2WinterAttacker2)
	setupDestroyAttackArmy(ArmyP2WinterAttacker3)
	setupDestroyAttackArmy(ArmyP2Attacker)
	setupDestroyAttackArmy(ArmyP2Defense1)
	setupDestroyAttackArmy(ArmyP2Defense2)

	setupDestroyAttackArmy(ArmyP4WinterAttacker1)
	setupDestroyAttackArmy(ArmyP4Attacker)
	setupDestroyAttackArmy(ArmyP4Defense1)
	
	DiedCount	=	0
end

setupDestroyAttackArmy = function(_army)

	local Quest		=	{}
	Quest.Army		=	_army
	
	Quest.Callback	=	NorfolkAttackerDied
	
	SetupDestroy(Quest)
	
end

NorfolkAttackerDied = function()

	DiedCount = DiedCount + 1
	
	if DiedCount >= 9 and IsBriefingActive() ~= true then
		
		end3rdQuest()
	
	end

end