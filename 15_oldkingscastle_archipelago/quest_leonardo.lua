
-- Leonardo 

createQuestLeonardo = function()

	EnableNpcMarker("Leonardo")

	briefingLeonardo = {}	
	
	local page = 1
    
		briefingLeonardo[page] 					= 	{}
		briefingLeonardo[page].title			= 	String.GenericKey("Leonardo")
		briefingLeonardo[page].text				=	String.Key("briefingLeonardo.text" )
		briefingLeonardo[page].position			=	GetPosition("Leonardo")
		briefingLeonardo[page].dialogCamera 	= 	true
	
end
	
	
	
	
	
destroyQuestLeonardo = function()

	DisableNpcMarker("Leonardo")

	local Job1 = {}
	
	if 	uniqueTributeCounter == nil then 
		uniqueTributeCounter = 1
	end

	Job1.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."Leonardo_Tribute1", 
						ResourceType.Gold, 
						1500)

	Job1.Resources 	= { sulfur = 2000 }

	Job1.Callback 	= TributeLeonardoPaid1

	SetupTributePaid(Job1)

end




TributeLeonardoPaid1 = function()
	
	local Job1 = {}
	
	Job1.Tribute = uniqueTributeCounter
	
	uniqueTributeCounter = uniqueTributeCounter +1

	Logic.AddTribute(	GetHumanPlayer(), 
						Job1.Tribute,
						0,
						0,
						String.MainKey.."Leonardo_Tribute2", 
						ResourceType.Gold, 
						2000 )

	Job1.Resources 	= { sulfur = 2000 }

	Job1.Callback 	= TributeLeonardoPaid2

	SetupTributePaid(Job1)

	return true
	
end




TributeLeonardoPaid2 = function()
	
	return true
	
end
	
