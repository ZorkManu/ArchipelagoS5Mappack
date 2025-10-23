createBriefingKerberos = function(_heroId)

		briefingKerberos 					= 	{}	

		briefingKerberos.finished = BriefingKerberosfinished

		local page = 0

	--	page 1
	
		page = page +1
	
		briefingKerberos[page] 				= 	{}
		briefingKerberos[page].title		= 	String.Key("briefingGarek[1].title")
		briefingKerberos[page].text			=	String.Key("briefingKerberos[1].text")
		briefingKerberos[page].position 	= 	GetPosition("Garek")	
		briefingKerberos[page].dialogCamera = 	true
		

	--	page 2
	
		page = page +1
	
		briefingKerberos[page] 				= 	{}
		briefingKerberos[page].title		= 	String.Key("briefingGarek[1].title")
		briefingKerberos[page].text			=	String.Key("briefingKerberos[2].text")
		briefingKerberos[page].position 	= 	GetPosition("P5AttackPos")
		briefingKerberos[page].explore		=	1400
		
		kerberosAttackExplorePage			= 	briefingKerberos[2]

	--	page 3

		page = page +1
		pageKerberosSpawn = page
	
		briefingKerberos[page] 				= 	{}
		briefingKerberos[page].title		= 	String.Key("briefingGarek[1].title")
		briefingKerberos[page].text			=	String.Key("briefingKerberos[3].text")
		briefingKerberos[page].position 	= 	GetPosition("AI2_ConcentratingArea")
		briefingKerberos[page].marker		=	ANIMATED_MARKER

		Explore.Show("KerberosExplore", "AI2_ConcentratingArea", 1400)

		briefingKerberos[page].quest		=	{}
		briefingKerberos[page].quest.id		=	3
		briefingKerberos[page].quest.type	=	MAINQUEST_OPEN
		briefingKerberos[page].quest.title	=	String.MainKey.."briefingKerberos[3].quest.title"
		briefingKerberos[page].quest.text	=	String.MainKey.."briefingKerberos[3].quest.text"
		
		defeatKerberosPage					= 	briefingKerberos[3]

	--	page 4

		page = page +1
	
		briefingKerberos[page] 				= 	{}
		briefingKerberos[page].title		= 	String.GenericKey("MissionObjectives")
		briefingKerberos[page].position 	= 	{}
		briefingKerberos[page].position.X,
		briefingKerberos[page].position.Y 	=	Camera.ScrollGetLookAt()		
		briefingKerberos[page].text			=	String.Key("briefingKerberos[4].text")
		
	--	go!
	
		StartBriefing(briefingKerberos)
	
end



BriefingKerberosfinished = function()

	Explore.Hide("KerberosExplore")

end