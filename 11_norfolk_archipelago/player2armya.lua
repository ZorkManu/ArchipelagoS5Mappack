-----------------------------------------------------------------------------------------------------------------------	
--
--	TRIGGER: "SetUpPlayer2ArmyA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	function Condition_SetUpPlayer2ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local player 			= gvMission.Player2ArmyA.player
		local army 				= gvMission.Player2ArmyA.id
		local numberOfTroops 	= AI.Army_GetNumberOfTroops(player,army)
	
		return Counter.Tick2("Player2ArmyA",40) and numberOfTroops < gvMission.Player2ArmyA.strength
		end
		
	-------------------------------------------------------------------------------------------------------------------
	function Action_SetUpPlayer2ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local player 	= gvMission.Player2ArmyA.player
		local army 		= gvMission.Player2ArmyA.id
		
		if Logic.GetRandom(100) > 30 then
			AI.Army_BuyLeader(player,army,UpgradeCategories.LeaderSword)
		else
			AI.Army_BuyLeader(player,army,UpgradeCategories.LeaderBow)
			end
		return false
		end
-----------------------------------------------------------------------------------------------------------------------
--
--	TRIGGER: "ControlPlayer2ArmyA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	function Condition_ControlPlayer2ArmyA ()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlPlayer2ArmyA",10)
		end
		
	-------------------------------------------------------------------------------------------------------------------
	function Action_ControlPlayer2ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local program = {}

		program.player 	= gvMission.Player2ArmyA.player
		program.army	= gvMission.Player2ArmyA.id
		
		if gvMission.Player2ArmyA.control.snowOffensive == 0 then 
		
			if gvMission.Player2ArmyA.control.closeDefense == 0 then
			
				program.position		= gvMission.Player2ArmyA.position
				program.defensiveRange	= 2000
				program.interceptRange	= 500
				program.troopStrength	= 4
	
			else
	
				program.position		= GetPosition("Player2")
				program.defensiveRange	= 7000
				program.interceptRange	= 5000
				program.troopStrength	= 9
			
				end

			ControlArmy_Defensive2(program)
			
		else

			program.position		= gvMission.Player2ArmyA.position
			program.troopStrength	= 9
			
			ControlArmy_Offensive2(program)	
			
			end

		return false		
		end
-----------------------------------------------------------------------------------------------------------------------


function ControlArmy_Defensive2(_program)

	local numberOfTroops	= AI.Army_GetNumberOfTroops(_program.player,_program.army)		
	local distanceToEnemy	= AI.Army_GetDistanceBetweenAnchorAndEnemy(_program.player,_program.army)
	local position			= _program.position
	
	local distance = distanceToEnemy
		
	if distance > _program.interceptRange then	
		if distance > _program.defensiveRange then
			distance = _program.defensiveRange			
			end			
		AI.Army_SetAnchorRodeLength(_program.player,_program.army,distance)
		gvMission.Player2ArmyA.control.intercept = 0
	else	
		if gvMission.Player2ArmyA.control.intercept == 0 then
			AI.Army_SetAnchor(_program.player,_program.army,_program.position.X,_program.position.Y,distanceToEnemy)		
			gvMission.Player2ArmyA.control.intercept = 1
			end
		end
	
	AI.Entity_ConnectUnemployedLeader(_program.player,_program.troopStrength)			
	AI.Army_SetScatterTolerance(_program.player,_program.army,4)	
	
	end

function ControlArmy_Offensive2(_program)

	local numberOfTroops	= AI.Army_GetNumberOfTroops(_program.player,_program.army)		
	local distanceToEnemy	= AI.Army_GetDistanceBetweenAnchorAndEnemy(_program.player,_program.army)
	local position			= _program.position

	if gvMission.Player2ArmyA.control.intercept == 0 then
		AI.Army_SetAnchor(_program.player,_program.army,_program.position.X,_program.position.Y,0)		
		gvMission.Player2ArmyA.control.intercept = 1
	else
		if numberOfTroops >= gvMission.Player2ArmyA.strength then
			gvMission.Player2ArmyA.control.offensiveCounter = gvMission.Player2ArmyA.control.offensiveCounter +1
			if gvMission.Player2ArmyA.control.offensiveCounter < 20 then
				Report("deployment time "..gvMission.Player2ArmyA.control.offensiveCounter)
			else
				AI.Army_SetAnchorRodeLength(_program.player,_program.army,distanceToEnemy)
				end
			end
		end
			
	AI.Entity_ConnectUnemployedLeader(_program.player,_program.troopStrength)			
	AI.Army_SetScatterTolerance(_program.player,_program.army,4)	
	
	end
	
	
function Player2ArmyAFallBackToVillage()
	
	gvMission.Player2ArmyA.control.closeDefense = 1	
	
	local position = GetPosition("Player2")	
	AI.Army_SetAnchor(gvMission.Player2ArmyA.player,gvMission.Player2ArmyA.id,position.X,position.Y,5000)		
	
	AI.Village_EnableConstructing(gvMission.Player2ArmyA,false)
	
	end
	
function Player2HasEnoughSulfur()

	Report("player 2 has enough sulfur")

	local researchFile = {
		{ type	= Entities.PB_Headquarters1		,   prob = 30	, command = UPGRADE			},
		{ type	= Entities.PB_FOUNDRY1			,   prob = 30	, command = UPGRADE			},
		
        --{ type	= Technologies.T_UpgradeSword1  ,   prob = 20	, command = TECHNOLOGY	    ,	location = UpgradeCategories.Barracks	},
    }
    
    FeedAiWithResearchPlanFile(gvMission.Player2,researchFile)
	
	end
	
function Player2ArmyAStartsTheWinterOffensive()
	
	gvMission.Player2ArmyA.control.snowOffensive 	= 1
	gvMission.Player2ArmyA.control.intercept 		= 0
	gvMission.Player2ArmyA.position					= { X = 32840, Y = 25004 }
	gvMission.Player2ArmyA.strength					= 6

	end
