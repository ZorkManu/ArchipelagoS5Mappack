setupArmyP2Intruder = function()

	ArmyP2Intruder	=	{}

	local i
	for i=1,4 do

		ArmyP2Intruder[i] 				= 	{}
                                          	
		ArmyP2Intruder[i].player 		= 	2
		ArmyP2Intruder[i].id			= 	i + 5
		ArmyP2Intruder[i].strength		= 	2

		ArmyP2Intruder[i].position		= 	GetPosition("Intruders"..i)
		ArmyP2Intruder[i].rodeLength	= 	2000
		
		-- Setup army
		SetupArmy(ArmyP2Intruder[i])

		for j = 1, math.ceil(getArchipelagoDifficultyMultiplier()/2) do 
	
		local troopDescription 			=	{	maxNumberOfSoldiers	= 	4,
												minNumberOfSoldiers	= 	0,
												experiencePoints 	= 	LOW_EXPERIENCE,
												leaderType			=	Entities.PU_LeaderPoleArm1
											}			
	
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)
						
			if i == 4 and j == 1 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end
					
			troopDescription.leaderType = Entities.PU_LeaderSword1
	
			EnlargeArmy(ArmyP2Intruder[i], troopDescription)

			if i == 4 and j == 1 then
				EnlargeArmy(ArmyP2Intruder[i], troopDescription)
			end

		end
	
	end
	
end