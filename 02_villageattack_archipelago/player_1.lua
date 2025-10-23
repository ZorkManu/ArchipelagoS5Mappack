
createPlayer1 = function()

	-- 	start  resources 									
		
	GlobalMissionScripting.GiveResouces(GetHumanPlayer(),0,0,0,0,0,0)

	local PlayerID = GetHumanPlayer()

--	Logic.SetPlayerName(GetHumanPlayer(), String.MainKey.."_Player1Name")



	-- Set technologies

	forbidAllItemTechs()

	enableTechsOutOfGDB()

end