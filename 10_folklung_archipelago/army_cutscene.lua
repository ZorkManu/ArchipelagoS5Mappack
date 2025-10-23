createArmyCutscene = function()
	Sword1Pos = GetPosition("P5_SwordmenPosition1")
	Sword2Pos = GetPosition("P5_SwordmenPosition2")
	Sword3Pos = GetPosition("P5_SwordmenPosition3")
		
	Sword1ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Sword1Pos.X, Sword1Pos.Y, -5)
	Logic.LeaderChangeFormationType( Sword1ID, 4 )		
	Sword2ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Sword2Pos.X, Sword2Pos.Y, -5)
	Logic.LeaderChangeFormationType( Sword2ID, 4 )		
	Sword3ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Sword3Pos.X, Sword3Pos.Y, -5)
	Logic.LeaderChangeFormationType( Sword3ID, 4 )		
	
	
	Bow1Pos = GetPosition("P5_BowmenPosition1")
	Bow2Pos = GetPosition("P5_BowmenPosition2")
	Bow3Pos = GetPosition("P5_BowmenPosition3")
		
	Bow1ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderBow3, 9, Bow1Pos.X, Bow1Pos.Y, -5)
	Logic.LeaderChangeFormationType( Bow1ID, 4 )		
	Bow2ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderBow3, 9, Bow2Pos.X, Bow2Pos.Y, -5)
	Logic.LeaderChangeFormationType( Bow2ID, 4 )		
	Bow3ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PU_LeaderBow3, 9, Bow3Pos.X, Bow3Pos.Y, -5)
	Logic.LeaderChangeFormationType( Bow3ID, 4 )		
	
	
	Spear1Pos = GetPosition("P5_SpearmenPosition1")
	Spear2Pos = GetPosition("P5_SpearmenPosition2")
	Spear3Pos = GetPosition("P5_SpearmenPosition3")
		
	Spear1ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Spear1Pos.X, Spear1Pos.Y, -5)
	Logic.LeaderChangeFormationType( Spear1ID, 4 )		
	Spear2ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Spear2Pos.X, Spear2Pos.Y, -5)
	Logic.LeaderChangeFormationType( Spear2ID, 4 )		
	Spear3ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.CU_Barbarian_LeaderClub1, 9, Spear3Pos.X, Spear3Pos.Y, -5)
	Logic.LeaderChangeFormationType( Spear3ID, 4 )		
	
	
	
	Cannon1Pos = GetPosition("P5_CannonPosition1")
	Cannon2Pos = GetPosition("P5_CannonPosition2")
	Cannon3Pos = GetPosition("P5_CannonPosition3")
	
	Cannon1ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PV_Cannon3, 9, Cannon1Pos.X, Cannon1Pos.Y, -5)
	Cannon2ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PV_Cannon3, 9, Cannon2Pos.X, Cannon2Pos.Y, -5)
	Cannon3ID = Tools.CreateGroup(gvMission.PlayerIDBesieger, Entities.PV_Cannon3, 9, Cannon3Pos.X, Cannon3Pos.Y, -5)
	
	TerritoryPos = GetPosition("P5TerritoryCenter")
	Logic.LeaderSetTerritory(Sword1ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Sword2ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Sword3ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	
	Logic.LeaderSetTerritory(Bow1ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Bow2ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Bow3ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	
	Logic.LeaderSetTerritory(Spear1ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Spear2ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Spear3ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	
	Logic.LeaderSetTerritory(Cannon1ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Cannon2ID, TerritoryPos.X, TerritoryPos.Y, 5000)
	Logic.LeaderSetTerritory(Cannon3ID, TerritoryPos.X, TerritoryPos.Y, 5000)

end


