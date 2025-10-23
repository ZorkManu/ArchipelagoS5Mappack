createBriefingIronMines = function()

		briefingIronMines 					= 	{}	

	
		briefingIronMines.finished 			=	briefingIronMinesFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingIronMines[page] 			= 	{}
--		briefingIronMines[page].title		= 	COLOR2.."< Stranger >"
--		briefingIronMines[page].text		=	"Hail stranger, i have an information to you."
		briefingIronMines[page].title		= 	String.Key("briefingIronMines1.title")
		briefingIronMines[page].text		=	String.Key("briefingIronMines1.text")
		briefingIronMines[page].position 	= 	GetPosition("IronNPC")

	--	page 2

		page = page +1
	
		briefingIronMines[page] 			= 	{}
--		briefingIronMines[page].title		= 	COLOR2.."< Stranger >"
--		briefingIronMines[page].text		=	"This damn barbarians are getting their iron near my house and on the bank in the east."
		briefingIronMines[page].title		= 	String.Key("briefingIronMines1.title")
		briefingIronMines[page].text		=	String.Key("briefingIronMines2.text")

		briefingIronMines[page].position 	= 	GetPosition("TowerIronCheck1")
		briefingIronMines[page].explore		=	2000
		briefingIronMines[page].marker		=	STATIC_MARKER
				
		BuildIronTowers2Page				=	briefingIronMines[2]
		
	--	page 3
	
		page = page + 1
	
		briefingIronMines[page] 			= 	{}
--		briefingIronMines[page].title		= 	COLOR2.."< Stranger >"
--		briefingIronMines[page].text		=	"If you cut their iron production they can not produce so much soldiers."
		briefingIronMines[page].title		= 	String.Key("briefingIronMines1.title")
		briefingIronMines[page].text		=	String.Key("briefingIronMines3.text")

		briefingIronMines[page].position 	= 	GetPosition("TowerIronCheck2")	
		briefingIronMines[page].explore		=	2000
		briefingIronMines[page].marker		=	STATIC_MARKER

		BuildIronTowers1Page 				=	briefingIronMines[3]
	
	--	page 4
	
		page = page + 1

		briefingIronMines[page] 			= 	{}
--		briefingIronMines[page].title		= 	MISSION_OBJECTIVES
--		briefingIronMines[page].text		=	COLOR0.."1)"..COLOR1.."Interrupt iron extraction of Barbariens.\n"
		briefingIronMines[page].title		= 	String.GenericKey("MissionObjectives")
		briefingIronMines[page].text		=	String.Key("briefingIronMines4.text")

		briefingIronMines[page].position 	= 	{}
		briefingIronMines[page].position.X,
		briefingIronMines[page].position.Y 	=	Camera.ScrollGetLookAt()

	--	go!

	
	
		StartBriefing(briefingIronMines)
	
	end


briefingIronMinesFinished = function()

	DisableNpcMarker("IronNPC")

end