
createQuestLeonardo = function()

	InitNPCLookAt("Leonardo")

end



destroyQuestLeonardo = function()

	DisableNpcMarker("Leonardo")

	--enable_WatchOutTower()

	--Logic.SetTechnologyState(GetHumanPlayer(),Technologies.B_Tower, 3 )
	--Archipelago Reward
	checkLocation("thalgrund_tower")

end