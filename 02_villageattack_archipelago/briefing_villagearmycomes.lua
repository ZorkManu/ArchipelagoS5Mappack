
createBriefingVillageArmy = function()

	MapLocal_CameraPositionBackup()

	briefingVillageArmy = 	{}	

	briefingVillageArmy.finished = BriefingVillageArmy

	local page = 0

	--	page
	
		page = page +1
	
		briefingVillageArmy[page] 			= 	{}
		briefingVillageArmy[page].title		= 	String.Key("briefingVillageArmy[1].title")
		briefingVillageArmy[page].text		=	String.Key("briefingVillageArmy[1].text")
		briefingVillageArmy[page].position	=	GetPosition("Mayor_north")
		briefingVillageArmy[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
	
		briefingVillageArmy[page] 			= 	{}
		briefingVillageArmy[page].title		= 	String.Key("briefingVillageArmy[1].title")
		briefingVillageArmy[page].text		=	String.Key("briefingVillageArmy[2].text")
		briefingVillageArmy[page].position	=	GetPosition("village1")

	--	page
	
		page = page +1
	
		briefingVillageArmy[page] 			= 	{}
		briefingVillageArmy[page].title		= 	String.Key("briefingVillageArmy[1].title")
		briefingVillageArmy[page].text		=	String.Key("briefingVillageArmy[3].text")
		briefingVillageArmy[page].position	=	GetPosition("deploy1D")

	--	go!
	
		StartBriefing(briefingVillageArmy)
		
end

	

BriefingVillageArmy = function()
	
		MapLocal_CameraPositionRestore()

end