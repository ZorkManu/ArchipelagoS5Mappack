
-- check if polayer is close to closed gates


createQuestGates = function()

	local Quest1 = {}
	Quest1.Heroes 		=	true
	Quest1.Leaders		=	true
	Quest1.TargetName 	=	"ClosedGate1"
	Quest1.Distance		=	2500
	Quest1.Callback 	= 	GateReached1

	SetupExpedition(Quest1)

	local Quest2 = {}
	Quest2.Heroes 		=	true
	Quest2.Leaders		=	true
	Quest2.TargetName 	=	"ClosedGate2"
	Quest2.Distance		=	700
	Quest2.Callback 	= 	GateReached2

	SetupExpedition(Quest2)

	local Quest3 = {}
	Quest3.Heroes 		=	true
	Quest3.Leaders		=	true
	Quest3.TargetName 	=	"ClosedGate3"
	Quest3.Distance		=	700
	Quest3.Callback 	= 	GateReached3

	SetupExpedition(Quest3)

	local Quest4 = {}
	Quest4.Heroes 		=	true
	Quest4.Leaders		=	true
	Quest4.TargetName 	=	"ClosedGate4"
	Quest4.Distance		=	700
	Quest4.Callback 	= 	GateReached4

	SetupExpedition(Quest4)


end



	
GateReached1 = function()
	GateReachedBriefing(1)
end

GateReached2 = function()
	GateReachedBriefing(2)
end

GateReached3 = function()
	GateReachedBriefing(3)
end

GateReached4 = function()
	GateReachedBriefing(4)
end


	
	
	
GateReachedBriefing = function(_gate)

	MapLocal_CameraPositionBackup()	 

	briefingClosedGate 						= 	{}	
	briefingClosedGate.finished 			=	BriefingClosedGate

	local page = 0

--	page 1

	page = page +1

	briefingClosedGate[page] 				= 	{}
	briefingClosedGate[page].title			= 	String.GenericKey("Mentor")
	briefingClosedGate[page].text			=	String.Key("briefing_GatesClosed[1].text")
	briefingClosedGate[page].position 		= 	GetPosition("ClosedGate".._gate)


	--	check if briefing is active
	if IsBriefingActive() ~= true then
		StartBriefing(briefingClosedGate)	
	else
		GateBriefing_Started = StartJob("DelayGateBriefing")
	end


end



BriefingClosedGate = function()
	MapLocal_CameraPositionRestore()
end





	----------------------------------------------------------------
	Condition_DelayGateBriefing = function()                               
	----------------------------------------------------------------
	                                                                   
		if IsBriefingActive() ~= true then
			return true
		end
		return false
	end                                                             
                                                                    
	----------------------------------------------------------------
	Action_DelayGateBriefing = function()                                  
	----------------------------------------------------------------
		                                                            
		StartBriefing(briefingClosedGate)	
		EndJob(GateBriefing_Started)
	end
