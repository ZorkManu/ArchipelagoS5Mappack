createQuestBuildMines = function()

	-- For both right mines	
	SetupMineQuest("LeosSulfurPits1",OneRightSideBuild)
	SetupMineQuest("LeosSulfurPits1",OneRightSideBuild)
	SetupMineQuest("LeosSulfurPits2",OneLeftSideBuild)
	SetupMineQuest("LeosSulfurPits2",OneLeftSideBuild)

	MinesBuild = 0
end




SetupMineQuest = function(_Where, _Callback)

	local Quest 		= {}
	Quest.AreaPos 		= _Where
	Quest.AreaSize 		= 4000
	Quest.EntityTypes 	= { { Entities.PB_SulfurMine1, 1 } }
	
	Quest.Callback 		= _Callback

	SetupEstablish(Quest)
end







OneLeftSideBuild = function()

	-- Is second right mine
	if FirstLeftMine ~= nil then
	
		-- disable marker
		ResolveBriefing(leftMines)
		
	else
		
		FirstLeftMine = true
		
	end

	MineBuild("LeosSulfurPits2")
end





OneRightSideBuild = function()

	-- Is second right mine
	if FirstRightMine ~= nil then
	
		-- disable marker
		ResolveBriefing(rightMines)
		
	else
		
		FirstRightMine = true
		
	end

	MineBuild("LeosSulfurPits1")
end





MineBuild = function(_Near)

	-- Get position
	local PosX,PosY = Tools.GetPosition(_Near)

	-- Get mine and change player id
	local Number, ID = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_SulfurMine1, PosX, PosY, 4000, 1)
	
	-- Change mine
	ChangePlayer(ID, 3)

	-- Increase mines count
	MinesBuild = MinesBuild + 1
	
	-- all build
	if MinesBuild == 4 then

		SpokenMessage(String.MainKey.."Message_MinesBuilt")

		-- enable Leonardo-Marker to talk to him again.

		ResolveBriefing(BuildMinesQuest)
		EnableNpcMarker("leonardo")

		--		end5thQuest()										-- called when talked to Leonardo once more
	end

end