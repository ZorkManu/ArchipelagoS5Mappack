createQuestGetKey = function()

	local Quest			=	{}
	Quest.EntityName	=	"Helias"
	Quest.TargetName	=	"GateKey1"
	Quest.Distance		=	500
	
	Quest.Callback		=	HeliasNearChest
	
	SetupExpedition(Quest)

	StartJob("AriNearChest")

end

HeliasNearChest = function()

	if	AriNearChest == nil then

		SpokenMessage(String.MainKey.."Message_AriMustOpenChest")

		return true
	else
		return false
	end
	
end

Condition_AriNearChest = function()

	if IsBriefingActive() then
		return false
	end

	local UnlockTime = 10

	if IsNear("Ari", "GateKey1", 500) then
		
		-- Start count
		if AriNearChest == nil then
			
			AriNearChest = 0

			SpokenMessage(String.MainKey.."Message_OpenChestCountDown")

			MapLocal_StartCountDown(UnlockTime)
			
		end
	
		AriNearChest = AriNearChest + 1
		
		return AriNearChest >= UnlockTime
		
	elseif AriNearChest ~= nil then

		MapLocal_StopCountDown()
		
		SpokenMessage(String.MainKey.."Message_OpenChestInterrupted")
		
		AriNearChest = nil
		return false
		
	end

end

Action_AriNearChest = function()

	MapLocal_StopCountDown()

	end4thSubQuest()
	return true

end