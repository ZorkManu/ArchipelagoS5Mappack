
createBriefingBishopTributePaid = function()

	briefingBishopTributePaid = 	{}	


	briefingBishopTributePaid.finished = BriefingBishopTributePaid

		local page = 0

	--	page
	
		page = page +1
		
		briefingBishopTributePaid[page] 			= 	{}
		briefingBishopTributePaid[page].title		= 	String.GenericKey("Bishop")
		briefingBishopTributePaid[page].text		=	String.Key("briefingBishopTributePaid[1].text")
		briefingBishopTributePaid[page].position	=	GetPosition("bishop")
		briefingBishopTributePaid[page].explore		=	2000			
		briefingBishopTributePaid[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
		
		briefingBishopTributePaid[page] 			= 	{}
		briefingBishopTributePaid[page].title		= 	String.GenericKey("Bishop")
		briefingBishopTributePaid[page].text		=	String.Key("briefingBishopTributePaid[2].text")
		briefingBishopTributePaid[page].position	=	GetPosition("bishop_Camera")
		briefingBishopTributePaid[page].dialogCamera 		= 	true


	--	go!
	
		StartBriefing(briefingBishopTributePaid)

	end
	

BriefingBishopTributePaid = function()

	ResolveBriefing(briefingBishopTributePaid[1])
	
	MapLocal_CameraPositionRestore()

end

