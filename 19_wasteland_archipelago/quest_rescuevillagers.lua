createQuestRescueVillagers = function()

	local Quest = {}
	Quest.Gift = "RescueObject"
	
	Quest.ApproachPos = "VillagersRescuePos"
	Quest.ApproachRange = 760

	Quest.Callback = RescueVillagersDone
	
	SetupRescue(Quest)

	-- Add new quest
	Logic.AddQuest(
		1,									
		3,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest003_name_RescueVillagers",
		"CM01_19_Wasteland_Txt/mainquest003_desc_RescueVillagers",			
		1	
	)
end

RescueVillagersDone = function()

	-- Attach soldiers
	local i
	for i=1,3 do
		Tools.AttachSoldiersToLeader("RescueObject"..i, 12)
	end

	-- Quest done
	Logic.SetQuestType(
		1, 					
		3,
		MAINQUEST_OPEN +1,
		1
	)
	
--TK Disable Flüchtling
	DisableNpcMarker("Fugitive")


	end4thQuest()

end