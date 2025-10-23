--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include Movie function

function Condition_Movie_Weathermachine()
	return Counter.Tick2("Movie_Weathermachine", 5) -- 5 second
end
function Action_Movie_Weathermachine()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_06_Cleycourt_Txt/Mainquest_note_Weathermachine"))
	Logic.AddQuest(gvMission_PlayerID, 004, 1, "CM01_06_Cleycourt_Txt/Mainquest_name_Weathermachine", "CM01_06_Cleycourt_Txt/Mainquest_desc_Weathermachine")
	
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	return 1
end