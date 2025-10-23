createBriefingMayor = function()

		briefingMayor 					= 	{}	
                                    	
		briefingMayor.finished 			=	briefingMayorFinished

		EnableNpcMarker("MayorNPC")
		Move("Messenger", "MayorNPC", BRIEFING_TALK_DISTANCE)
	                                            	
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingMayor[page] 			= 	{}
--		briefingMayor[page].title		= 	COLOR2.."< Messenger of Norfolk >"
--		briefingMayor[page].text		=	"Thank you for protecting me."
		briefingMayor[page].title		= 	String.Key("briefingMayor1.title")
		briefingMayor[page].text		=	String.Key("briefingMayor1.text")

		briefingMayor[page].position 	= 	GetPosition("Messenger")

	--	page 2
	                                            	
		page = page +1                          	
	                                            	
		briefingMayor[page] 			= 	{}
--		briefingMayor[page].title		= 	COLOR2.."< Mayor of Norfolk >"
--		briefingMayor[page].text		=	"Our messanger is talking about raising troops of kerberos\nbut our walls are strong enough to hold them back\nand we have nothing to fear."
		briefingMayor[page].title		= 	String.Key("briefingMayor2.title")
		briefingMayor[page].text		=	String.Key("briefingMayor2.text")
		briefingMayor[page].position 	= 	GetPosition("MayorNPC")
		briefingMayor[page].dialogCamera 		= 	true
		
	--	page 3

	                                            	
		page = page +1                          	
	                                            	
		briefingMayor[page] 			= 	{}
--		briefingMayor[page].title		= 	COLOR2.."< Mayor of Norfolk >"
--		briefingMayor[page].text		=	"Our messanger is talking about raising troops of kerberos\nbut our walls are strong enough to hold them back\nand we have nothing to fear."
		briefingMayor[page].title		= 	String.Key("briefingMayor2.title")
		briefingMayor[page].text		=	String.Key("briefingMayor3.text")
		briefingMayor[page].position 	= 	GetPosition("NorfolkEntry")
 		briefingMayor[page].explore		=	3000
    
     	--	page 4
                    	
		page = page +1                          	
	                                            	
		briefingMayor[page] 			= 	{}
--		briefingMayor[page].title		= 	COLOR2.."< Mayor of Norfolk >"
--		briefingMayor[page].text		=	"He also saied something about a captured scientist maybe he knows something important."
		briefingMayor[page].title		= 	String.Key("briefingMayor2.title")
		briefingMayor[page].text		=	String.Key("briefingMayor4.text")

		briefingMayor[page].position 	= 	GetPosition("Leonardo")
 		briefingMayor[page].explore		=	2000
		briefingMayor[page].marker		=	ANIMATED_MARKER
		
		briefingMayor[page].quest		=	{}
		briefingMayor[page].quest.id	=	2
		briefingMayor[page].quest.type	=	MAINQUEST_OPEN
		briefingMayor[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Mayor.title"
		briefingMayor[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Mayor.text"
		
		FindLeoPage						=	briefingMayor[4]
		
	--	page 5
	
		page = page +1     
	
		briefingMayor[page] 			= 	{}
		briefingMayor[page].title		= 	String.GenericKey("Erec")
		briefingMayor[page].text		=	String.Key("briefingMayor5.text")
		briefingMayor[page].position 	= 	GetPosition("Dario")
		briefingMayor[page].dialogCamera 		= 	true


	--	page 6
	
		page = page +1     
	
		briefingMayor[page] 			= 	{}
		briefingMayor[page].title		= 	String.GenericKey("Erec")
		briefingMayor[page].text		=	String.Key("briefingMayor6.text")

		briefingMayor[page].position 	= 	GetPosition("P3HQ")
		briefingMayor[page].noScrolling	=	true
		briefingMayor[page].marker		=	ANIMATED_MARKER
		
		briefingMayor[page].quest		=	{}
		briefingMayor[page].quest.id		=	7
		briefingMayor[page].quest.type	=	MAINQUEST_OPEN
		briefingMayor[page].quest.title	=	"CM01_11_Norfolk_txt/quest_DefendNorfolk.title"
		briefingMayor[page].quest.text	=	"CM01_11_Norfolk_txt/quest_DefendNorfolk.text"
		
		DefendNorfolkPage				=	briefingMayor[6]


	--	page 7
	
		page = page +1     
	
		briefingMayor[page] 			= 	{}
		briefingMayor[page].title		= 	String.GenericKey("MissionObjectives")
		briefingMayor[page].text		=	String.Key("briefingMayor7.text")

		briefingMayor[page].position 	= 	GetPosition("Dario")
--		briefingMayor[page].dialogCamera 		= 	true


	--	go!
	
		StartBriefing(briefingMayor)


end

briefingMayorFinished = function()

	ResolveBriefing(MessengerNorfolkPage)
	DisableNpcMarker("MayorNPC")
	
end