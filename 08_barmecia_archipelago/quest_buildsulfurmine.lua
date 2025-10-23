createQuestBuildSulfurMine = function()
	createBriefingBuildSulfurMine()

	EstablishSulfurMineQuest = {}
	
	EstablishSulfurMineQuest.Callback = SulfurMineEstablished
	EstablishSulfurMineQuest.EntityTypes = { { Entities.PB_SulfurMine1, 1 } }
end


SulfurMineEstablished = function()
	Report("SulfurMineEstablished")
	Logic.ChangeAllEntitiesPlayerID(gvMission.PlayerIDPilgrim, gvMission.PlayerID)
	ResolveBriefing(BuildSulfurMineQuest)
	StartCutscene("Cutscene1", PilgrimCutsceneEnded)
	checkLocation("barmecia_build_sulfur_mine")
end

PilgrimCutsceneEnded = function()
    ArmyRobbersEastSetOffensive()
	createBriefingSulfurMineBuilt()
end

BriefingBuildSulfurMineFinished = function()
			DisableNpcMarker("PilgrimNPC")
			DestroyEntity("PilgrimNPC")
			--CreateChestOpener("Pilgrim")
			SetupEstablish(EstablishSulfurMineQuest)
end