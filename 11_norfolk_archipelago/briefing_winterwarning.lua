createBriefingWinterWarning = function()

		briefingWinterWarning 					= 	{}	

	
		briefingWinterWarning.finished 			=	briefingWinterWarningFinished
	
		local page = 0

	--	page 1
	
		page = page +1
	
		briefingWinterWarning[page] 			= 	{}
		briefingWinterWarning[page].title		= 	String.GenericKey("Leonardo")
		briefingWinterWarning[page].text		=	String.Key("briefingWinterWarning1.text")
		briefingWinterWarning[page].position 	= 	GetPosition("Leonardo_House")
		briefingWinterWarning[page].explore		=	2500

	--	page 2

		page = page +1
	
		briefingWinterWarning[page] 			= 	{}
		briefingWinterWarning[page].title		= 	String.GenericKey("Leonardo")
		briefingWinterWarning[page].text		=	String.Key("briefingWinterWarning2.text")
		briefingWinterWarning[page].position 	= 	GetPosition("P2_WinterGather")
		briefingWinterWarning[page].explore		=	2500
		briefingWinterWarning[page].marker		=	STATIC_MARKER
		

	--	page 3

		page = page +1
	
		briefingWinterWarning[page] 			= 	{}
		briefingWinterWarning[page].title		= 	String.GenericKey("Leonardo")
		briefingWinterWarning[page].text		=	String.Key("briefingWinterWarning3.text")
		briefingWinterWarning[page].position 	= 	GetPosition("P4_WinterGather")
		briefingWinterWarning[page].explore		=	2500
		briefingWinterWarning[page].marker		=	STATIC_MARKER

	--	page 4
		page = page +1
	
		if talkedToLeonardo == true then
			briefingWinterWarning[page] 			= 	{}
			briefingWinterWarning[page].title		= 	String.GenericKey("Leonardo")
			briefingWinterWarning[page].text		=	String.Key("briefingWinterWarning4.text")
		
			briefingWinterWarning[page].position 	= 	{}
			briefingWinterWarning[page].position.X,
			briefingWinterWarning[page].position.Y 	= 	Camera.ScrollGetLookAt()
			
			briefingWinterWarning[page].quest		=	{}
			briefingWinterWarning[page].quest.id		=	10
			briefingWinterWarning[page].quest.type	=	SUBQUEST_OPEN
			briefingWinterWarning[page].quest.title	=	"CM01_11_Norfolk_txt/quest_Weathermachineo.title"
			briefingWinterWarning[page].quest.text	=	"CM01_11_Norfolk_txt/quest_Weathermachineo.text"
			
			WeathermachineQuestPage						=	briefingWinterWarning[4]
				 		
			if NorfolkPage~= nil then
				ResolveBriefing(NorfolkPage)
			end
			
		else							
			briefingWinterWarning[page] 			= 	{}
			briefingWinterWarning[page].title		= 	String.GenericKey("Leonardo")
			briefingWinterWarning[page].text		=	String.Key("briefingWinterWarning4b.text")
		
			briefingWinterWarning[page].position 	= 	{}
			briefingWinterWarning[page].position.X,
			briefingWinterWarning[page].position.Y 	= 	Camera.ScrollGetLookAt()
		end
		
	--	go!

	if IsBriefingActive() ~= true then

		StartBriefing(briefingWinterWarning)

	else
		Report("Briefing Delayed!!!")
		StartJob("DelayBriefingWinterWarning")
	
	end
	


end

	
	----------------------------------------------------------------
	Condition_DelayBriefingWinterWarning = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
		                                                            
			return true
		end

		return false
				                                                            
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayBriefingWinterWarning = function()                                  
	----------------------------------------------------------------
		                                                            
		StartBriefing(briefingWinterWarning)

	end
	
	



briefingWinterWarningFinished = function()

--	DisableNpcMarker("WinterWarning")

--	briefingWinterWarning.WinterWarning = GetID("WinterWarning")
--	MoveAndVanish(briefingWinterWarning.WinterWarning,"MayorNPC")


end