
-- find ring at graveyard
createQuestRing = function()

	ring = {}

	ring.id = CreateEntity(0, Entities.XD_Sparkles, GetPosition("deploySparkle"), "ring")

	local quest = {}

	quest.EntityName 	= getLeadingHero()			
	quest.TargetName 	= "ring"						
	quest.Distance 		= 500				
	quest.Callback 		= RingPosReached	

	SetupExpedition(quest)

	end
	
	
	
RingPosReached = function()

	assert(ring.id ~= nil)
	DestroyEntity(ring.id)
	
	-- rename Miner entity
		local Miner = Logic.GetEntityIDByName("Miner")
		Logic.SetEntityName(Miner, "MinerGiveRing")
	
	createBriefingMinerGiveRing()
	createQuestMinerGiveRing()

	end