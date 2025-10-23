
-- set village under fire
burnVillage = function()	
	
	for i = 1,22,1 do

		local name = "burning"..i
		
		if IsValid(name) and GetPlayer(name) == 4 then
		
			SetHealth(name,30-i)
		
		end
			
	end	
end
			