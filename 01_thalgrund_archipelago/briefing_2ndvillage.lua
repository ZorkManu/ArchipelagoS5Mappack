
createBriefing2ndVillage = function()

	briefing2ndVillage = 	{}	

	briefing2ndVillage.finished = Briefing2ndVillage

	local page = 0

	--	page
	
		page = page +1
	
		briefing2ndVillage[page] 			= 	{}
		briefing2ndVillage[page].title		= 	String.Key("briefing2ndVillage[1].title")
		briefing2ndVillage[page].text		=	String.Key("briefing2ndVillage[1].text")
		briefing2ndVillage[page].position	=	GetPosition("Mayor_Archers")
		briefing2ndVillage[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefing2ndVillage[page] 			= 	{}
		briefing2ndVillage[page].title		= 	String.Key("briefing2ndVillage[1].title")
		briefing2ndVillage[page].text		=	String.Key("briefing2ndVillage[2].text")
		briefing2ndVillage[page].position	=	GetPosition(getLeadingHero())
		briefing2ndVillage[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefing2ndVillage[page] 			= 	{}
		briefing2ndVillage[page].title		= 	String.Key("briefing2ndVillage[1].title")
		briefing2ndVillage[page].text		=	String.Key("briefing2ndVillage[3].text")
		briefing2ndVillage[page].position	=	GetPosition("SpawnArchers")
		briefing2ndVillage[page].explore	=	1000

	-- Go!
		StartBriefing(briefing2ndVillage)

	end
	
	
	
Briefing2ndVillage = function()

--TF give soldiers immediately

	--	set up

		armyDario					= {}
		armyDario.player 			= 1
		armyDario.id				= 2
		armyDario.strength			= 1
		armyDario.position			= GetPosition("SpawnArchers")
		armyDario.rodeLength		= 0
		
--		SetupArmy(armyDario)


	-- create
		local troopDescription = {
			
			minNumberOfSoldiers	= 0,
			maxNumberOfSoldiers = 4,
			experiencePoints 	= LOW_EXPERIENCE,
		}			
		
		troopDescription.leaderType = Entities.PU_LeaderBow1
		local support1 = CreateTroop(armyDario,troopDescription)  

		checkLocation("thalgrund_bow_mayor")

		Move(support1,getLeadingHero())
	
end
	