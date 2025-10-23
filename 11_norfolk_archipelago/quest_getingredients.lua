createQuestGetIngredients = function()

	-- Create quests
	local Quest = {}
	Quest.Heroes		=	true
	Quest.TargetName	=	"Ingredient"
	Quest.Distance		=	500
	
	Quest.Callback 		=	end3rdSubQuest
	
	SetupExpedition(Quest)
end
