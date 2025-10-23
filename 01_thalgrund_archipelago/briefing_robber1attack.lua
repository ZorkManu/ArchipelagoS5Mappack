
-- 1. attack
createBriefingRobber1Attack = function()

	MapLocal_CameraPositionBackup()	 

	briefingRobber1Attack = 	{}	

	briefingRobber1Attack.finished = BriefingRobber1Attack

		local page = 0

	--	page
	
		page = page +1

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[1].text")
		briefingRobber1Attack[page].position	=	MapLocal_CameraPositionBackup()

	--	page
	
		page = page +1
		page_Camp2 = page

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[2].text")
		briefingRobber1Attack[page].position	=	GetPosition("bossFight")
		briefingRobber1Attack[page].explore		=	2000

	--	page
	
		page = page +1

		briefingRobber1Attack[page] 			= 	{}
		briefingRobber1Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Attack[page].text		=	String.Key("briefingRobber1Attack[3].text")
		briefingRobber1Attack[page].position	=	GetPosition("HomeVillage1")


	end
	
	

	
BriefingRobber1Attack = function()

		ResolveBriefing(briefingRobber1Attack[page_Camp2])

		MapLocal_CameraPositionRestore()

	end
	



-- 2. attack

createBriefingRobber2Attack = function()

	briefingRobber2Attack = 	{}	

	briefingRobber2Attack.finished = BriefingRobber2Attack

		local page = 0

	--	page
	
		page = page +1

		briefingRobber2Attack[page] 			= 	{}
		briefingRobber2Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber2Attack[page].text		=	String.Key("briefingRobber2Attack[1].text")
		briefingRobber2Attack[page].position	=	MapLocal_CameraPositionBackup()

	--	page
	
		page = page +1

		briefingRobber2Attack[page] 			= 	{}
		briefingRobber2Attack[page].title		= 	String.GenericKey("Mentor")
		briefingRobber2Attack[page].text		=	String.Key("briefingRobber2Attack[2].text")
		briefingRobber2Attack[page].position	=	GetPosition("HomeVillage1")

	end
	

	
BriefingRobber2Attack = function()

	--	set time till next attack
		armyAttackingBanditsA.control.delay = TIME_BETWEEN_ATTACKS

		MapLocal_StartCountDown(armyAttackingBanditsA.control.delay)
		MapLocal_CameraPositionRestore()

	end
	






-----------------------------------------	
createBriefingRobber1Warning = function()

	briefingRobber1Warning = 	{}	

	briefingRobber1Warning.finished = BriefingRobber1Warning

		local page = 0

	--	page
	
		page = page +1
		page_Camp = page

		briefingRobber1Warning[page] 			= 	{}
		briefingRobber1Warning[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Warning[page].text		=	String.Key("briefingRobber1Warning[1].text")
		briefingRobber1Warning[page].position	=	GetPosition("bossFight")
		briefingRobber1Warning[page].explore	=	2000

	--	page
	
		page = page +1

		briefingRobber1Warning[page] 			= 	{}
		briefingRobber1Warning[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Warning[page].text		=	String.Key("briefingRobber1Warning[2].text")
		briefingRobber1Warning[page].position	=	GetPosition("HomeVillage1")

	--	page
	
		page = page +1

		briefingRobber1Warning[page] 			= 	{}
		briefingRobber1Warning[page].title		= 	String.GenericKey("Mentor")
		briefingRobber1Warning[page].text		=	String.Key("briefingRobber1Warning[3].text")
		briefingRobber1Warning[page].position	=	MapLocal_CameraPositionRestore()

	-- Go!
	
		StartBriefing(briefingRobber1Warning)

	end
	
	

	
BriefingRobber1Warning = function()

		ResolveBriefing(briefingRobber1Warning[page_Camp])
	
	-- start countdown
		MapLocal_StartCountDown(armyAttackingBanditsA.control.delay)

end