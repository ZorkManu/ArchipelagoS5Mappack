	--------------------------------------------------------------------------------
-- MapName: Cleycourt
--
-- Author: Adam Sprys
--
--------------------------------------------------------------------------------

-- Include function

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function InitCleycourtFunctions()
		gvMission_CleycourtHQ = Logic.GetEntityIDByName("Cleycourt_HQ")

		Mission_CleycourtBowTroopDefencePoint1()
		Mission_CleycourtBowTroopDefencePoint2()
		Mission_CleycourtPoleTroopDefencePoint1()
		
		--Mission_CleycourtPoleTroopDefencePoint2()
		--Mission_CleycourtPoleTroopDefencePoint3()
		--Mission_CleycourtBowTroopDefencePoint4()
		--Mission_CleycourtBowTroopDefencePoint4()
		
		--------------------------------------------------------------------------------
		GlobalMissionScripting.RequestTrigger( "CleycourtTroopsTakePosition" )
end		
		
function Mission_CleycourtPoleTroopDefencePoint1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint1"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop1ID, X,Y, -1)
end
function Mission_CleycourtPoleTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop2ID, X,Y, -1)
end
function Mission_CleycourtPoleTroopDefencePoint3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderPoleArm3" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyPoleTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderPoleArm3, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyPoleTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint3"))
	Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop3ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint1()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop1ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop1ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop1ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint2()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop2ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop2ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop2ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint3()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop3ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop3ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint3"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop3ID, X,Y, -1)
end
function Mission_CleycourtBowTroopDefencePoint4()
	local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBarracks"))
	-- kreiere für den Player "4", die Einheit "PU_LeaderBow2" davon "8" Stück, auf die Postion "X Y Blickrichtung"	
	gvMission_SpawnCleyBowTroop4ID = GlobalMissionScripting.CreateGroup(gvMission_CleycourtID, Entities.PU_LeaderBow2, 8, x, y, 90 )	
	-- Formation ändern
	Logic.LeaderChangeFormationType( gvMission_SpawnCleyBowTroop4ID, 1 )
	-- Move Entity to Position
	local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint4"))
	Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop4ID, X,Y, -1)
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_CleycourtTroopsTakePosition()
	return Counter.Tick2("CleycourtTroopsTakePosition", 31) -- 31 second
end
function Action_CleycourtTroopsTakePosition()
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint1"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop1ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint2"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop2ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop3ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyPoleDefencePoint3"))
		Logic.GroupAttackMove(gvMission_SpawnCleyPoleTroop3ID, X,Y, -1)		
	end
		
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint1"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop1ID, X,Y, -1)		
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint2"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop2ID, X,Y, -1)		
	end	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop3ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint3"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop3ID, X,Y, -1)		
	end
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop4ID) == true then
		local X, Y = Logic.GetEntityPosition(Logic.GetEntityIDByName("CleyBowDefencePoint4"))
		Logic.GroupAttackMove(gvMission_SpawnCleyBowTroop4ID, X,Y, -1)		
	end		
	
	if GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop1ID) == false
	--and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop2ID) == false
	--and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyPoleTroop3ID) == false
	--and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop3ID) == false
	--and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop4ID) == false	
	and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop1ID) == false
	and GlobalMissionScripting.IsEntityAlive(gvMission_SpawnCleyBowTroop2ID) == false then
		return 1
	end		
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function Condition_Cleycourt_HQ_Alive()
	return Counter.Tick2("Cleycourt_HQ_Alive", 5) -- 5 second
end
function Action_Cleycourt_HQ_Alive()
	if GlobalMissionScripting.IsEntityAlive(gvMission_CleycourtHQ) == false then
		GlobalMissionScripting.RequestTrigger( "LostGame" )
		return 1
	end
end