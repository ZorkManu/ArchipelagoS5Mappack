	-------------------------------------------------------------------------------------------------------------------
	Condition_QuestNearGateNoKey = function()
	-------------------------------------------------------------------------------------------------------------------
	
		return (IsNear("Dario","AriGate1",1000) or IsNear("Erec","AriGate1",1000) or IsNear("Helias","AriGate1",1000) or IsNear("Ari","AriGate1",1000) or IsNear("Salim","AriGate2",1000) or IsNear("Pilgrim","AriGate3",1000) or IsNear("Kerberos","AriGate4",1000) or IsNear("Mary","AriGate5",1000) or IsNear("Varg","AriGate6",1000) or IsNear("Drake","AriGate7",1000) or IsNear("Yuki","AriGate8",1000)) and (keyfound ~= true)
--		return IsNear("Dario","AriGate1",1000) or IsNear("Erec","AriGate1",1000) or IsNear("Helias","AriGate1",1000)
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_QuestNearGateNoKey = function()
	-------------------------------------------------------------------------------------------------------------------

		Report("Hero Near Gate and no key")
		QuestFindKeyOpenend = true

		local PosX, PosY = Tools.GetPosition("AriGate1")
		Camera.ScrollSetLookAt(PosX, PosY)
		SpokenMessage(String.MainKey.."NearGateNoKey")
	
		Logic.AddQuest(
		1,									
		10,						
		MAINQUEST_OPEN,		
		"CM01_06_Cleycourt_Txt/mainquest010_name_FindKey",
		"CM01_06_Cleycourt_Txt/mainquest010_desc_FindKey",			
		1)
	
	
		return true
		
		end
