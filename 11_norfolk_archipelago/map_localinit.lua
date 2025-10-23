--------------------------------------------------------------------------------
--
-- 	Functions usable and customizable for all maps
--	function names shall start with "MapLocal_"
--
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
--
--	Set number (NPC.number)and script_names (NPC.name[ ]) of all tip-giving NPCs
--	Author: T. Friedman
-------------------------------------------------------------------------------------------------------------------------

	NPC 				= {}
	NPC.number			= 1
	NPC.name			= {}

	NPC.name[1]			= "Fugitive2"
	

-- Global variables

	CameraPositionBackup_x 	= 0
	CameraPositionBackup_y	= 0




----------------------------------------------------------------------------------------
-- Start Countdown
----------------------------------------------------------------------------------------
function MapLocal_StartCountDown(_time)

	GUIAction_ToggleStopWatch(_time, 1)

end


----------------------------------------------------------------------------------------
-- Stop Countdown
----------------------------------------------------------------------------------------
function MapLocal_StopCountDown(_time)

	GUIAction_ToggleStopWatch(_time, 0)

end


----------------------------------------------------------------------------------------
-- Backup Camera position
----------------------------------------------------------------------------------------
function MapLocal_CameraPositionBackup()

	CameraPositionBackup_x, CameraPositionBackup_y = Camera.ScrollGetLookAt()	

end


----------------------------------------------------------------------------------------
-- Restore Camera position
----------------------------------------------------------------------------------------
function MapLocal_CameraPositionRestore()

	Camera.ScrollSetLookAt(CameraPositionBackup_x, CameraPositionBackup_y)

end

----------------------------------------------------------------------------------------
-- Create NPCs; called from local file "briefing_NPCs_Tips.lua"
----------------------------------------------------------------------------------------

function MapLocal_CreateNPCs()

	NPC.Seen 			= {}
	createBriefingNPC	= {}	
	briefingNPC			= {}	

	for npcCreate = 1, NPC.number, 1 do 
	
		EnableNpcMarker(NPC.name[npcCreate])   
		NPC.Seen[npcCreate]		= 0
	
		    
		briefingNPC[npcCreate] = {}	
	
		local page = 0
	    
		--	page
		
			page = page +1
		
			briefingNPC[npcCreate][page] 			= 	{}
			briefingNPC[npcCreate][page].title		= 	XGUIEng.GetStringTableText(String.MainKey.."briefingNPC["..npcCreate.."].title" )
			briefingNPC[npcCreate][page].text		=	XGUIEng.GetStringTableText(String.MainKey.."briefingNPC["..npcCreate.."].text" )
			briefingNPC[npcCreate][page].position	=	GetPosition(NPC.name[npcCreate] )
	--		briefingNPC[npcCreate][page].explore	=	200
	
	end
end



----------------------------------------------------------------------------------------
-- Check for NPCs; set in local file "briefing_NPCs_Tips.lua"
----------------------------------------------------------------------------------------

function MapLocal_npcCheck(_heroId,_npcId)

	for npcCheck = 1, NPC.number, 1 do 
		
		if IsAlive(NPC.name[npcCheck]) then
	
			if NPC.Seen[npcCheck] == 0 and _npcId == GetEntityId(NPC.name[npcCheck]) then
			
				if IsNear(_heroId,_npcId,BRIEFING_TALK_DISTANCE) then
				
				--	go!
					StartBriefing(briefingNPC[npcCheck])

					NPC.Seen[npcCheck] = 1
					DisableNpcMarker(NPC.name[npcCheck])
					
				end
					
			end
		end
	
	end
end



----------------------------------------------------------------------------------------
-- Forbid all Technologies
----------------------------------------------------------------------------------------

function ForbidAllBasicTechnologies(_PlayerID)


-- Technologies
	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Construction   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_GearWheel      	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_ChainBlock     	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Architecture   	,0 )

	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alchemy        	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Alloying       	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Metallurgy     	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Chemistry      	,0 )
                             
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Literacy       	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Trading        	,0 )	
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Printing       	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Library        	,0 )
                             
                             
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Mercenaries    	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_StandingArmy   	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Tactics        	,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Strategies     	,0 )
                             
	Logic.SetTechnologyState(_PlayerID,Technologies.GT_Beautification 	,0 )


-- Buildings
	
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Alchemist        	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Archery          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Bank             	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Barracks         	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification01 	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification02 	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification03 	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Beautification04 	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Blacksmith       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Brickworks       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Claymine         	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Farm             	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Foundry          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Headquarter      	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Ironmine         	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Market           	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Monastery        	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Outpost          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_PowerPlant       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Residence        	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Sawmill          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Stables          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_StoneMason       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Stonemine        	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Sulfurmine       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Tower            	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_University       	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Village          	,0 )           
	Logic.SetTechnologyState(_PlayerID,Technologies.B_Weathermachine   	,0 )           
                                                                                       
-- Upgrades 1                                                                   

	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Alchemist       ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Archery         ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Bank            ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Barracks        ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Blacksmith      ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Brickworks      ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Claymine        ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Farm            ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Foundry         ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Headquarter     ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Ironmine        ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Market          ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Monastery       ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Residence       ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Sawmill         ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Stables         ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_StoneMason      ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Stonemine       ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Sulfurmine      ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Tower           ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_University      ,0 )  
	Logic.SetTechnologyState(_PlayerID,Technologies.UP1_Village         ,0 )

-- Upgrades 2

	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Blacksmith      ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Claymine        ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Farm            ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Headquarter     ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Ironmine        ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Monastery       ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Residence       ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Stonemine       ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Sulfurmine      ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Tower           ,0 )
	Logic.SetTechnologyState(_PlayerID,Technologies.UP2_Village         ,0 )


end





