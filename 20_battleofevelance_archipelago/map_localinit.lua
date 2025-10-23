
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------

	-- Titlekey for NPC: briefingNPC[x].title
	-- Text key for NPC: briefingNPC[x].text
	
InitMapNPCs = function()

	local NPCNames		= {}
--	NPCNames[1]			= "NPC_Tendrel1"	-- in front of Tendrel at Saw mill
--	NPCNames[2]			= "NPC_Tendrel2"	-- scholar in Tendrel
--	NPCNames[3]			= "NPC_Wasteland"	-- at border to wasteland
--	NPC.name[4]			= "NPC_"			-- 
--	NPC.name[5]			= "NPC_"			-- 
--	NPC.name[6]			= "NPC_"			-- 
	
	CreateNPCsBriefings(NPCNames)

end

