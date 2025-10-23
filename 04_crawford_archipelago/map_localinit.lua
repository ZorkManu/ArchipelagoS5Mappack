
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------


InitMapNPCs = function()

	local NPCNames		= {}

	NPCNames[1]			= "NPC_VC"			
	NPCNames[2]			= "NPC_Hermit"		

--	NPCNames[3]			= "NPC_Forrest1"	-- near violett village
--	NPCNames[4]			= "NPC_Forrest2"	-- under robbers camp

	-- Titlekey for NPC: briefingNPC[x].title
	-- Text key for NPC: briefingNPC[x].text


	CreateNPCsBriefings(NPCNames)

end

	
