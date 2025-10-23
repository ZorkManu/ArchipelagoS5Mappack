
createBriefingFreeLeonardoHint = function()

	briefingFreeLeonardoHint = 	{}	

	briefingFreeLeonardoHint.finished = BriefingFreeLeonardoHint

	local page = 0

	--	page
	
		page = page +1
	
		briefingFreeLeonardoHint[page] 			= 	{}
		briefingFreeLeonardoHint[page].title	= 	String.GenericKey("Leonardo")
		briefingFreeLeonardoHint[page].text		=	String.Key("briefingLeonardoDialog[2].text")
		briefingFreeLeonardoHint[page].position	=	GetPosition("Leonardo")
		briefingFreeLeonardoHint[page].dialogCamera 	= 	true

	-- go!
	
		StartBriefing(briefingFreeLeonardoHint)

end
	
	

BriefingFreeLeonardoHint = function()
	
		MapLocal_CameraPositionRestore()

end