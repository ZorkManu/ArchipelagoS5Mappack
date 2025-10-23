createQuestSearchAllies = function()

	-- Add new quest
	Logic.AddQuest(
		1,									
		6,						
		MAINQUEST_OPEN,		
		"CM01_19_Wasteland_Txt/mainquest006_name_SearchAllies",
		"CM01_19_Wasteland_Txt/mainquest006_desc_SearchAllies",			
		1	
	)
--	Subquests löschen
			Logic.SetSubQuestDoneFlag(	1,	6,	0,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	1,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	2,	0,	0) 
			Logic.SetSubQuestDoneFlag(	1,	6,	3,	0,	0) 
end

SearchAlliesDone = function()


	-- Quest done
	Logic.SetQuestType(
		1, 					
		6,
		MAINQUEST_OPEN +1,
		1
	)


end