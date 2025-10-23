ARMY1_START_DELAY 	= 10 * 60 - getArchipelagoDifficultyMultiplier() * 10
ARMY1_DELAY 		= (5 * 60) + 20

ARMY1_TROOP1_TYPE1	= Entities.CU_BlackKnight_LeaderMace1

ARMY1_TROOP2_TYPE1	= Entities.CU_BlackKnight_LeaderMace1
ARMY1_TROOP2_TYPE2	= Entities.CU_BanditLeaderSword1

ARMY1_ATTACKS			= 1



createArmyAttack1 = function()

	--	set up

		armyAttack1						= {}
	
		armyAttack1.player 				= 2
		armyAttack1.id					= 4
		armyAttack1.strength			= 2
		armyAttack1.position			= GetPosition("tower1")					-- up hill
		armyAttack1.rodeLength			= 0
		armyAttack1.control				= {}
		armyAttack1.control.delay		= ARMY1_START_DELAY
		armyAttack1.control.attack		= ARMY1_ATTACKS							-- Number of Attacks -1
		
		SetupArmy(armyAttack1)


	--	create 
			
		local troopDescription = {
		
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			

		troopDescription.leaderType = ARMY1_TROOP1_TYPE1	
		for i = 1, getArchipelagoDifficultyMultiplier() * 2 do
			EnlargeArmy(armyAttack1,troopDescription)
		end

		
	--	job		
		
		-- StartJob("ControlArmyAttack1") -- started when quest starts

	end



	
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "ControlArmyAttack1"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead("tower1") then
		
			return false
			
		end


		-- Stop Countdwon if army is dead

		if armyAttack1.control.attack == 0 and IsDead(armyAttack1) then

			MapLocal_StopCountDown(0)

		end	


		if armyAttack1.control.delay > 0 then
			
			armyAttack1.control.delay = armyAttack1.control.delay -1		
	
			if 	armyAttack1.control.delay == 0 then

				MapLocal_StopCountDown(0)

	
				-- give warning message when first attack starts

				if armyAttack1.control.attack == ARMY1_ATTACKS then

					--	check if briefing is active
					if IsBriefingActive() ~= true then
	
						MapLocal_CameraPositionBackup()
						createBriefingRobber1Attack()	 
			
					else
			
						MapBriefing_Started = StartJob("DelayBriefing")
			
					end
				end
				
			end
		
			return false
			
		end
		
		return Counter.Tick2("ControlArmyAttack1",5)
		
	end




		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlArmyAttack1 = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if IsDead(armyAttack1) then
		

		-- army1 is finally defeated!
		
			if armyAttack1.control.attack == 0 then
				
				Report("army1 defeated, free Leonardo!")
			
				if LEONARDO_FREED ~= 1 then							-- if Leo isn't freed yet, give a hint

					if IsBriefingActive() ~= true then
					
						MapLocal_CameraPositionBackup()	 
						createBriefingFreeLeonardoHint()
				
					else
			
						MapBriefingLeo_Started = StartJob("DelayLeoBriefing")
			
					end
				end
	


				-- if army2 (SOUTH) is still alive and tower there still exists, start countdown for attack from there

				if 	IsDead("tower2") ~= true and 
					armyAttack2.control.attack ~= 0 then
	
					MapLocal_StartCountDown(armyAttack2.control.delay)

				end
		
				return true


		-- army1 is not defeated, yet!				
			
			elseif armyAttack1.control.attack == ARMY1_ATTACKS then		-- first wave defeated => warning next

				if IsBriefingActive() ~= true then
			
					MapLocal_CameraPositionBackup()	 
					createBriefingRobber1Warning()
			
				else
		
					MapBriefingWarning_Started = StartJob("DelayWarningBriefing")
		
				end
			
			end	

		
			Retreat(armyAttack1)
						

			--	create new troops for next attack
					
				local troopDescription = {
				
					maxNumberOfSoldiers	= 4,
					minNumberOfSoldiers	= 0,
					experiencePoints 	= LOW_EXPERIENCE,
				}				
	
				-- define new attacking armies
				
				armyAttack1.control.attack = armyAttack1.control.attack -1
		
				Report("army1, Angriff Nr.: "..armyAttack1.control.attack)

				
				if armyAttack1.control.attack >= 0 then
					
					troopDescription.leaderType = ARMY1_TROOP2_TYPE1
					for i = 1, getArchipelagoDifficultyMultiplier() do
						EnlargeArmy(armyAttack1,troopDescription)
					end
    	    		
					troopDescription.leaderType = ARMY1_TROOP2_TYPE2
					for i = 1, getArchipelagoDifficultyMultiplier() do
						EnlargeArmy(armyAttack1,troopDescription)
					end

				end
						
			--	time till next attack
				
				armyAttack1.control.delay = ARMY1_DELAY
				MapLocal_StartCountDown(armyAttack1.control.delay)
    
		else
		
			Report("army1 advanced; Angriff Nr.: "..armyAttack1.control.attack)

			Advance(armyAttack1)
			
		end

		return false
		
	end
	
	
	


	----------------------------------------------------------------
	Condition_DelayBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing = function()                                  
	----------------------------------------------------------------

		MapLocal_CameraPositionBackup()	 
		createBriefingRobber1Attack()	 
	
		EndJob(MapBriefing_Started)

	end





	----------------------------------------------------------------
	Condition_DelayLeoBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             

                                                                    
	----------------------------------------------------------------
	Action_DelayLeoBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		MapLocal_CameraPositionBackup()	 
		createBriefingFreeLeonardoHint()
	
		EndJob(MapBriefingLeo_Started)

	end






	----------------------------------------------------------------
	Condition_DelayWarningBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             

                                                                    
	----------------------------------------------------------------
	Action_DelayWarningBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		MapLocal_CameraPositionBackup()	 
		createBriefingRobber1Warning()
	
		EndJob(MapBriefingWarning_Started)

	end
