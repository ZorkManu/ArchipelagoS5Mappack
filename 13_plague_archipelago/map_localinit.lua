
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------


InitMapNPCs = function()

	local NPCNames		= {}

	NPCNames[1]			= "NPC_Miner1"		-- in front of stone labyrinth
	NPCNames[2]			= "NPC_Graveyard"	-- Merchant at graveyard in infected village
	NPCNames[3]			= "NPC_CliffJumper"	-- At Cliff; tells about VC on island
--	NPCNames[4]			= "NPC_Forrest2"	-- under robbers camp
	
	-- Titlekey for NPC: briefingNPC[x].title
	-- Text key for NPC: briefingNPC[x].text

	CreateNPCsBriefings(NPCNames)

end