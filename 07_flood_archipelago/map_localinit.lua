
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------


InitMapNPCs = function()

	local NPCNames		= {}

--	NPCNames[1]			= "NPC_VC"			
--	NPCNames[2]			= "NPC_Hermit"		
--	NPCNames[3]			= "NPC_Forrest1"	-- near violett village
--	NPCNames[4]			= "NPC_Forrest2"	-- under robbers camp

	-- Titlekey for NPC: briefingNPC[x].title
	-- Text key for NPC: briefingNPC[x].text

	CreateNPCsBriefings(NPCNames)

end


--	
--	
--	----------------------------------------------------------------------------------------
--	-- Start Countdown
--	----------------------------------------------------------------------------------------
--	function MapLocal_StartCountDown(_time)
--	
--		GUIAction_ToggleStopWatch(_time, 1)
--	
--	end
--	
--	
--	----------------------------------------------------------------------------------------
--	-- Stop Countdown
--	----------------------------------------------------------------------------------------
--	function MapLocal_StopCountDown(_time)
--	
--		GUIAction_ToggleStopWatch(_time, 0)
--	
--	end
--	
--	
--	----------------------------------------------------------------------------------------
--	-- Backup Camera position
--	----------------------------------------------------------------------------------------
--	function MapLocal_CameraPositionBackup()
--	
--		CameraPositionBackup_x, CameraPositionBackup_y = Camera.ScrollGetLookAt()	
--	
--	end
--	
--	
--	----------------------------------------------------------------------------------------
--	-- Restore Camera position
--	----------------------------------------------------------------------------------------
--	function MapLocal_CameraPositionRestore()
--	
--		Camera.ScrollSetLookAt(CameraPositionBackup_x, CameraPositionBackup_y)
--	
--	end
--	
--	----------------------------------------------------------------------------------------
--	-- Create NPCs; called from local file "briefing_NPCs_Tips.lua"
--	----------------------------------------------------------------------------------------
--	
--	function MapLocal_CreateNPCs()
--	
--		NPC.Seen 			= {}
--		createBriefingNPC	= {}	
--		briefingNPC			= {}	
--	
--		for npcCreate = 1, NPC.number, 1 do 
--		
--			EnableNpcMarker(NPC.name[npcCreate])   
--			NPC.Seen[npcCreate]		= 0
--		
--			    
--			briefingNPC[npcCreate] = {}	
--		
--			local page = 0
--		    
--			--	page
--			
--				page = page +1
--			
--				briefingNPC[npcCreate][page] 			= 	{}
--				briefingNPC[npcCreate][page].title		= 	XGUIEng.GetStringTableText(String.MainKey.."briefingNPC["..npcCreate.."].title" )
--				briefingNPC[npcCreate][page].text		=	XGUIEng.GetStringTableText(String.MainKey.."briefingNPC["..npcCreate.."].text" )
--				briefingNPC[npcCreate][page].position	=	GetPosition(NPC.name[npcCreate] )
--		--		briefingNPC[npcCreate][page].explore	=	200
--				briefingNPC[npcCreate][page].dialogCamera 	= 	true
--	
--		
--		end
--	end
--	
--	
--	
--	----------------------------------------------------------------------------------------
--	-- Check for NPCs; set in local file "briefing_NPCs_Tips.lua"
--	----------------------------------------------------------------------------------------
--	
--	function MapLocal_npcCheck(_heroId,_npcId)
--	
--		for npcCheck = 1, NPC.number, 1 do 
--			
--			if IsAlive(NPC.name[npcCheck]) then
--		
--				if NPC.Seen[npcCheck] == 0 and _npcId == GetEntityId(NPC.name[npcCheck]) then
--				
--					if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
--					
--					--	go!
--						StartBriefing(briefingNPC[npcCheck])
--	
--						NPC.Seen[npcCheck] = 1
--						DisableNpcMarker(NPC.name[npcCheck])
--						
--						if IsAlive(NPC.name[npcCheck].."_target") then
--							
--							CurrentNPC 			= NPC.name[npcCheck]
--							CurrentNPCTarget 	= NPC.name[npcCheck].."_target"
--						
--							StartJob("Delay")
--						end
--						
--					end
--						
--				end
--			end
--		
--		end
--	end
--	
--	
--	
--	
--	Condition_Delay = function()
--		if IsBriefingActive() ~= true then
--			return true
--		end
--	
--		return false
--	end                                                             
--	
--	
--	Action_Delay = function()
--	
--		MoveAndVanish(CurrentNPC, CurrentNPCTarget)
--		return true
--	
--	end





