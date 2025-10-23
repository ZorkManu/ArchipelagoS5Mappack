createQuestDestroyBlocking = function()

	local i
	for i=2,4,2 do
		local Quest = {}
		Quest.Target = "RockSouth"..i
		
		Quest.Callback = SouthWayOpen
		
		SetupDestroy(Quest)
	end

	for i=1,3,2 do
		local Quest = {}
		Quest.Targets = { "RockEast2", "RockEast"..i}
		
		Quest.Callback = EastWayOpen
		
		SetupDestroy(Quest)
	end

end

SouthWayOpen = function()

	DestroyBlockingQuestDone()

	if destroySouthBlockingDone == nil then
		
		StartAttackPos1()
		destroySouthBlockingDone = true
	end
end

EastWayOpen = function()

	DestroyBlockingQuestDone()

	-- south way not opened
	if destroySouthBlockingDone == nil then
		
		StartAttackPos2()
	end

end

DestroyBlockingQuestDone = function()

	if destroyBlockingDone == nil then
		
		end3rdQuest()
		
		destroyBlockingDone = true
	end

end