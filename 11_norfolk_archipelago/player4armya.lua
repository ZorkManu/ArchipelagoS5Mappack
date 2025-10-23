-----------------------------------------------------------------------------------------------------------------------	
--
--	TRIGGER: "SetUpPlayer4ArmyA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	function Condition_SetUpPlayer4ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local player 			= gvMission.Player4ArmyA.player
		local army 				= gvMission.Player4ArmyA.id
		local numberOfTroops 	= AI.Army_GetNumberOfTroops(player,army)
	
		return Counter.Tick2("Player4ArmyA",40) and numberOfTroops < gvMission.Player4ArmyA.strength
		end
		
	-------------------------------------------------------------------------------------------------------------------
	function Action_SetUpPlayer4ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local player 	= gvMission.Player4ArmyA.player
		local army 		= gvMission.Player4ArmyA.id
		
		if Logic.GetRandom(100) > 30 then
			AI.Army_BuyLeader(player,army,UpgradeCategories.LeaderSword)
		else
			AI.Army_BuyLeader(player,army,UpgradeCategories.LeaderBow)
			end
		return false
		end
-----------------------------------------------------------------------------------------------------------------------
--
--	TRIGGER: "ControlPlayer4ArmyA"
--
-----------------------------------------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------------------------------------------------
	function Condition_ControlPlayer4ArmyA ()
	-------------------------------------------------------------------------------------------------------------------
		return Counter.Tick2("ControlPlayer4ArmyA",10)
		end
		
	-------------------------------------------------------------------------------------------------------------------
	function Action_ControlPlayer4ArmyA()
	-------------------------------------------------------------------------------------------------------------------
		local program = {}

		program.player 	= gvMission.Player4ArmyA.player
		program.army	= gvMission.Player4ArmyA.id
		
		if gvMission.Player4ArmyA.control.snowOffensive == 0 then 
		
			if gvMission.Player4ArmyA.control.closeDefense == 0 then
			
				program.position		= gvMission.Player4ArmyA.position
				program.defensiveRange	= 9000
				program.interceptRange	= 6000
				program.troopStrength	= 4
	
			else
	
				program.position		= GetPosition("Player4")
				program.defensiveRange	= 9000
				program.interceptRange	= 6000
				program.troopStrength	= 9
			
				end

			ControlArmy_Defensive4(program)
			
		else

			program.position		= gvMission.Player4ArmyA.position
			program.troopStrength	= 9
			
			ControlArmy_Offensive4(program)	
			
			end

		return false		
		end
-----------------------------------------------------------------------------------------------------------------------


function ControlArmy_Defensive4(_program)

	local numberOfTroops	= AI.Army_GetNumberOfTroops(_program.player,_program.army)		
	local distanceToEnemy	= AI.Army_GetDistanceBetweenAnchorAndEnemy(_program.player,_program.army)
	local position			= _program.position
	
	local distance = distanceToEnemy
		
	if distance > _program.interceptRange then	
		if distance > _program.defensiveRange then
			distance = _program.defensiveRange			
			end			
		AI.Army_SetAnchorRodeLength(_program.player,_program.army,distance)
		gvMission.Player4ArmyA.control.intercept = 0
	else	
		if gvMission.Player4ArmyA.control.intercept == 0 then
			AI.Army_SetAnchor(_program.player,_program.army,_program.position.X,_program.position.Y,distanceToEnemy)		
			gvMission.Player4ArmyA.control.intercept = 1
			end
		end
	
	AI.Entity_ConnectUnemployedLeader(_program.player,_program.troopStrength)			
	AI.Army_SetScatterTolerance(_program.player,_program.army,4)	
	
	end

function ControlArmy_Offensive4(_program)

	local numberOfTroops	= AI.Army_GetNumberOfTroops(_program.player,_program.army)		
	local distanceToEnemy	= AI.Army_GetDistanceBetweenAnchorAndEnemy(_program.player,_program.army)
	local position			= _program.position

	if gvMission.Player4ArmyA.control.intercept == 0 then
		AI.Army_SetAnchor(_program.player,_program.army,_program.position.X,_program.position.Y,0)		
		gvMission.Player4ArmyA.control.intercept = 1
	else
		if numberOfTroops >= gvMission.Player4ArmyA.strength then
			gvMission.Player4ArmyA.control.offensiveCounter = gvMission.Player4ArmyA.control.offensiveCounter +1
			if gvMission.Player4ArmyA.control.offensiveCounter < 20 then
				Report("deployment time "..gvMission.Player4ArmyA.control.offensiveCounter)
			else
				AI.Army_SetAnchorRodeLength(_program.player,_program.army,distanceToEnemy)
				end
			end
		end
			
	AI.Entity_ConnectUnemployedLeader(_program.player,_program.troopStrength)			
	AI.Army_SetScatterTolerance(_program.player,_program.army,4)	
	
	end
	
	
function Player4ArmyAFallBackToVillage()
	
	gvMission.Player4ArmyA.control.closeDefense = 1	
	
	local position = GetPosition("Player4")	
	AI.Army_SetAnchor(gvMission.Player4ArmyA.player,gvMission.Player4ArmyA.id,position.X,position.Y,5000)		
	
	AI.Village_EnableConstructing(gvMission.Player4ArmyA,false)
	
	end
	
function Player4HasEnoughIron()

	Report("player 4 has enough iron")

	local researchFile = {
        { type	= Entities.PB_Barracks1		    ,   prob = 30	, command = UPGRADE			},
		{ type	= Entities.PB_Headquarters1		,   prob = 30	, command = UPGRADE			},
        { type	= Technologies.T_UpgradeSword1  ,   prob = 20	, command = TECHNOLOGY	    ,	location = UpgradeCategories.Barracks	},
    }
    
    FeedAiWithResearchPlanFile(gvMission.Player4,researchFile)
	
	end
	
function Player4ArmyAStartsTheWinterOffensive()
	
	gvMission.Player4ArmyA.control.snowOffensive 	= 1
	gvMission.Player4ArmyA.control.intercept 		= 0
	gvMission.Player4ArmyA.position					= { X = 35900, Y = 44765 }
	gvMission.Player4ArmyA.strength					= 6

	end
