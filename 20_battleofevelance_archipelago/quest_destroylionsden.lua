
createQuestDestroyLionsDen = function()

	StartJob("QuestDestroyLionsDen")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "QuestDestroyLionsDen"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestDestroyLionsDen = function()
	-------------------------------------------------------------------------------------------------------------------
		
		local kerberosCastle = Logic.GetEntityIDByName("lionsDen")

		-- won if castle is burning or destroyed
		if	kerberosAppeared == nil and 
			Logic.GetEntityHealth(kerberosCastle) < (Logic.GetEntityMaxHealth(kerberosCastle) * 0.4) then

			CreateEntity(5, Entities.CU_BlackKnight, GetPosition("defend1"), "Kerberos" )
			
			kerberosAppeared = true
			
		end
			
		return IsDead("lionsDen")		
		
	end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestDestroyLionsDen = function()
	-------------------------------------------------------------------------------------------------------------------
		
		endQuestDestroyLionsDen()
		
		return true
		
		end
-----------------------------------------------------------------------------------------------------------------------	
