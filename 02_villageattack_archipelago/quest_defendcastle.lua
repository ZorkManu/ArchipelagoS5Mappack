
createQuestDefendCastle = function()

	StartJob("QuestAttackingArmies")

end






destroyQuestDefendCastle = function()

	GlobalMissionScripting.GiveResouces(GetHumanPlayer(),500,0,0,0,0,0)

	endQuestDefendCastle()
	
end









-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestAttackingArmies"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestAttackingArmies = function()
	-------------------------------------------------------------------------------------------------------------------

		if Counter.Tick2("QuestAttackingArmies",3) then

			if 	IsDead(armyAttack1) and IsDead(armyAttack2) then

				Report("both attacking armies are dead")
			
				if 	( (armyAttack1.control.attack <= 0 or IsDead("tower1")) ) and 
					( (armyAttack2.control.attack <= 0 or IsDead("tower2")) ) then
				
					return true
					
				end
					
			end		
			
			return false

		end
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestAttackingArmies = function()
	-------------------------------------------------------------------------------------------------------------------

		destroyQuestDefendCastle()

		return true
		
	end
