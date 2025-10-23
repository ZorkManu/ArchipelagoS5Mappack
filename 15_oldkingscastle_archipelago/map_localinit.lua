
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------

	-- Titlekey for NPC: briefingNPC[x].title
	-- Text key for NPC: briefingNPC[x].text
	
InitMapNPCs = function()

	local NPCNames		= {}
	NPCNames[1]			= "NPC_Miner1"		-- in front of clay mine; no sulfur here
	NPCNames[2]			= "NPC_Tower"		-- serf in front of kerberos entrance; tell about towers

	CreateNPCsBriefings(NPCNames)
end