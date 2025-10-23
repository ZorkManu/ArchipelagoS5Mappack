
createQuestTower1 = function()

	local quest = {}
	
	quest.AreaPos 		= 	"tower1"
	quest.AreaSize 		= 	3000	
	quest.EntityTypes 	=	{	{Entities.PB_Tower2,2}	}
	quest.Callback 		= 	establishTower1Done

	SetupEstablish(quest)

	end





destroyQuestTower1 = function()

	endQuestTower1()

	end




establishTower1Done = function()

	Report("Establish done")
	
	destroyQuestTower1()

	checkLocation("crawford_west_ballista")
	
	return true

	end
	
