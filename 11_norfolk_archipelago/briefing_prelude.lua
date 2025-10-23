createBriefingPrelude = function()

		briefingPrelude = 	{}	

	--	change serf player id
	
		briefingPrelude.finished = BriefingPreludeFinished
		briefingPrelude.messanger = GetID("Messenger")
		EnableNpcMarker("Messenger")
	
		Move("Messenger", "Dario", 1000)
	
		Tools.ChangeHealthOfEntity(GetID("HQ"), 50)
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Dario >"
--		briefingPrelude[page].text				=	"We got this old castle from a prince of this area."
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude1.text")
		briefingPrelude[page].position 			= 	GetPosition("Dario")	

	--	page 2

		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Dario >"
--		briefingPrelude[page].text				=	"We should repair it, because its a little damaged by the attacks of Kerberos.\n"
		briefingPrelude[page].position 			= 	GetPosition("HQ")	
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude2.text")
		
	--	page 3
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Dario >"
--		briefingPrelude[page].text				=	"He also told me about a Monk that was attack by them, maybe he can tell us more."
		briefingPrelude[page].title				= 	String.GenericKey("Dario")
		briefingPrelude[page].text				=	String.Key("briefingPrelude3.text")

		briefingPrelude[page].position 			= 	GetPosition("Monk")
		briefingPrelude[page].explore			=	1500
		briefingPrelude[page].marker			=	STATIC_MARKER

		MonkPage								=	briefingPrelude[3]

	--	page 4

		page = page +1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Messenger of Norfolk >"
--		briefingPrelude[page].text				=	"Sorry Mylord that i'm interrutping you, but i have an important Message for norfolk."
		briefingPrelude[page].title				= 	String.Key("briefingMayor1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude4.text")
	
		briefingPrelude[page].npc				=	{}
		briefingPrelude[page].npc.id			=	briefingPrelude.messanger
		briefingPrelude[page].npc.isObserved	=	true

	--	page 5

		page = page +1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Messenger of Norfolk >"
--		briefingPrelude[page].text				=	"My problem is that the way to Norfolk is blocked."
		briefingPrelude[page].title				= 	String.Key("briefingMayor1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude5.text")
	
		briefingPrelude[page].position 			= 	GetPosition("Attacker1")
		briefingPrelude[page].explore			=	1000
		briefingPrelude[page].marker			=	STATIC_MARKER

		MessengerAttacker1Page					=	briefingPrelude[5]

	--	page 6

		page = page +1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Messenger of Norfolk >"
--		briefingPrelude[page].text				=	"This troops are coming from the west town."
		briefingPrelude[page].title				= 	String.Key("briefingMayor1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude6.text")
	
		briefingPrelude[page].position 			= 	GetPosition("Attacker2")
		briefingPrelude[page].explore			=	1000
		briefingPrelude[page].marker			=	STATIC_MARKER

		MessengerAttacker2Page					=	briefingPrelude[6]
		
	--	page 7

		page = page +1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Messenger of Norfolk >"
--		briefingPrelude[page].text				=	"They are barbarians that don't want that my message reach Norfolks mayor."
		briefingPrelude[page].title				= 	String.Key("briefingMayor1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude7.text")
	
		briefingPrelude[page].position 			= 	GetPosition("Attacker3")
		briefingPrelude[page].explore			=	1000
		briefingPrelude[page].marker			=	STATIC_MARKER

		MessengerAttacker3Page					=	briefingPrelude[7]
		
	--	page 8

		page = page +1

		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	COLOR2.."< Messenger of Norfolk >"
--		briefingPrelude[page].text				=	"Please help me to reach Norfolk Mylord."
		briefingPrelude[page].title				= 	String.Key("briefingMayor1.title")
		briefingPrelude[page].text				=	String.Key("briefingPrelude8.text")
	
		briefingPrelude[page].position 			= 	GetPosition("MayorNPC")
		briefingPrelude[page].explore			=	3000
		briefingPrelude[page].marker			=	ANIMATED_MARKER

		briefingPrelude[page].quest				=	{}
		briefingPrelude[page].quest.id			=	1
		briefingPrelude[page].quest.type		=	MAINQUEST_OPEN
		briefingPrelude[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Prelude.title"
		briefingPrelude[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Prelude.text"

		MessengerNorfolkPage					=	briefingPrelude[8]				

	--	page 9
	
		page = page +1
	
		briefingPrelude[page] 					= 	{}
--		briefingPrelude[page].title				= 	MISSION_OBJECTIVES
--		briefingPrelude[page].text				=	COLOR0.."1)"..COLOR1.."Help Messenger to reach Norfolk.\n"
		briefingPrelude[page].position 			= 	GetPosition("Dario")	
		briefingPrelude[page].title				= 	String.GenericKey("MissionObjectives")
		briefingPrelude[page].text				=	String.Key("briefingPrelude9.text")

	--	go!
	
		StartBriefing(briefingPrelude)
	
end

BriefingPreludeFinished = function()

		
end