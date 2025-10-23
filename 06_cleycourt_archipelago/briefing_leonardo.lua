createBriefingLeonardo = function()

		briefingLeonardo					= 	{}	
                                         	
		local page = 0                          	
                                                	
	--	page 1                                  	
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"Hello again, as you see i found the mystic machine."
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text			=	String.Key("briefingLeonardo1.text")
		briefingLeonardo[page].position 	= 	GetPosition("Leonardo")

	--	page 2
	                                            	
		page = page +1                          	
	                                            	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"But something is missing and the machine will not work."
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text			=	String.Key("briefingLeonardo2.text")
		briefingLeonardo[page].position 	= 	GetPosition("Weathermachine")

	--	page 3
	
		page = page +1
	
		briefingLeonardo[page] 				= 	{}
--		briefingLeonardo[page].title		= 	COLOR2.."< Leonardo >"
--		briefingLeonardo[page].text			=	"If you find the missing part please come back to me."
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text			=	String.Key("briefingLeonardo3.text")
		briefingLeonardo[page].position 	= 	{}
		briefingLeonardo[page].position.X,
		briefingLeonardo[page].position.Y 	= 	Camera.ScrollGetLookAt()

	--	go!
	
		StartBriefing(briefingLeonardo)


end
