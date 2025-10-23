createQuestGateHQ = function()

	StartJob("GateHQ")
	GateHQ = 	{}	

end

Condition_GateHQ = function()

	return IsDead("GateHQ") and briefingIsActive ~= true
end

Action_GateHQ = function()

	Report("GateHQ DEAD!")

		talkedToGateNPC = true
		DisableNpcMarker("GateNPC")	

		GateHQ.GateNPC = GetID("GateNPC")
		MoveAndVanish(GateHQ.GateNPC,"Major")

	return true
end