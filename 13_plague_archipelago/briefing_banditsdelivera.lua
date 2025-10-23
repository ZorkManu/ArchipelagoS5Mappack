
-- Deliver Robbers as support 

createBriefingBanditsDeliverA = function()

	MapLocal_CameraPositionBackup()

	briefingBanditsDeliverA = {}	

	briefingBanditsDeliverA.finished =  BriefingBanditsDeliverAFinished

		local page = 0

	--	page
	
		page = page +1
	
		briefingBanditsDeliverA[page] 					= 	{}
		briefingBanditsDeliverA[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBanditsDeliverA[page].text				=	String.Key("briefingBanditsDeliverA[1].text")
		briefingBanditsDeliverA[page].position 			= 	GetPosition("banditLeader")	
		briefingBanditsDeliverA[page].dialogCamera 		= 	true

	--	go!

		StartBriefing(briefingBanditsDeliverA)

	
	end
	
	
	
BriefingBanditsDeliverAFinished = function()

	MapLocal_CameraPositionRestore()

end
