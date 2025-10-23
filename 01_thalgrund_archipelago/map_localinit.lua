-------------------------------------------------------------------------------------------------------------------------
--
--	Set script_names (NPCNames[ ]) of all tip-giving NPCs
--
-- 	Titlekey for NPC: briefingNPC[x].title
-- 	Text key for NPC: briefingNPC[x].text
--
-- to let them move and vanish set script entity labeled "name" plus "_target"
--
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------

	
InitMapNPCs = function()

	local NPCNames		= {}

	NPCNames[1]			= "NPC_Village2_3"	-- at stables
	NPCNames[2]			= "NPC_Village2_1"	-- in front of barracks
	NPCNames[3]			= "NPC_Forrest1"	-- near violett village
	NPCNames[4]			= "NPC_Forrest2"	-- under robbers camp
--	NPCNames[5]			= "NPC_Waterfall1"	-- under robbers camp > Explore Waterfall
--	NPCNames[6]			= "NPC_River1"		-- At river in east	-> give money
	
	CreateNPCsBriefings(NPCNames)

end

