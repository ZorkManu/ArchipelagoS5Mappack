
-- Towguard at town gate 

createQuestReachTownExit = function()

	talkToGuard = 3

	InitNPCLookAt("Guardian"..talkToGuard)

end





destroyQuestReachTownExit = function()

	DisableNpcMarker("Guardian"..talkToGuard)

	if talkToGuard == 4 then 
		talkToGuard = 3
	else 
		talkToGuard = 4
	end

	InitNPCLookAt("Guardian"..talkToGuard)
	
end
	
