
TRIBUTE002_LEADER_TYPE = Entities.PV_Cannon3						--PU_LeaderSword1

-- sells cannons to the player

createQuestTrader2 = function()

	InitNPCLookAt("trader2")
	
	end
	
	

	
destroyQuestTrader2 = function()

	DisableNpcMarker("trader2")
	
	SetupTribut002()

	end




TributePaid002 = function()
	
	Report("tribute 002 paid")

	return false	

--    SetupTribut002()

	end




SetupTribut002 = function()
	
	local job = {}
	
	job.Tribute = 002

	Logic.AddTribute(	GetHumanPlayer(), 
						job.Tribute,
						0,
						0,
						String.MainKey.."tribute_Merchant2", 
						ResourceType.Gold, 
						5000 )

	job.Ralleypoint	= 	"traderDeployEnd2"
	
	job.Spawn 		=	{ 	
							{	Pos 		= "traderDeployStart2", 
								LeaderType 	= TRIBUTE002_LEADER_TYPE, 
								Soldiers 	= 0,								
								Ralleypoint	= "traderDeployEnd2"
							}, 

							{	Pos 		= "traderDeployStart2", 
								LeaderType 	= TRIBUTE002_LEADER_TYPE, 
								Soldiers 	= 0,								
								Ralleypoint	= "traderDeployEnd2"
							}, 

							{	Pos 		= "traderDeployStart2", 
								LeaderType 	= TRIBUTE002_LEADER_TYPE, 
								Soldiers 	= 0,								
								Ralleypoint	= "traderDeployEnd2"
							} 
						}

	job.Callback 	= TributePaid002

					

	SetupTributePaid(job)

	end