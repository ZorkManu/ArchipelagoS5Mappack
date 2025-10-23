swordTribute = function()

	local Job = {}
	Job.Tribute = 020

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 220 .. " Gold and " .. 130 .. " Iron for Swordfighters",
						ResourceType.Gold,
						220,
                        ResourceType.Iron,
                        130)


	Job.Callback = swordTributePaid

	SetupTributePaid(Job)
end

swordTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderSword1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startSwordTribute")
end

startSwordTribute = function()
	if Counter.Tick2("startSwordTribute",2) then
		swordTribute()
	end
end

spearTribute = function()

	local Job = {}
	Job.Tribute = 021

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 200 .. " Gold and " .. 130 .. " Wood for Spearfighter",
						ResourceType.Gold,
						200,
                        ResourceType.Wood,
                        130)


	Job.Callback = spearTributePaid

	SetupTributePaid(Job)
end

spearTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderPoleArm1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startSpearTribute")
end

startSpearTribute = function()
	if Counter.Tick2("startSpearTribute",2) then
		spearTribute()
	end
end

bowTribute = function()

	local Job = {}
	Job.Tribute = 022

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 270 .. " Gold and " .. 180 .. " Wood for Archers",
						ResourceType.Gold,
						270,
                        ResourceType.Wood,
                        180)


	Job.Callback = bowTributePaid

	SetupTributePaid(Job)
end

bowTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderBow1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startBowTribute")
end

startBowTribute = function()
	if Counter.Tick2("startBowTribute",2) then
		bowTribute()
	end
end

heavyCavTribute = function()

	local Job = {}
	Job.Tribute = 023

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 625 .. " Gold and " .. 200 .. " Iron for Heavy Cavalary",
						ResourceType.Gold,
						625,
                        ResourceType.Iron,
                        200)


	Job.Callback = heavyCavTributePaid

	SetupTributePaid(Job)
end

heavyCavTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderHeavyCavalry1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startHeavyCavTribute")
end

startHeavyCavTribute = function()
	if Counter.Tick2("startHeavyCavTribute",2) then
		heavyCavTribute()
	end
end

lightCavTribute = function()

	local Job = {}
	Job.Tribute = 024

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 440 .. " Gold and " .. 90 .. " Iron and " .. 60 .. " Wood for Light Cavalary",
						ResourceType.Gold,
						440,
                        ResourceType.Iron,
                        90,
						ResourceType.Wood,
						60
					)


	Job.Callback = lightCavTributePaid

	SetupTributePaid(Job)
end

lightCavTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderCavlary1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startLightCavTribute")
end

startLightCavTribute = function()
	if Counter.Tick2("startLightCavTribute",2) then
		lightCavTribute()
	end
end

cannonTribute = function()

	local Job = {}
	Job.Tribute = 025

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 150 .. " Gold and " .. 50 .. " Iron and " .. 100 .. " Sulfur for a Cannon",
						ResourceType.Gold,
						150,
                        ResourceType.Iron,
                        50,
						ResourceType.Sulfur,
						100
					)


	Job.Callback = cannonTributePaid

	SetupTributePaid(Job)
end

cannonTributePaid = function()
	CreateMilitaryGroup(1, Entities.PV_Cannon1, 4, GetPosition("HeroSpawn"))
	StartSimpleJob("startCannonTribute")
end

startCannonTribute = function()
	if Counter.Tick2("startCannonTribute",2) then
		cannonTribute()
	end
end

thiefTribute = function()

	local Job = {}
	Job.Tribute = 026

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 300 .. " Gold and " .. 30 .. " Iron for a Thief",
						ResourceType.Gold,
						300,
                        ResourceType.Iron,
                        30)


	Job.Callback = thiefTributePaid

	SetupTributePaid(Job)
end

thiefTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_Thief, 0, GetPosition("HeroSpawn"))
	StartSimpleJob("startThiefTribute")
end

startThiefTribute = function()
	if Counter.Tick2("startThiefTribute",2) then
		thiefTribute()
	end
end

scoutTribute = function()

	local Job = {}
	Job.Tribute = 027

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 100 .. " Gold and " .. 50 .. " Iron for a Scout",
						ResourceType.Gold,
						100,
                        ResourceType.Iron,
                        50)


	Job.Callback = scoutTributePaid

	SetupTributePaid(Job)
end

scoutTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_Scout, 0, GetPosition("HeroSpawn"))
	StartSimpleJob("startScoutTribute")
end

startScoutTribute = function()
	if Counter.Tick2("startScoutTribute",2) then
		scoutTribute()
	end
end

rifleTribute = function()

	local Job = {}
	Job.Tribute = 028

		-- Create tribute
	Logic.AddTribute(	gvMission.PlayerID, 
						Job.Tribute,
						0,
						0,
						"Pay ".. 550 .. " Gold and " .. 230 .. " Sulfur for Sharpshooters",
						ResourceType.Gold,
						550,
                        ResourceType.Sulfur,
                        230)


	Job.Callback = rifleTributePaid

	SetupTributePaid(Job)
end

rifleTributePaid = function()
	CreateMilitaryGroup(1, Entities.PU_LeaderRifle1, 0, GetPosition("HeroSpawn"))
	StartSimpleJob("startRifleTribute")
end

startRifleTribute = function()
	if Counter.Tick2("startRifleTribute",2) then
		rifleTribute()
	end
end