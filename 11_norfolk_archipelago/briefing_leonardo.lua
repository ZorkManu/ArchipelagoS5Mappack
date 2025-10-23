createBriefingLeonardo = function()

		briefingLeonardo					= 	{}	
 		briefingLeonardo.finished 			=	briefingLeonardoFinished
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"I'm so thankfull to see you again."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo1.text")
		briefingLeonardo[page].position 	= 	GetPosition("Leonardo")

	--	page 2

		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"Kerberos captured me and i have to show him how he can change the weather."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo2.text")

--		briefingLeonardo[page].position 	= 	GetPosition("P2Defense2")
--		briefingLeonardo[page].noScrolling	=	true
--		briefingLeonardo[page].marker		=	ANIMATED_MARKER

		KerberosPage						=	briefingLeonardo[2]

	--	page 3
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"With this ability he will froze the lake and be able to pass the defense walls of Norfolk."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo3.text")

		briefingLeonardo[page].position 	= 	GetPosition("KerberosSea")
		briefingLeonardo[page].explore		=	2000
		
		KerberosSeaPage						=	briefingLeonardo[3]

	--	page 4
	
		page = page +1
	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"The other problem is on the left side of Norfolk, the Barbarians."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo4.text")

--		briefingLeonardo[page].position 	= 	GetPosition("P4DefensePos")
--		briefingLeonardo[page].noScrolling	=	true
--		briefingLeonardo[page].marker		=	ANIMATED_MARKER

		BarbariansPage						=	briefingLeonardo[4]

	--	page 5
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"They will also pass the Towers and with such an attacking force, Norfolk will fall."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo5.text")

		briefingLeonardo[page].position 	= 	GetPosition("BarbarianSea")
		briefingLeonardo[page].explore		=	2000
		
		BarbariansSeaPage					=	briefingLeonardo[5]

	--	page 6
	
		page = page +1
	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"You should help Norfolk with you military strength or stop the coming winter with my Weather Machine."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo6.text")

		briefingLeonardo[page].position 	= 	GetPosition("Concentrating_Area")
		briefingLeonardo[page].explore		=	2000

		briefingLeonardo[page].quest		=	{}
		briefingLeonardo[page].quest.id		=	3
		briefingLeonardo[page].quest.type	=	MAINQUEST_OPEN
		briefingLeonardo[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Leonardo.title"
		briefingLeonardo[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Leonardo.text"

		NorfolkPage							=	briefingLeonardo[6]

	--	page 7

		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"I saw also that kerberos troops are getting their sulfur from near my prison."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo7.text")

		briefingLeonardo[page].position 	= 	GetPosition("SulfurTowerCheck")
		briefingLeonardo[page].explore		=	2000
		briefingLeonardo[page].marker		=	STATIC_MARKER
		
		BuildSulfurTowersPage				=	briefingLeonardo[7]

	--	page 8
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"If you stop this, he can not produce his cannons."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo8.text")
		
	--	page 9
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"Now its time for you to go, here take the plans of the weathermachine and stop Kerberos. Don't worry about me, he will not harm me."
		briefingLeonardo[page].title		= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo9.text")
		briefingLeonardo[page].position 	= 	GetPosition("Leonardo")



	--	page 10
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	MISSION_OBJECTIVES
--		briefingLeonardo[page].text			=	COLOR0.."1)"..COLOR1.."Help Norfolk.\n"..
		briefingLeonardo[page].title		= 	String.GenericKey("MissionObjectives")
		briefingLeonardo[page].text		=	String.Key("briefingLeonardo10.text")

		briefingLeonardo[page].position 	= 	{}
		briefingLeonardo[page].position.X,
		briefingLeonardo[page].position.Y 	= 	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingLeonardo)


end

briefingLeonardoFinished = function()

	ResolveBriefing(KerberosSeaPage)
	ResolveBriefing(BarbariansSeaPage)

	DisableNpcMarker("Leonardo")


end