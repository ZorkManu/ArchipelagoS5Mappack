
createQuestTower2 = function()

	local quest = {}
	
	quest.AreaPos 		= 	"tower2"
	quest.AreaSize 		= 	3000	
	quest.EntityTypes 	=	{	{Entities.PB_Tower2,2}	}
	quest.Callback 		= 	establishTower2Done

	SetupEstablish(quest)

	end


destroyQuestTower2 = function()

	endQuestTower2()

	end

establishTower2Done = function()

	destroyQuestTower2()

	checkLocation("crawford_east_ballista")
	
	return true

	end
	
