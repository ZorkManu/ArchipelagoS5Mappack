
createBriefingExplodingCannons = function(_cannon)

	briefingExplodingCannons = 	{}	

	briefingExplodingCannons.finished = BriefingExplodingCannonsFinished

	local page = 0

	--	page 1
	
		page = page +1
	
		briefingExplodingCannons[page] 			= 	{}
		briefingExplodingCannons[page].title	= 	String.GenericKey("Mentor")
		briefingExplodingCannons[page].text		= 	String.Key("briefingExplodingCannons[1].text")
		briefingExplodingCannons[page].position	=	GetPosition(_cannon)
		briefingExplodingCannons[page].explore	=	1500

	--	go!
	
		StartBriefing(briefingExplodingCannons)
		
	end
	
BriefingExplodingCannonsFinished = function()

	for i = 1,8,1 do
	
		local name = "cannon"..i

		if IsAlive(name) then
		
			Tools.ChangeHealthOfEntity(GetEntityId(name),0)
			
			end

		end

	end