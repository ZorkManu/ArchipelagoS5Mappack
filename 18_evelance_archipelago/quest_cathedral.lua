createQuestCathedral = function()

	local Quest = {}
	
	Quest.AreaPos = "CathedralPos"
	Quest.AreaSize = 6400
	Quest.EntityTypes = { {Entities.PB_Monastery3, 1 } }
	
	Quest.Callback = CathedralBuild

	SetupEstablish(Quest)

end

CathedralBuild = function()

	-- Get position
	local PosX,PosY = Tools.GetPosition("CathedralPos")

	-- Change player id of cathedral
	local Number, ID = Logic.GetPlayerEntitiesInArea(gvMission.PlayerID, Entities.PB_Monastery3, PosX, PosY, 6400, 1)
	
	-- Change mine
	ChangePlayer(ID, 6)
	
	SpokenMessage(String.MainKey.."Message_CathedralBuilt")

	end2ndQuest()

end