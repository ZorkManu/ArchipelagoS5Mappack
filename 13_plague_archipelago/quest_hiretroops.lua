   
-- buy soldiers at Ari's robber man   
   
createQuestHireTroops = function()

	-------------------------------------------------------------------------------------------------< Dario

	local job = {}
	
	job.Tribute = tributeCounter
	
	tributeCounter = tributeCounter+1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Robber1",  
						ResourceType.Gold, 
						1000 )

	job.Callback 	= TributeBanditsPaid1

	SetupTributePaid(job)

	-------------------------------------------------------------------------------------------------< Erec

	local job = {}
	
	job.Tribute = tributeCounter
	
	tributeCounter = tributeCounter+1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Robber2",  
						ResourceType.Gold, 
						1000 )

	job.Callback 	= TributeBanditsPaid2

	SetupTributePaid(job)

	-------------------------------------------------------------------------------------------------< Salim

	local job = {}
	
	job.Tribute = tributeCounter
	
	tributeCounter = tributeCounter+1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Robber3",  
						ResourceType.Gold, 
						1000 )

	job.Callback 	= TributeBanditsPaid3

	SetupTributePaid(job)

end



TributeBanditsPaid1 = function()
	                            
	createArmySupportA()        
	                            
	if IsBriefingActive() ~= true then 
		
		createBriefingBanditsDeliverA()
	end

	checkLocation("plague_dario_archers")
	
	return true                 
	                            
	end                         



                                
TributeBanditsPaid2 = function()

	createArmySupportB()

	if IsBriefingActive() ~= true then 
		
		createBriefingBanditsDeliverB()
	end

	checkLocation("plague_erec_swords")
	
	return true
	
	end


	
TributeBanditsPaid3 = function()
	
	createArmySupportC()

	if IsBriefingActive() ~= true then 
		
		createBriefingBanditsDeliverC()
	end

	checkLocation("plague_salim_cannons")
	
	return true
	
end