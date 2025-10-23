createQuestJoiningTowers = function()

	-- Use rescue quest
	InitTowers("OP1_tower", 4)
	InitTowers("OP2_tower", 4)
	InitTowers("OP3_tower", 2)
end

InitTowers = function(_Name, _Count)

	local i
	for i=1, _Count do
		local Quest = {}
		Quest.ApproachRange = 1000
		
		Quest.Callback = TowerJoined		
		Quest.GiftEntity = _Name..i
		Quest.ApproachPos = _Name..i
		
		SetupRescue(Quest)
	end

end

TowerJoined = function()

	SpokenMessage(String.MainKey.."Message_TowerFound")

end