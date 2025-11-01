createBriefingNeutralKerberos = function()

		briefingNeutralKerberos 					= 	{}	
                              
		CreateEntity(7, Entities.CU_BlackKnight, GetPosition("KerberosSpawnPos"), "Kerberos")
		
		Move("Kerberos", "KerberosMoveTo", 500)		


	-- set heroes in position		

		SetHeroInPosition("Dario")
		SetHeroInPosition("Ari")
		SetHeroInPosition("Pilgrim")
		SetHeroInPosition("Erec")
		SetHeroInPosition("Helias")
		SetHeroInPosition("Salim")


		LookAt(GetID("Kerberos"), GetID("Helias"))		
		LookAt(GetID("Ari"), GetID("Pilgrim"))		
		LookAt(GetID("Pilgrim"), GetID("Ari"))		
		


	-- briefing
	                                            	
		briefingNeutralKerberos.finished 			=	briefingNeutralKerberosFinished
	                                            	
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Kerberos")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[1].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition("KerberosMoveTo")
		briefingNeutralKerberos[page].explore		=	1000
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 2
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Helias")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[2].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition(getLeadingHero())
		briefingNeutralKerberos[page].explore		=	1000
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 3
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Kerberos")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[3].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition("KerberosMoveTo")
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 4
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Helias")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[4].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition(getLeadingHero())
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 5
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Kerberos")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[5].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition("KerberosMoveTo")
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 6
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Kerberos")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[6].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition("Exit")
		briefingNeutralKerberos[page].explore		=	2000
		briefingNeutralKerberos[page].marker		=	ANIMATED_MARKER
		
		briefingNeutralKerberos[page].quest			=	{}
		briefingNeutralKerberos[page].quest.id		=	4
		briefingNeutralKerberos[page].quest.type	=	MAINQUEST_OPEN
		briefingNeutralKerberos[page].quest.title	=	String.MainKey.."briefingNeutralKerberos[6].quest.title"
		briefingNeutralKerberos[page].quest.text	=	String.MainKey.."briefingNeutralKerberos[6].quest.text"

		reachExitPage = briefingNeutralKerberos[page]

	--	page 7
	                                            	
		page = page +1                          	
	                                            	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Helias")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[7].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition(getLeadingHero())
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 8
	
		page = page +1
	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("MissionObjectives")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[8].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition(getLeadingHero())
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	page 
	
		page = page +1
	
		briefingNeutralKerberos[page] 				= 	{}
		briefingNeutralKerberos[page].title			= 	String.GenericKey("Ari")
		briefingNeutralKerberos[page].text			=	String.Key("briefingNeutralKerberos[9].text")
		briefingNeutralKerberos[page].position 		= 	GetPosition("Ari")
		briefingNeutralKerberos[page].dialogCamera 	= 	true

	--	go!
	
		StartBriefing(briefingNeutralKerberos)


end

briefingNeutralKerberosFinished = function()

	ResolveBriefing(briefingNeutralKerberos[1])

	StartBinkVideo("OldKingsCastle")

end



SetHeroInPosition = function(_hero)

	local ID = GetID(_hero)
	--local Health = Logic.GetEntityMaxHealth(ID)
    
	--SetHealth(_hero, Health)
	--SetPosition(_hero, GetPosition("GiveUp".._hero), _hero)
	--LookAt(GetID(_hero), GetID("KerberosMoveTo"))		

end