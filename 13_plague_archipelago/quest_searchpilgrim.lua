
startQuestSearchPilgrim = function()

	EnableNpcMarker("PilgrimNPC")

end




endQuestSearchPilgrim = function()

	DisableNpcMarker("PilgrimNPC")
	DisableNpcMarker("npcPilgrim")
	


	-- if player payed NPC to find pilgrim
	if NPC_PilgrimTributePaid == 1 then
		if IsAlive("npcPilgrim_target") and IsAlive("npcPilgrim") then
			MoveAndVanish("npcPilgrim", "npcPilgrim_target")
		end
	end

end
