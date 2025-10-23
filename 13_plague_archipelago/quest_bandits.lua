
startQuestBandits = function()

	InitNPCLookAt("banditLeader")

end




	
endQuestBandits = function()

	DisableNpcMarker("banditLeader")

	Logic.SetDiplomacyState( 6, 2, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 6, 3, Diplomacy.Hostile 	)
	Logic.SetDiplomacyState( 6, 5, Diplomacy.Hostile 	)

end