setupArmyP2FirstAttack = function()

	ArmyP2FirstAttack				= {}

	ArmyP2FirstAttack.player 		= 2
	ArmyP2FirstAttack.id			= 0
	ArmyP2FirstAttack.strength		= 5
	ArmyP2FirstAttack.position		= GetPosition("OccupyingPos")
	ArmyP2FirstAttack.rodeLength	= 5000
	
	-- Setup army
	SetupArmy(ArmyP2FirstAttack)

	local troopDescription = {
	
		maxNumberOfSoldiers	= 8,
		minNumberOfSolderis	= 0,
		experiencePoints 	= LOW_EXPERIENCE,
		leaderType			= Entities["PU_LeaderPoleArm1"]
	}			

	for i = 1, math.ceil(getArchipelagoDifficultyMultiplier()/2) do
	EnlargeArmy(ArmyP2FirstAttack, troopDescription)
	EnlargeArmy(ArmyP2FirstAttack, troopDescription)

	troopDescription.leaderType = Entities["PU_LeaderSword1"]

	EnlargeArmy(ArmyP2FirstAttack, troopDescription)
	EnlargeArmy(ArmyP2FirstAttack, troopDescription)

	troopDescription.leaderType = Entities["PV_Cannon2"]
	troopDescription.maxNumberOfSoldiers = 0

	EnlargeArmy(ArmyP2FirstAttack, troopDescription)
	end
end