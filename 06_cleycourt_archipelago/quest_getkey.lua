createQuestGetKey = function()

	ChestQuest				=	{}
	ChestQuest.Heroes				=	true
--	ChestQuest.EntityName		=	"Dario"
	ChestQuest.TargetName	=	"Chest"
	ChestQuest.Distance		=	500
	
	ChestQuest.Callback		=	DarioNearQuest

	ChestQuest.State		=	0
	
	SetupExpedition(ChestQuest)
end

DarioNearQuest	=	function()

	if	talkedToBarmeciaMayor ~= nil	then

		keyfound = true
		if QuestFindKeyOpenend == true then
			Logic.SetQuestType(
			1, 					
			10,
			MAINQUEST_OPEN +1,
			1)
		end
		
		end8thSubQuest()

		checkLocation("cleycourt_collect_key")
		
		return true
		
	elseif	ChestQuest.State ~= 1	then
--	else		
--		Message("This chest is closed and can only be opened with a special key.")
		if TalktoMayorFirstFlag ~= true then
			SpokenMessage(String.MainKey.."TalktoMayorFirst")
			TalktoMayorFirstFlag = true
		end
		
		ChestQuest.State = 1
		
	end

	return false

end