createQuestDefeat = function()

	AddDefeatCondition(		function(_Index) 
							return 	Logic.EntityGetPlayer(GetID("HQ")) ~= gvMission.PlayerID
									and	IsDead("Dario")
									and IsDead("Salim")
									and IsDead("Erec")
									and IsDead("Pilgrim")
							end,
							{ { name = "Dario", updatePos = true } }
						)

end