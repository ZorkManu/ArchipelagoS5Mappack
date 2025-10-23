
-- meet Helias

startQuestSearchHelias = function()

	EnableNpcMarker("HeliasNPC")

end




endQuestSearchHelias = function()

	DisableNpcMarker("HeliasNPC")

	-- Stop moving entity and destroy task
		local movingID = Logic.GetEntityIDByName("Dario")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Erec")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end

		local movingID = Logic.GetEntityIDByName("Pilgrim")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Salim")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Helias")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Ari")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end

		local movingID = Logic.GetEntityIDByName("Kerberos")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Varg")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Mary")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Drake")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end

		local movingID = Logic.GetEntityIDByName("Yuki")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		local movingID = Logic.GetEntityIDByName("Kala")
		if Logic.IsEntityMoving(movingID) then
			Move(movingID, movingID)
		end
		
		
	
--	Logic.RotateEntity(GetID("Helias"), 180)	

	
end
