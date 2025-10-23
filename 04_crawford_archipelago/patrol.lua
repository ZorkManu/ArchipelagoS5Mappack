function InitPatrols()
	-- Create Table for spawnpoints OO1
	gvMission.SpawnOO1 = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 3, "_OO1", gvMission.SpawnOO1)	
	
	-- Create Table for spawnpoints OO2
	gvMission.SpawnOO2 = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 3, "_OO2", gvMission.SpawnOO2)	
	
	-- Create Table for spawnpoints OO3
	gvMission.SpawnOO3 = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("attSpawnPoint", 3, "_OO3", gvMission.SpawnOO3)	
	
	------------

	-- Create Table for patrol1 WP OO1
	gvMission.Patrol1_WP = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("patrol1_WP", 12, "", gvMission.Patrol1_WP)	
	
	-- Create Table for patrol2 WP OO1
	gvMission.Patrol2_WP = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("patrol2_WP", 6, "", gvMission.Patrol2_WP)	

	-- Create Table for patrol3 WP OO2
	gvMission.Patrol3_WP = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("patrol3_WP", 12, "", gvMission.Patrol3_WP)	

	-- Create Table for patrol4 WP OO2
	gvMission.Patrol4_WP = {}
	-- Fill up table with Positions and Ids
	GlobalMissionScripting.GetPositionsAndIDs("patrol4_WP", 7, "", gvMission.Patrol4_WP)	

	------------
	
	-- Get patrol start of OO1	
	gvMission.PatrolStart_OO1 = Logic.GetEntityIDByName("patrolStart_OO1")
	gvMission.PatrolStart_OO1Pos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.PatrolStart_OO1, gvMission.PatrolStart_OO1Pos)

	-- Get patrol start of OO2	
	gvMission.PatrolStart_OO2 = Logic.GetEntityIDByName("patrolStart_OO2")
	gvMission.PatrolStart_OO2Pos = {}
	GlobalMissionScripting.GetEntityPosition(gvMission.PatrolStart_OO2, gvMission.PatrolStart_OO2Pos)
	
	------------

	-- Creates Table with empty patrol 1 groups
	gvMission.Patrol1 = {}
	gvMission.Patrol1[1] = 0
	gvMission.Patrol1[2] = 0
	gvMission.Patrol1[3] = 0
	
	-- Creates Table with empty patrol 2 groups
	gvMission.Patrol2 = {}
	gvMission.Patrol2[1] = 0
	gvMission.Patrol2[2] = 0
	gvMission.Patrol2[3] = 0
	
	-- Creates Table with empty patrol 3 groups
	gvMission.Patrol3 = {}
	gvMission.Patrol3[1] = 0
	gvMission.Patrol3[2] = 0
	gvMission.Patrol3[3] = 0
	
	-- Creates Table with empty patrol 4 groups
	gvMission.Patrol4 = {}
	gvMission.Patrol4[1] = 0
	gvMission.Patrol4[2] = 0
	gvMission.Patrol4[3] = 0
end