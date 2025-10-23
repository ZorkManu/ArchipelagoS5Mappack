
-- Rebuild Castle by tribute

createQuestRebuildCastle = function()

	local Job1 = {}
	
	if 	uniqueTributeCounter == nil then 
		uniqueTributeCounter = 1
	end

	Job1.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."tribute_CastleRebuild", 
						ResourceType.Gold, 
						5000,
						ResourceType.Stone, 
						1000)

	Job1.Callback 	= TributeRebuildCastlePaid

	SetupTributePaid(Job1)

end




TributeRebuildCastlePaid = function()

	-- Exchange Castle

		local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("OldKingsCastle"))
        DestroyEntity("OldKingsCastle") 

		local entityId 	= Logic.CreateEntity(Entities.CB_OldKingsCastle, x, y, 0, 4)		
		Logic.SetEntityName(entityId, "OldKingsCastle")		

		checkLocation("old_kings_castle_castle_tribute")
	
		--	briefing	
		if IsBriefingActive() ~= true then
	
		    StartCutscene("Castle")
			
			return 1
		else
			CastleCutscene_Started = StartJob("DelayCutsceneCastle")
		end
	
end


	----------------------------------------------------------------
	Condition_DelayCutsceneCastle = function()                               
	----------------------------------------------------------------
			                                                                   
		if IsBriefingActive() ~= true then
				return true
			end
			return false
		end                                                             
		                                                                    
	----------------------------------------------------------------
	Action_DelayCutsceneCastle = function()                                  
	----------------------------------------------------------------
		                                                            
	    StartCutscene("Castle")
		EndJob(CastleCutscene_Started)
	end

