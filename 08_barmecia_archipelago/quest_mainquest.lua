createQuestMainquest = function()
	-- Show briefing
  	-- Add Tribute
	local Tribute3 = {}
	
	Tribute3.Tribute = 4

	Logic.AddTribute(	GetHumanPlayer(), 
						Tribute3.Tribute,
						0,
						0,
						String.MainKey.."tribute_cathedral", 
						ResourceType.Stone, 
						10000 )

				
	Tribute3.Callback 	= MainTributePaid
	
	SetupTributePaid(Tribute3)
	
	
	gvMission.Gathering = 0
	Report("Gather Troops started")
	StartJob("GatherTroops")
	
end


MainTributePaid = function()
	Report("Main tribute was paid - You won!!!")
	CathedralPosition = GetPosition("Cathedral")
	--SpokenMessage(String.MainKey.."NoteVictory")
	-- Remove Construction site and set Cathedral
	Logic.DestroyEntity(GetID("Cathedral"))
	--local Cathedral = {{ type	= Entities.PB_Monastery3	,	pos = CathedralPosition	}}				
  --FeedAiWithConstructionPlanFile(gvMission.PlayerIDBarmecia, Cathedral)
	 local NewCathedral = Logic.CreateEntity(Entities.PB_Monastery3, CathedralPosition.X, CathedralPosition.Y, 0, gvMission.PlayerIDBarmecia)
	Camera.ScrollGameTimeSynced (CathedralPosition.X, CathedralPosition.Y)
	
	end4thQuest()
end


Condition_GatherTroops = function()
		return Counter.Tick2("GatherTroops", 240)
end


Action_GatherTroops = function()
			gvMission.Gathering = gvMission.Gathering + 1				

				local ArchPos = GetPosition("CleycourtArchery")
				-- determine target point and coordinates
				local DestinationName 	= "GatheringPoint" .. gvMission.Gathering
				local GPos = GetPosition(DestinationName)

				local Leader1 = Tools.CreateGroup(gvMission.PlayerIDCleycourt, Entities.PU_LeaderSword2, 6, ArchPos.X, ArchPos.Y, 240)
				local Leader2 = Tools.CreateGroup(gvMission.PlayerIDCleycourt, Entities.PU_LeaderBow2, 6, ArchPos.X, ArchPos.Y, 240)

				Logic.GroupAttackMove(Leader1, GPos.X, GPos.Y, 0)
				Logic.GroupAttackMove(Leader2, (GPos.X-1000), (GPos.Y+100), 0)
				
				Report("Gathering Troops")
		if gvMission.Gathering == 2 then
			SpokenMessage(String.MainKey.."NoteGathering[2]")
		elseif gvMission.Gathering == 4 then
			SpokenMessage(String.MainKey.."NoteGathering[4]")
		end
		
		if gvMission.Gathering == 7 then
			SpokenMessage(String.MainKey.."NoteGathering[7]")
			return true
		else
			return false
		end
end