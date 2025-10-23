-- Player reaches ViewPoint and sees Kerberos' Army

createQuestReachViewPoint = function()

	local quest = {}

	quest.EntityName 	= "dario"		
	quest.Heroes		= 1
	quest.TargetName 	= "ViewPoint"		
	quest.Distance 		= 500			
	quest.Callback 		= ViewPointReached	
	quest.Heroes		= 1
	SetupExpedition(quest)

	end


	
ViewPointReached = function()

	--StartCutscene
	
		Report("Viewpoint erreicht")

		ResolveBriefing(briefingViewPoint[ViewPointPage])

		--		SpokenMessage(String.MainKey.."Message_ViewPoint reached")

		EnableNpcMarker("TellAboutViewPoint")

    	StartCutscene("Cutscene1")
		return true

	end