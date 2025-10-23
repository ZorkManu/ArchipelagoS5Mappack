
createBriefingRegentTributePaid = function()

	briefingRegentTributePaid = 	{}	


	briefingRegentTributePaid.finished = BriefingRegentTributePaid

		local page = 0

	--	page
	
		page = page +1
		
		briefingRegentTributePaid[page] 			= 	{}
		briefingRegentTributePaid[page].title		= 	String.GenericKey("Dovbar")
		briefingRegentTributePaid[page].text		=	String.Key("briefingRegentTributePaid[1].text")
		briefingRegentTributePaid[page].position	=	GetPosition("defSpawnPoint4_CD")
		briefingRegentTributePaid[page].explore		=	2000			

	--	go!
	
		StartBriefing(briefingRegentTributePaid)

	end
	

BriefingRegentTributePaid = function()

	ResolveBriefing(briefingRegentTributePaid[1])
	
	MapLocal_CameraPositionRestore()

end

