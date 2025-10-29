
createQuestEstablishBase = function()

	local Quest = {}
	
	Quest.EntityTypes =	{	
							{Entities.PB_Barracks1, 	1}
						}

	Quest.Callback = EstablishDone

	SetupEstablish(Quest)

	end
	





	
EstablishDone = function()

	end3rdQuest()

	-- Allow keymaster to open gate
	GateQuest_Started = 1

	-- If keymaster is already freed before quest was finished
	if keymaster.key == 2 then
		EnableNpcMarker(keymaster.id)
	end

	start4thQuest()

end