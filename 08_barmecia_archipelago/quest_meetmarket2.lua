createQuestMeetMarket2 = function()
		-- Near major quest
	local Market2MeetQuest = {}
	Market2MeetQuest.TargetName = "Market2BuildPlace"
	Market2MeetQuest.Distance = 4000
	Market2MeetQuest.Callback = Market2Met
	
	Market2MeetQuest.Heroes	= 1
	Market2MeetQuest.Leaders = 1
	Market2MeetQuest.Serfs = 1
	
--	InitNPC("TraderNPC2")
	InitNPCLookAt("TraderNPC2")
	
	SetupExpedition(Market2MeetQuest)
	
	local Position = GetPosition("DestructionArmyWaitingPoint")
	
	local TraderID = Logic.GetEntityIDByName("Trader2")
	Logic.HurtEntity(TraderID, Logic.GetEntityHealth(TraderID) - 200)
	gvMission.DestructionGroup = Tools.CreateGroup(gvMission.PlayerIDBarmecia, Entities.PU_LeaderSword2, 6, Position.X, Position.Y, 240)
end


-------------------------------------------------------------------------------------------------------
-- Princess back by major
-------------------------------------------------------------------------------------------------------
Market2Met = function()
	-- Mission done
	Report("Market 2 was met")
	
		
	return true

end