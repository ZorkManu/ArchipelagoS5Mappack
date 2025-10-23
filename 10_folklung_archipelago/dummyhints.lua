--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- TNPCs that give hints to the player
-- Included by CM01_10_Folklung.lua for Milestone
--------------------------------------------------------------------------------------------------------------------




--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function DUMMY_Init()
	gvDUMMY_NPC1		= Logic.GetEntityIDByName("swamp_npc1")		-- send North; Hint ice
	gvDUMMY_NPC2		= Logic.GetEntityIDByName("swamp_npc2")		-- send West; Mountain Path
	
	gvDUMMY_NPC3		= Logic.GetEntityIDByName("Town_NPC1")		-- Tell of great castle in Mountains Follow way
	gvDUMMY_NPC4		= Logic.GetEntityIDByName("Town_NPC2")		-- Tell of great castle in Mountains Follow way
	gvDUMMY_NPC5		= Logic.GetEntityIDByName("Town_NPC3")		-- Tell of great castle in Mountains South
	
	gvDUMMY_NPC1_Seen	= -1
	gvDUMMY_NPC2_Seen	= -1
	gvDUMMY_NPC3_Seen	= -1
	gvDUMMY_NPC4_Seen	= -1
	gvDUMMY_NPC5_Seen	= -1
	
	gvDUMMY_NPC1_speak	= "You met a hermit: @cr 'In Winter times when the swamp is frozen, I sometimes visit my brother who lives in Folklung in North.'"
	gvDUMMY_NPC2_speak	= "You met a hermit: @cr 'YOu look for the Folklung castle? It's on a mountain west from here. Follow the path to reach it.'"
	
	gvDUMMY_NPC3_speak	= "You met a villager: @cr 'Our castle lies west in the mountains. Follow this path here.'"
	gvDUMMY_NPC4_speak	= "You met a villager: @cr 'I heard there's a bombing guy at our castle. Follw the path to West. You'll find it in the mountains.'"
	gvDUMMY_NPC5_speak	= "You met a villager: @cr 'Oh, you look for the castle? Follow this path to South-West. There's a way up to the mountains. Follow the guides." 

end

function DUMMY_CheckNPCs()

	-- reset Status of NPCs to get hints later again
	if math.mod(Logic.GetTime(), 900 ) == 0 then
		gvDUMMY_NPC1_Seen	= -1
		gvDUMMY_NPC2_Seen	= -1
		gvDUMMY_NPC3_Seen	= -1
		gvDUMMY_NPC4_Seen	= -1
		gvDUMMY_NPC5_Seen	= -1
	end


	-- SwampNPC 1
	if gvDUMMY_NPC1_Seen < 1 then
		local Target_NPC = gvDUMMY_NPC1
		
		if Logic.IsMapPositionExplored(gvMission_PlayerID, Logic.GetEntityPosition(Target_NPC)) == 1 then
			do
				local TargetX, TargetY = Logic.EntityGetPos(Target_NPC)
				if Logic.IsPlayerEntityInArea(gvMission_PlayerID,TargetX, TargetY,1200) == 1 then
        	
					-- Set camera and explore
					Camera.ScrollGameTimeSynced (TargetX, TargetY)
					DUMMY_ExploreArea(TargetX+1, TargetY+1, 20)
					GUI.AddNote(gvDUMMY_NPC1_speak)
					gvDUMMY_NPC1_Seen = 1		
				end
			end
		end
	end

	-- SwampNPC 2
	if gvDUMMY_NPC2_Seen < 1 then
		local Target_NPC = gvDUMMY_NPC2
		
		if Logic.IsMapPositionExplored(gvMission_PlayerID, Logic.GetEntityPosition(Target_NPC)) == 1 then
			do
				local TargetX, TargetY = Logic.EntityGetPos(Target_NPC)
				if Logic.IsPlayerEntityInArea(gvMission_PlayerID,TargetX, TargetY,1200) == 1 then
        	
					-- Set camera and explore
					Camera.ScrollGameTimeSynced (TargetX, TargetY)
					DUMMY_ExploreArea(TargetX+1, TargetY+1, 20)
					GUI.AddNote(gvDUMMY_NPC2_speak)
					gvDUMMY_NPC2_Seen = 1		
				end
			end
		end
	end

	-- Village NPC 1
	if gvDUMMY_NPC3_Seen < 1 then
		local Target_NPC = gvDUMMY_NPC3
		
		if Logic.IsMapPositionExplored(gvMission_PlayerID, Logic.GetEntityPosition(Target_NPC)) == 1 then
			do
				local TargetX, TargetY = Logic.EntityGetPos(Target_NPC)
				if Logic.IsPlayerEntityInArea(gvMission_PlayerID,TargetX, TargetY,1200) == 1 then
        	
					-- Set camera and explore
					Camera.ScrollGameTimeSynced (TargetX, TargetY)
					DUMMY_ExploreArea(TargetX+1, TargetY+1, 20)
					GUI.AddNote(gvDUMMY_NPC3_speak)
					gvDUMMY_NPC3_Seen = 1		
				end
			end
		end
	end

	-- Village NPC 2
	if gvDUMMY_NPC4_Seen < 1 then
		local Target_NPC = gvDUMMY_NPC4
		
		if Logic.IsMapPositionExplored(gvMission_PlayerID, Logic.GetEntityPosition(Target_NPC)) == 1 then
			do
				local TargetX, TargetY = Logic.EntityGetPos(Target_NPC)
				if Logic.IsPlayerEntityInArea(gvMission_PlayerID,TargetX, TargetY,1200) == 1 then
        	
					-- Set camera and explore
					Camera.ScrollGameTimeSynced (TargetX, TargetY)
					DUMMY_ExploreArea(TargetX+1, TargetY+1, 20)
					GUI.AddNote(gvDUMMY_NPC4_speak)
					gvDUMMY_NPC4_Seen = 1		
				end
			end
		end
	end

	-- Village NPC 3
	if gvDUMMY_NPC5_Seen < 1 then
		local Target_NPC = gvDUMMY_NPC5
		
		if Logic.IsMapPositionExplored(gvMission_PlayerID, Logic.GetEntityPosition(Target_NPC)) == 1 then
			do
				local TargetX, TargetY = Logic.EntityGetPos(Target_NPC)
				if Logic.IsPlayerEntityInArea(gvMission_PlayerID,TargetX, TargetY,1200) == 1 then
        	
					-- Set camera and explore
					Camera.ScrollGameTimeSynced (TargetX, TargetY)
					DUMMY_ExploreArea(TargetX+1, TargetY+1, 20)
					GUI.AddNote(gvDUMMY_NPC5_speak)
					gvDUMMY_NPC5_Seen = 1		
				end
			end
		end
	end

end


	

-- Aufdecken
function DUMMY_ExploreArea(_x, _y, _Range)
	local ViewCenter = Logic.CreateEntity(Entities.XD_ScriptEntity, _x, _y, 0, gvMission_PlayerID)
	Logic.SetEntityExplorationRange(ViewCenter, _Range)
end

--------------------------------------------------------------------------------------------------------------------


