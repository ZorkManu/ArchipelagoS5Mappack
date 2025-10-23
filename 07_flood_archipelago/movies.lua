--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_StartMovie()
	return Counter.Tick2("StartMovie", 3) -- 3 second
end
function Action_StartMovie()
	
	-- hier soll dann der Befehl hin, der das Movie abspielt

	GlobalMissionScripting.RequestTrigger( "speaksStory1" )	
	return 1
end
function Condition_speaksStory1()
	return Counter.Tick2("speaksStory1", 5) -- 5 second
end
function Action_speaksStory1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/mainquest_speaksStory1"))
	GlobalMissionScripting.RequestTrigger( "speaksStory2" )
	return 1
end
function Condition_speaksStory2()
	return Counter.Tick2("speaksStory2", 9) -- 9 second
end
function Action_speaksStory2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/mainquest_speaksStory2"))
	GlobalMissionScripting.RequestTrigger( "speaksStory3" )
	return 1
end
function Condition_speaksStory3()
	return Counter.Tick2("speaksStory3", 9) -- 9 second
end
function Action_speaksStory3()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/mainquest_speaksStory3"))		
	GlobalMissionScripting.RequestTrigger( "speaksStory4" )
	return 1
end
function Condition_speaksStory4()
	return Counter.Tick2("speaksStory4", 9) -- 9 second
end
function Action_speaksStory4()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/mainquest_speaksStory4"))	
	
	Logic.AddQuest(gvMission_PlayerID, 001, 1, "CM01_07_Flood/mainquest_name_Flood", "CM01_07_Flood/mainquest_desc_Flood")	
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	
	GlobalMissionScripting.RequestTrigger( "FindLeonardo" )
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mission_findLeonardoMovie()
	-- hier soll dann der Befehl hin, der das Movie abspielt

	GlobalMissionScripting.RequestTrigger( "Leonardospeaks1" )
end
function Condition_Leonardospeaks1()
	return Counter.Tick2("Leonardospeaks1", 3) -- 3 second
end
function Action_Leonardospeaks1()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardospeaks1"))
	GlobalMissionScripting.RequestTrigger( "Leonardospeaks2" )
	return 1
end
function Condition_Leonardospeaks2()
	return Counter.Tick2("Leonardospeaks2", 9) -- 9 second
end
function Action_Leonardospeaks2()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardospeaks2"))
	GlobalMissionScripting.RequestTrigger( "Leonardospeaks3" )
	return 1
end
function Condition_Leonardospeaks3()
	return Counter.Tick2("Leonardospeaks3", 9) -- 9 second
end
function Action_Leonardospeaks3()
	GUI.AddNote(XGUIEng.GetStringTableText("CM01_07_Flood/subquest002_note_Leonardospeaks3"))

	Logic.AddQuest(gvMission_PlayerID, 002, 1, "CM01_07_Flood/subquest002_name_Leonardo_Wood", "CM01_07_Flood/subquest002_desc_Leonardo_Wood")	
	GlobalMissionScripting.RequestTrigger( "NewQuest" )
	
	Logic.AddTribute(gvMission_PlayerID, 001, 0, gvMission_LeonardoID, "CM01_07_Flood/tribute001_Leonardo_Wood", ResourceType.Wood, 3000)
	GlobalMissionScripting.RequestTrigger( "LeonardoTribute" )
	return 1
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Mission_LeonardoWorkMovie()
	-- hier soll dann der Befehl hin, der das Movie abspielt
end