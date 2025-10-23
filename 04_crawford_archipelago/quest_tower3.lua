
createQuestTower3 = function()

	local quest = {}
	
	quest.AreaPos 		= 	"tower3"
	quest.AreaSize 		= 	3000	
	quest.EntityTypes 	=	{	{Entities.PB_Tower2,2}	}
	quest.Callback 		= 	establishTower3Done

	SetupEstablish(quest)

	end


destroyQuestTower3 = function()

	endQuestTower3()

	end

establishTower3Done = function()

	destroyQuestTower3()

	checkLocation("crawford_north_ballista")
	
	return true

	end
	
