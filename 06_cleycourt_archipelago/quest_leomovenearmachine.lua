createQuestLeoMoveNearMachine = function()

	-- After time
	TimeLine.Enter("Move to WM", TimeLine.Seconds + 1200, "MoveLeoNearMachine" )

end

MoveLeoNearMachine = function()

	InitNPC("Leonardo")
	Move("Leonardo", "Machine")
	
	local Quest			=	{}
	Quest.EntityName	=	"Leonardo"
	Quest.TargetName	=	"Machine"
	Quest.Distance		=	100
	Quest.Callback		=	LeoNearMachine
	
	SetupExpedition(Quest)
end

LeoNearMachine = function()

	talkedToLeonardo	=	nil

	LeoState 			=	NEAR_MACHINE

end