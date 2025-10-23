BISHOP_TRIBUTE_ID = -1


createQuestBishop = function()

	questBishop = {}
	
	questBishop.talked = false
	questBishop.tributePaid = false
	
	InitNPCLookAt("bishop")

	end





destroyQuestBishop = function()

	questBishop.talked = true
	ResolveBriefing(briefingDestroyKerberos[PageBishop])

	DisableNpcMarker("bishop")

	local job = {}
	
	job.Tribute = uniqueTributeCounter

	BISHOP_TRIBUTE_ID = job.Tribute
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Bishop1", 
						ResourceType.Gold, 
						2000 )

--	job.Resources 	= { gold = 200 }

	job.Callback 	= TributePaidBishop

	SetupTributePaid(job)

	end






TributePaidBishop = function()

	questBishop.tributePaid = true
	BISHOP_TRIBUTE_ID = -1


	ResolveBriefing(briefingBishopDialog[PageBishopQuest])

	MapLocal_CameraPositionBackup()
	createBriefingBishopTributePaid()

	checkLocation("crawford_open_gate")


	return true
	
end
	
