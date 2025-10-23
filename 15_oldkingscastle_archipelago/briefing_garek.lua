createBriefingGarek = function()


	-- heal and set Dario to Garek
		--local DarioID = GetID("Dario")
		--local DarioHealth = Logic.GetEntityMaxHealth(DarioID)
    
		--SetHealth("Dario", DarioHealth)
		--SetPosition("Dario", GetPosition("AI1_Attack_Castle"), "Dario")

		--Move("Dario", "Garek", 500)

		Logic.SetDiplomacyState( 1, 3, Diplomacy.Friendly )


	--briefing

		briefingGarek					= 	{}	

		briefingGarek.finished 			= briefingGarekFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.Key("briefingGarek[1].title")
		briefingGarek[page].text			=	String.Key("briefingGarek[1].text")
		briefingGarek[page].position 		= 	GetPosition("Garek")
		briefingGarek[page].dialogCamera 	= 	true

	--	page 2
	
		page = page +1
	
		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.GenericKey("Dario")
		briefingGarek[page].text			=	String.Key("briefingGarek[2].text")
		briefingGarek[page].position 		= 	GetPosition("DarioTarget")
		briefingGarek[page].dialogCamera 	= 	true

	--	page 3
	
		page = page +1
	
		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.Key("briefingGarek[1].title")
		briefingGarek[page].text			=	String.Key("briefingGarek[3].text")
		briefingGarek[page].position 		= 	GetPosition("Garek")
		briefingGarek[page].dialogCamera 	= 	true

	--	page 4
	
		page = page +1
	
		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.Key("briefingGarek[1].title")
		briefingGarek[page].text			=	String.Key("briefingGarek[4].text")
		briefingGarek[page].position 		= 	GetPosition("OldKingsCastle")

	--	page 5

		page = page +1
	
		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.Key("briefingGarek[1].title")
		briefingGarek[page].text			=	String.Key("briefingGarek[5].text")
		briefingGarek[page].position 		= 	GetPosition("Gift7")	
		briefingGarek[page].explore			=	2500
		briefingGarek[page].marker			=	ANIMATED_MARKER
                                        	
		briefingGarek[page].quest			=	{}
		briefingGarek[page].quest.id		=	1
		briefingGarek[page].quest.type		=	MAINQUEST_OPEN
		briefingGarek[page].quest.title		=	String.MainKey.."briefingGarek[5].quest.title"
		briefingGarek[page].quest.text		=	String.MainKey.."briefingGarek[5].quest.text"
                                        	
		rescueVillagePage 					= 	briefingGarek[page]
	
	--	page 6

		page = page + 1

		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.GenericKey("MissionObjectives")
		briefingGarek[page].text			=	String.Key("briefingGarek[6].text")
		briefingGarek[page].position 		= 	GetPosition("DarioTarget")
		briefingGarek[page].dialogCamera 	= 	true

	--	page 7

		page = page + 1

		briefingGarek[page] 				= 	{}
		briefingGarek[page].title			= 	String.Key("briefingGarek[1].title")
		briefingGarek[page].text			=	String.Key("briefingSommer[5].text")
		briefingGarek[page].position 		= 	GetPosition("Garek")
		briefingGarek[page].dialogCamera 	= 	true


		
	--	go!
	
		StartBriefing(briefingGarek)
	
	end


briefingGarekFinished = function()

	--	check if briefing is active
	if IsBriefingActive() ~= true then
		createBriefingGiveArmor()		
	else
		MapBriefing_Started = StartJob("DelayBriefing")
	end

end
	

----


createBriefingGiveArmor = function()

	-- create new Dario

		--local x, y = Logic.GetEntityPosition(Logic.GetEntityIDByName("Dario"))
		--local rotation = Logic.GetEntityOrientation("Dario")
        --DestroyEntity("Dario") 

		--local entityId 	= Logic.CreateEntity(Entities.PU_Hero1c, x, y, 180, 1)		
		--Logic.SetEntityName(entityId, "Dario")		
		--Logic.RotateEntity(entityID, rotation)

	--

		briefingGiveArmor					= 	{}	

		briefingGiveArmor.finished 			= BriefingGiveArmor
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingGiveArmor[page] 				= 	{}
		briefingGiveArmor[page].title			= 	String.GenericKey("NewEquipment")
		briefingGiveArmor[page].text			=	String.GenericKey("DarioNewArmor")
		briefingGiveArmor[page].position 		= 	GetPosition("Dario")
		briefingGiveArmor[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingGiveArmor)

end


BriefingGiveArmor = function()

	DisableNpcMarker("Garek")
	InitNPC("Garek")

	-- Spawn troops and send to player
	Move("AriFriendsLeader3", "Dario", 1000)

	Logic.SetDiplomacyState( 1, 3, Diplomacy.Hostile )

end
	


	
	----------------------------------------------------------------
	Condition_DelayBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefing = function()                                  
	----------------------------------------------------------------

		createBriefingGiveArmor()		
		EndJob(MapBriefing_Started)
	end

