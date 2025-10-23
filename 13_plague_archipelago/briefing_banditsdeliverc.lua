
-- Deliver Robbers as support 

createBriefingBanditsDeliverC = function()

	MapLocal_CameraPositionBackup()

	briefingBanditsDeliverC = {}	

	briefingBanditsDeliverC.finished =  BriefingBanditsDeliverCFinished

		local page = 0

	--	page
	
		page = page +1
	
		briefingBanditsDeliverC[page] 					= 	{}
		briefingBanditsDeliverC[page].title				= 	String.Key("briefingBandits[1].title")
		briefingBanditsDeliverC[page].text				=	String.Key("briefingBanditsDeliverC[1].text")
		briefingBanditsDeliverC[page].position 			= 	GetPosition("banditLeader")	
		briefingBanditsDeliverC[page].dialogCamera 		= 	true

	--	go!

		StartBriefing(briefingBanditsDeliverC)

	
	end
	
	
	
BriefingBanditsDeliverCFinished = function()

	MapLocal_CameraPositionRestore()

end
