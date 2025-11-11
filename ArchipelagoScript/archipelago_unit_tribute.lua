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
end