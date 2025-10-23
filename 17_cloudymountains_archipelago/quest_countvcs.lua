createQuestCountVCs = function()

	-- Build up job
	StartJob("CountVCs")

end

Condition_CountVCs = function()

	local EntityTable ={}
	local UpgradeTypeTable = {}	
	
	UpgradeTypeTable = {Logic.GetBuildingTypesInUpgradeCategory(UpgradeCategories.VillageCenter)}
	
-- Anzahl von Upgrades:
	local AmountOfUpgradeTypes = UpgradeTypeTable[1]
	local villagecount = 0

	for i=1,AmountOfUpgradeTypes,1 
	do
		-- Get ID of upgradecategory of player
		local TempTable = {Logic.GetPlayerEntities( 1, UpgradeTypeTable[i+1], 48 )	}
		local number = TempTable[1]		
		for j=1,number,1 
		do
			villagecount = villagecount + 1
		end		
		
	end

	return villagecount >= 2 and briefingIsActive ~= true

end

Action_CountVCs = function()

	Report("2 VillageCenter!")
	-- Quest done
	end2ndQuest()
	
	return true
end





