
createQuestHireTroops = function()

	local Job = {}
	
	Job.Tribute = 001

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops1", 
						ResourceType.Iron, 
						300 )
	
	Job.Ralleypoint	= getLeadingHero()
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword1, 
							Soldiers 	= 4
						}
					}

	Job.Callback 	= TributePaid

	SetupTributePaid(Job)
	
end



--------------------------------------------------------------------	
TributePaid = function()
	
	-- TFToDo Cutscene / briefing rein

	end1stSubQuest()
	

	-- TF>
	local Job = {}
	
	Job.Tribute = 002

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops2", 
						ResourceType.Iron, 
						700 )
	
	Job.Ralleypoint	= getLeadingHero()
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword2, 
							Soldiers 	= 4
						}
					}

	Job.Callback 	= TributePaid2

	SetupTributePaid(Job)
	--<
	
	return true
	
end


--------------------------------------------------------------------	
TributePaid2 = function()
	
	-- TF>
	local Job = {}
	
	Job.Tribute = 003

	Logic.AddTribute(	GetHumanPlayer(), 
						Job.Tribute,
						0,
						0,
						String.MainKey.."Hire_Troops3", 
						ResourceType.Iron, 
						1000 )
	
	Job.Ralleypoint	= getLeadingHero()
	Job.Spawn 		=	{ {	Pos 		= "Pl2Barracks", 
							LeaderType 	= Entities.PU_LeaderSword3, 
							Soldiers 	= 4
						}
					}

	Job.Callback 	= TributePaid3

	SetupTributePaid(Job)
	--<
	
	return true
	
end	
	

--------------------------------------------------------------------	
TributePaid3 = function()

	return true

end	
