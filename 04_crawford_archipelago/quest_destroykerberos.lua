
createQuestDestroyKerberos = function()

	StartJob("ControlQuestDestroyKerberos")

	end


-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlQuestDestroyKerberos"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlQuestDestroyKerberos = function()
	-------------------------------------------------------------------------------------------------------------------

		local kerberosCastle = Logic.GetEntityIDByName("enemyCastle")

		-- won if castle is burning or destroyed
		if 	Logic.GetEntityHealth(kerberosCastle) < (Logic.GetEntityMaxHealth(kerberosCastle) * 0.8) or 
			IsDead("enemyCastle") then 
			
			return true
			
		end
			
		return false

	end



		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlQuestDestroyKerberos = function()
	-------------------------------------------------------------------------------------------------------------------

		endQuestDestroyKerberos()

		ResolveBriefing(briefingDestroyKerberos[page_destroyKerberos])
		
		return true
		
	end
