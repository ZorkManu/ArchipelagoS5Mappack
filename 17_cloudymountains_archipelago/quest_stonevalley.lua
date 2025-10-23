createQuestStoneValley = function()

	-- Build up job
	StartJob("StoneValley")

end

Condition_StoneValley = function()

	local EntityTable ={}
	local PosX,PosY = Tools.GetPosition("Stonevalley_BuildPos")
	local AreaSize = 1500
	local NumberOfBeautifications = 12
	local prefix = ""
	local beautycount = 0

	for i=1,NumberOfBeautifications
	
		do
			
			if i < 10 then 
				prefix = "0"
			else
			prefix = ""
			end

			local ID = Entities["PB_Beautification"..prefix..i]
			local number = Logic.GetPlayerEntitiesInArea( 1, ID , PosX,PosY,AreaSize ,4)	
			beautycount = beautycount + number
		end

	return beautycount >= 4 and briefingIsActive ~= true

end

Action_StoneValley = function()

	Report("4 Beautifications!!")
	-- Quest done
	end1stSubQuest()
	
	return true
end

-- org:
-- createQuestStoneValley = function()
--	local Quest = {}
--	
--	Quest.AreaPos = "Stonevalley_BuildPos"
--	Quest.AreaSize = 1500
--	
--	Quest.EntityTypes = { { Entities.PB_Beautification01, 3 } }
--
--	Quest.Callback = end1stSubQuest
--	
--	SetupEstablish(Quest)
-- end



