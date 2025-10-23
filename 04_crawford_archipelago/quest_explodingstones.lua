
--TF: still needed? Is never started!

createQuestExplodingStones = function()

	local quest = {}
	
	quest.EntityTypes =	{	{Entities.PB_Alchemist1, 1}	}

	quest.Callback = ConstructAlchemistDone

	end




	
destroyQuestExplodingStones = function()	

	createBriefingExplodingStones()

	end
	
	
	
	
	
ConstructAlchemistDone = function()

	StartJob("QuestExplodingStones")

	end
	
	
	
	
Control_QuestExplodingStones = function()

	if BriefingIsActive() == false then
	
		return true
		
		end
		
	return false
	
	end
	
Action_QuestExplodingStones = function()

	destroyQuestExplodingStones()		

	return true
	
	end	
