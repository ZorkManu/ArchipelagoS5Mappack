
createQuest2ndVillage = function()



-- create tribute
	local job = {}
	
	job.Tribute = 020

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."Archer_Tribute1", 
						ResourceType.Gold, 
						500 )

	job.Ralleypoint	= getLeadingHero()
	job.Spawn 		=	{ {	Pos 		= "SpawnArchers", 
							LeaderType 	= Entities.PU_LeaderBow1, 
							Soldiers 	= 4
						}
					}

	job.Callback 	= Tribute2ndVillagePaid

	SetupTributePaid(job)

end




---
Tribute2ndVillagePaid = function()

	end3rdSubQuest()

	return true

end

