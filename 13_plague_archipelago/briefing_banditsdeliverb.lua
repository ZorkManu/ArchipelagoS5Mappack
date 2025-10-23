
-- Deliver Robbers as support 

createBriefingBanditsDeliverB = function()

	MapLocal_CameraPositionBackup()

	briefingBanditsDeliverB = {}	

	briefingBanditsDeliverB.finished =  BriefingBanditsDeliverBFinished

		local page = 0

	--	page
	
		page = page +1
	
		briefingBanditsDeliverB[page] 					= 	{}
		briefingBanditsDeliverB[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBanditsDeliverB[page].text				=	String.Key("briefingBanditsDeliverB[1].text")
		briefingBanditsDeliverB[page].position 			= 	GetPosition("banditLeader")	
		briefingBanditsDeliverB[page].dialogCamera 		= 	true

	--	go!

		StartBriefing(briefingBanditsDeliverB)

	
	end
	
	
	
BriefingBanditsDeliverBFinished = function()

	MapLocal_CameraPositionRestore()

end
