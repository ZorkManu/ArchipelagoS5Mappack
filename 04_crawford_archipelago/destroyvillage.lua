

destroyVillage = function()

	destroyVillageControl = {}
	
	destroyVillageControl.health = 30

	StartJob("DestroyVillage")

	end
	
	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "DestroyVillage"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_DestroyVillage = function()
	-------------------------------------------------------------------------------------------------------------------
		
		return true
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_DestroyVillage = function()
	-------------------------------------------------------------------------------------------------------------------
		
		destroyVillageControl.health = destroyVillageControl.health /2

		if destroyVillageControl.health < 2 then
		
			destroyVillageControl.health = 0
			
			end
		
		for i = 1,22,1 do
		
			local name = "burning"..i
			
			if IsValid(name) and GetPlayer(name) == 4 then
			
				SetHealth(name,destroyVillageControl.health)
			
				end
				
			end	

		return destroyVillageControl.health == 0		
		
		end

