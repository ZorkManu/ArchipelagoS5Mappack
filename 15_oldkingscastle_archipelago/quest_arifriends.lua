createQuestAriFriends = function()

	local i
	for i=1,3 do

		local pos = GetPosition("AriFriends"..i)
		
		local Leader = Tools.CreateGroup(4, Entities.CU_BanditLeaderSword1, 4, pos.X, pos.Y, 180)
		InitNPCLookAt(Leader)
		
		Logic.SetEntityName(Leader, "AriFriendsLeader"..i)
		
		local Quest 			=	{}
		Quest.GiftEntity 		=	Leader
		Quest.ApproachPos 		=	Leader
		if i == 1 then
			Quest.ApproachRange		=	1000
		else
			Quest.ApproachRange		=	500
		end
		
		Quest.Callback			=	FoundAriFriend
	
		SetupRescue(Quest)
	
	end
end

FoundAriFriend = function(_Quest)

	if AriFriendsTalkCount == 0 then

		-- Stop moving entity and destroy task
			local movingID = Logic.GetEntityIDByName("Dario")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Erec")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Pilgrim")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end
			local movingID = Logic.GetEntityIDByName("Salim")
			if Logic.IsEntityMoving(movingID) then
				Move(movingID, movingID)
			end

		end6thSubQuest()

	else
		SpokenMessage(String.MainKey.."Message_ArisRobbersFollow")
	end
	AriFriendsTalkCount = AriFriendsTalkCount +1

		if AriFriendsTalkCount == 1 then
			checkLocation("old_kings_castle_bandits_front")
		end
		if AriFriendsTalkCount == 2 then
			checkLocation("old_kings_castle_bandits_rock")
		end
		if AriFriendsTalkCount == 3 then
			checkLocation("old_kings_castle_bandits_castle")
		end
end