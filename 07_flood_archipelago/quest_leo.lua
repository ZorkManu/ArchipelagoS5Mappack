
createQuestLeo = function()

	leoQuest = {}
	
	leoQuest.tributeCount = 0

	InitNPC("Leo")
	SetNPCLookAtTarget("Leo",1)
	EnableNpcMarker("Leo")

	end

destroyQuestLeo = function()

	if TalkToLeoQuestIsActive == true then
		Logic.SetQuestType(
			1, 					
			10,
			MAINQUEST_OPEN +1,
			1)
		TalkToLeoQuestIsActive = false
	end
	
	DisableNpcMarker("Leo")

	local job = {}

	if leoQuest.tributeCount == 0 then

		-- wood

		job.Tribute = uniqueTributeCounter
		
		uniqueTributeCounter = uniqueTributeCounter +1
	
		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							"CM01_07_Flood/tribute001_Leonardo_Wood", 
							ResourceType.Wood, 
							tributeAmount )
--		job.Callback 	= createBriefingTribute1paid
		
		createBriefingTribute1()

	elseif leoQuest.tributeCount == 1 then

		-- l�hm (help from merchant1)

		job.Tribute = uniqueTributeCounter
		
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							"CM01_07_Flood/tribute002_Leonardo_Clay", 
							ResourceType.Clay, 
							tributeAmount )
--		job.Callback 	= createBriefingTribute2paid

		InitNPC("merchant1")
		SetNPCLookAtTarget("merchant1",1)
		EnableNpcMarker("merchant1")
		
		createBriefingTribute2()

	elseif leoQuest.tributeCount == 2 then

		-- iron (help from merchant2)

		job.Tribute = uniqueTributeCounter
		
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							"CM01_07_Flood/tribute003_Leonardo_Iron", 
							ResourceType.Iron, 
							tributeAmount )
--		job.Callback 	= createBriefingTribute3paid

		InitNPC("merchant2")
		SetNPCLookAtTarget("merchant2",1)
		EnableNpcMarker("merchant2")
		
		createBriefingTribute3()

	elseif leoQuest.tributeCount == 3 then

		-- sulfur (help from merchant3 - has lost his key...)

		job.Tribute = uniqueTributeCounter
		
		uniqueTributeCounter = uniqueTributeCounter +1

		Logic.AddTribute(	GetHumanPlayer(), 
							job.Tribute,
							0,
							0,
							"CM01_07_Flood/tribute004_Leonardo_Sulfur", 
							ResourceType.Sulfur, 
							tributeAmount*2 )
		
		createBriefingTribute4()
		
		createQuestKey()

		end

	job.Callback 	= TributePaidLeo

	SetupTributePaid(job)

	end

TributePaidLeo = function()

	Report("tribute count = "..leoQuest.tributeCount)

	--	next tribute

		leoQuest.tributeCount = leoQuest.tributeCount +1

	--	enable the trader sequence

		if 		leoQuest.tributeCount == 1 then
	
			ResolveBriefing(briefingTribute1[page_Tribute1])
			createBriefingTribute1paid()
			checkLocation("flood_gather_wood")

			InitNPC("Leo")
			SetNPCLookAtTarget("Leo",1)
			EnableNpcMarker("Leo")
		
		elseif 	leoQuest.tributeCount == 2 then

			ResolveBriefing(briefingTribute2[page_Tribute2])
			createBriefingTribute2paid()
			checkLocation("flood_gather_clay")
			InitNPC("Leo")
			SetNPCLookAtTarget("Leo",1)
			EnableNpcMarker("Leo")

			DisableNpcMarker("merchant1")
			
		elseif 	leoQuest.tributeCount == 3 then
	
			ResolveBriefing(briefingTribute3[page_Tribute3])
			createBriefingTribute3paid()
			checkLocation("flood_gather_iron")

			InitNPC("Leo")
			SetNPCLookAtTarget("Leo",1)
			EnableNpcMarker("Leo")
			DisableNpcMarker("merchant2")
--			ReplaceEntity("WeatherTowerPos",Entities.PB_WeatherTower1)

			local TowerPos = GetPosition("WeatherTowerPos")
			DestroyEntity("WeatherTowerPos")
			CreateEntity(7,Entities.PB_WeatherTower1,TowerPos,"WeatherTowerPos")


		elseif 	leoQuest.tributeCount >= 4 then
	
			ResolveBriefing(briefingTribute4[page_Tribute4])
	
			Logic.AddWeatherElement(1, 300000, 0, 1, 10, 20)
			StartCutscene("CutsceneComplete")

			checkLocation("flood_victory")

			Victory()
			
		
			end

	return true
	
	end
	
