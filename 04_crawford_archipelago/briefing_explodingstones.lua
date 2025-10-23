
createBriefingExplodingStones = function()

	briefingExplodingStones = 	{}	

	briefingExplodingStones.finished = ExplodingStonesFinished

		local page = 0

	--	page
	
		page = page +1

		briefingExplodingStones[page] 			= 	{}
		briefingExplodingStones[page].title		= 	String.GenericKey("Leonardo")
		briefingExplodingStones[page].text		=	String.Key("briefingExplodingStones[1].text")
		briefingExplodingStones[page].position	=	GetPosition("leo")
		briefingExplodingStones[page].dialogCamera 		= 	true

	--	page
	
		page = page +1
		page_LeoRock = page

		briefingExplodingStones[page] 			= 	{}
		briefingExplodingStones[page].title		= 	String.GenericKey("Leonardo")
		briefingExplodingStones[page].text		=	String.Key("briefingExplodingStones[2].text")
		briefingExplodingStones[page].position	=	GetPosition("fallen_rock_05")
		briefingExplodingStones[page].explore	=	2500			

	--	page
	
		page = page +1
	
		briefingExplodingStones[page] 			= 	{}
		briefingExplodingStones[page].title		= 	String.GenericKey("NewTechnology")
		briefingExplodingStones[page].position 	= 	GetPosition("fallen_rock_06")
		briefingExplodingStones[page].text		=	{	String.GenericKey("GetNewUpgrade"),
														String.Key("briefingExplodingStones[3].text")
													}

	StartJob("BriefingExplodingStones")

	end



		
Condition_BriefingExplodingStones = function()

	if IsBriefingActive() == false then
	
		return true
		
		end
		
	return false
	
	end



	
Action_BriefingExplodingStones = function()

	--	go!
	
		StartBriefing(briefingExplodingStones)

	return true
	
	end	




ExplodingStonesFinished = function()

	for i = 1,10,1 do
	
		local name = "fallen_rock_0"..i
		
		Logic.CreateEffect(GGL_Effects.FXExplosion, GetPosition(name).X, GetPosition(name).Y,0)		--EXPLODE
		
		DestroyEntity(name)
		
	end

	ResolveBriefing(briefingLeoDialog[page_LeoDialog])
	ResolveBriefing(briefingExplodingStones[page_LeoRock])

end