function InitSwampQuest()
	-- Create swamp ambush
	CreateSwampAmbush()
end

function CreateSwampAmbush()
	-- Create empty table for positions and IDs with name SwampAmbush
	gvMission.SwampAmbush = {}

	-- Fill up table with Positions and Ids from entities with name attSpawnPoint..1-5.._SA
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 5, "_SA", gvMission.SwampAmbush)
	
	-- Hold leader IDs
	gvMission.SwampAmbushLeader = {}
	
	-- Create groups..GlobalMissionScripting.CreateGroup(_PlayerID, _LeaderType, _SoldierAmount, _X , _Y ,_Orientation )
	gvMission.SwampAmbushLeader[1] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.SwampAmbush[1].X, gvMission.SwampAmbush[1].Y, 180 )
	gvMission.SwampAmbushLeader[2] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 6, gvMission.SwampAmbush[2].X, gvMission.SwampAmbush[2].Y, 180 )
	gvMission.SwampAmbushLeader[3] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.SwampAmbush[3].X, gvMission.SwampAmbush[3].Y, 180 )
	gvMission.SwampAmbushLeader[4] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.SwampAmbush[4].X, gvMission.SwampAmbush[4].Y, 180 )
	gvMission.SwampAmbushLeader[5] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.SwampAmbush[5].X, gvMission.SwampAmbush[5].Y, 180 )
	
	-- Create west & east swamp ambush
	gvMission.WestAndEastSwampAmbush = {}

	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 6, "_SDA", gvMission.WestAndEastSwampAmbush)

	-- Create groups..GlobalMissionScripting.CreateGroup(_PlayerID, _LeaderType, _SoldierAmount, _X , _Y ,_Orientation )
	gvMission.SwampAmbushLeader[6] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 6, gvMission.WestAndEastSwampAmbush[1].X, gvMission.WestAndEastSwampAmbush[1].Y, 0 )
	gvMission.SwampAmbushLeader[7] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.WestAndEastSwampAmbush[2].X, gvMission.WestAndEastSwampAmbush[2].Y, 0 )
	gvMission.SwampAmbushLeader[8] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderSword2, 6, gvMission.WestAndEastSwampAmbush[3].X, gvMission.WestAndEastSwampAmbush[3].Y, 0 )
	gvMission.SwampAmbushLeader[9] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderPoleArm2, 6, gvMission.WestAndEastSwampAmbush[4].X, gvMission.WestAndEastSwampAmbush[4].Y, 0 )
	gvMission.SwampAmbushLeader[10] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.WestAndEastSwampAmbush[5].X, gvMission.WestAndEastSwampAmbush[5].Y, 0 )
	gvMission.SwampAmbushLeader[11] = GlobalMissionScripting.CreateGroup(5, Entities.PU_LeaderBow2, 6, gvMission.WestAndEastSwampAmbush[6].X, gvMission.WestAndEastSwampAmbush[6].Y, 0 )
end

function SendOrDeleteSwampUnits(_Position)
	-- Check all swamp units
	local i
	for i=1, table.getn(gvMission.SwampAmbushLeader) do
		-- No unit visible
		if GlobalMissionScripting.IsEntityOrGroupVisible(gvMission.PlayerID, gvMission.SwampAmbushLeader[i]) == 1 then
			-- Send to position
			Logic.GroupAttackMove(gvMission.SwampAmbushLeader[i], _Position.X, _Position.Y, -1)
		else
			-- Destroy group
			Logic.DestroyGroupByLeader(gvMission.SwampAmbushLeader[i])
		end
	end
end