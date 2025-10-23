
createQuestAriDead = function()

	StartJob("ControlAriDead")

	end
-----------------------------------------------------------------------------------------------------------------------	
--
--	JOB: "AriDead"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	Condition_ControlAriDead = function()
	-------------------------------------------------------------------------------------------------------------------
		
		if 	IsDead("Ari")
			and	AriInCleyCourt == true
			then 
			
			return true
			
			end
			
		return false
		
		end
		
	-------------------------------------------------------------------------------------------------------------------
	Action_ControlAriDead = function()
	-------------------------------------------------------------------------------------------------------------------

		restartCleycourt()		

		return true
		
		end
		
------------------------------------------------------------------------------------------------------------------
		
restartCleycourt = function()
	Report("Ari is dead -> respawn")

--	if KeyAlreadyFound == true
--	then
--		Logic.RemoveQuest(1,7)  
--	end
--

	SpokenMessage(String.MainKey.."AriDied")

	EmptyChest1AlreadyFound = false
	EmptyChest2AlreadyFound = false
	
	Logic.HealEntity("Ari",50)
	SetPosition("Ari",GetPosition("AriRespawn"))
	KeyAlreadyFound = false
       	ariHasTheKey = false
  	AriInCleyCourt = false
	
	if IsDead("cave") == false then
		DestroyEntity("cave")
		end

  	DestroyEntity("chest1")
	DestroyEntity("chest2")
	DestroyEntity("chest3")
	CreateEntity(0,Entities.XD_ChestClose,BackupPositionChest1,"chest1")
	CreateEntity(0,Entities.XD_ChestClose,BackupPositionChest2,"chest2")
	CreateEntity(0,Entities.XD_ChestClose,BackupPositionChest3,"chest3")

	CreateEntity(0,Entities.XD_Sparkles,GetPosition("entry"),"cave")

	local PosX, PosY = Tools.GetPosition("Ari")
	Camera.ScrollSetLookAt(PosX, PosY)

	StartJob("QuestEnterCleycourt")
end
