createQuestBuildUni = function()

	local Quest = {}
	Quest.AreaPos		=	"CheckUniversity"
	Quest.AreaSize		=	1500

	Quest.EntityTypes	= 	{	{	Entities.PB_University1,	1	}	}

	Quest.Callback		=	end6thQuest
	
	SetupEstablish(Quest)
end