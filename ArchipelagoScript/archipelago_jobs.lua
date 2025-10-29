--------------------------------------------------------------------------------
-- Script for archipelago background jobs made by Zork and yes its only if else
--------------------------------------------------------------------------------

HEROCOUNT = 5
ENEMYAIS = {

}

SAVEFILENAME = "__archipelago-"
CURRENTFILENAME = "__archipelago-"

function archipelago_init()
	Script.Load("maps\\user\\ArchipelagoScript\\archipelago_unit_tribute.lua")
	Script.Load("maps\\user\\ArchipelagoScript\\archipelago_quest_locations.lua")
	Script.Load("maps\\user\\EMS\\tools\\s5CommunityLib\\lib\\MemLib\\MemLib.lua")
	Script.Load("maps\\user\\EMS\\tools\\s5CommunityLib\\packer\\devLoad.lua")
	mcbPacker.Paths = {
		{"data/maps/user/ems/tools/",".lua"},
		{"data/maps/user/ems/tools/",".luac"},
	}
	Script.Load("maps\\user\\EMS\\tools\\s5CommunityLib\\lib\\UnlimitedArmy.lua")
	Script.Load("maps\\user\\EMS\\tools\\s5CommunityLib\\lib\\UnlimitedArmyRecruiter.lua")
	Script.Load("maps\\user\\EMS\\tools\\s5CommunityLib\\lib\\UnlimitedArmySpawnGenerator.lua")
	MemLib.Load("BuildingType")
	MemLib.Load("EntityIterator")
	MemLib.Load("Settler")
	TriggerFix.AllScriptsLoaded()
	reloadGDBItemsSave()
	--forbid all techs
	forbidAllItemTechs()
	giveStartingRessources()
	initBuyableHeroes()
	initUnitTributes()
	setPlayerColor()
	setGameSpeed()
	--StartSimpleJob("checkMotivation")
	initAttractionLimit()
	StartSimpleJob("checkForNewItems")
	StartSimpleJob("aiTechnologies")
	initQuestLog()
end

function initBuyableHeroes()
	function GUIUpdate_BuyHeroButton()
		local PlayerId = GUI.GetPlayerID()
		local NumberOfHerosToBuy = Logic.GetNumberOfBuyableHerosForPlayer( PlayerId )
		if NumberOfHerosToBuy > 0 then
			XGUIEng.ShowWidget(XGUIEng.GetCurrentWidgetID(),1)
		else
			XGUIEng.ShowWidget(XGUIEng.GetCurrentWidgetID(),0)
		end
	end
	GUIAction_ToggleMenu_Backup = GUIAction_ToggleMenu
	function GUIAction_ToggleMenu(_Menu, _Status)
		if _Menu == gvGUI_WidgetID.BuyHeroWindow then
			GUIAction_ToggleMenu_Backup("BuyHeroWindow", _Status)
		else
			GUIAction_ToggleMenu_Backup(_Menu, _Status)
		end
	end
	BuyHeroWindow_Update_BuyHero_Backup = BuyHeroWindow_Update_BuyHero
	function BuyHeroWindow_Update_BuyHero(_HeroEntityType)
		if((tonumber(GDB.GetString("progressive_dario")) < 1 or GDB.GetString("progressive_dario") == "") and _HeroEntityType == Entities.PU_Hero1c) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("pilgrim") ~= "1" and _HeroEntityType == Entities.PU_Hero2) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("salim") ~= "1" and _HeroEntityType == Entities.PU_Hero3) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("erec") ~= "1" and _HeroEntityType == Entities.PU_Hero4) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("ari") ~= "1" and _HeroEntityType == Entities.PU_Hero5) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("helias") ~= "1" and _HeroEntityType == Entities.PU_Hero6) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("kerberos") ~= "1" and _HeroEntityType == Entities.CU_BlackKnight) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("mary") ~= "1" and _HeroEntityType == Entities.CU_Mary_de_Mortfichet) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("varg") ~= "1" and _HeroEntityType == Entities.CU_Barbarian_Hero) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("drake") ~= "1" and _HeroEntityType == Entities.PU_Hero10) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("yuki") ~= "1" and _HeroEntityType == Entities.PU_Hero11) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
		if(GDB.GetString("kala") ~= "1" and _HeroEntityType == Entities.CU_Evil_Queen) then
			XGUIEng.DisableButton( XGUIEng.GetCurrentWidgetID(), 1 )
			return
		end
	
		BuyHeroWindow_Update_BuyHero_Backup(_HeroEntityType)
	end
	Logic.SetNumberOfBuyableHerosForPlayer(1, HEROCOUNT)
	function BuyHeroWindow_Action_BuyHero( _HeroEntityType )

		local PlayerID = GUI.GetPlayerID()
	
		--GUI.BuyHero( PlayerID, _HeroEntityType, 0 )
		HEROCOUNT = HEROCOUNT -1
		if _HeroEntityType == Entities.PU_Hero1c then
			if GDB.GetString("progressive_dario") == "1" then
				CreateMilitaryGroup(PlayerID, Entities.PU_Hero1a, 0, GetPosition("HeroSpawn"), EntityToHeroName(_HeroEntityType))
			elseif GDB.GetString("progressive_dario") == "2" then
				CreateMilitaryGroup(PlayerID, Entities.PU_Hero1b, 0, GetPosition("HeroSpawn"), EntityToHeroName(_HeroEntityType))
			else
				CreateMilitaryGroup(PlayerID, Entities.PU_Hero1c, 0, GetPosition("HeroSpawn"), EntityToHeroName(_HeroEntityType))
			end
		else
			CreateMilitaryGroup(PlayerID, _HeroEntityType, 0, GetPosition("HeroSpawn"), EntityToHeroName(_HeroEntityType))
		end
		Logic.SetNumberOfBuyableHerosForPlayer(1, HEROCOUNT)
		CreateChestOpener(EntityToHeroName(_HeroEntityType))
		
		XGUIEng.ShowWidget( gvGUI_WidgetID.BuyHeroWindow, 0 )
		
		--Update all buttons in the visible container
		XGUIEng.DoManualButtonUpdate(gvGUI_WidgetID.InGame)
		
	end
end

function initUnitTributes()
	if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) < 3 then
		if (tonumber(GDB.GetString("progressive_heavy_cavalry")) or 0) >= 1 then
			heavyCavTribute()
		end
		if (tonumber(GDB.GetString("progressive_light_cavalry")) or 0) >= 1 then
			lightCavTribute()
		end
		if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) < 2 then
			if (tonumber(GDB.GetString("progressive_bow")) or 0) >= 1 then
				bowTribute()
			end
			if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) < 1 then
				if (tonumber(GDB.GetString("progressive_sword")) or 0) >= 1 then
					swordTribute()
				end
				if (tonumber(GDB.GetString("progressive_spear")) or 0) >= 1 then
					spearTribute()
				end
			end
		end
	end
	if (tonumber(GDB.GetString("progressive_alchemy")) or 0) < 3 then
		if (tonumber(GDB.GetString("progressive_cannon")) or 0) >= 1 then
			cannonTribute()
		end
	end
	if (tonumber(GDB.GetString("progressive_math")) or 0) < 3 then
		if (tonumber(GDB.GetString("progressive_thief")) or 0) >= 1 then
			thiefTribute()
		end
		if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) < 2 then
			if (tonumber(GDB.GetString("progressive_rifle")) or 0) >= 1 then
				rifleTribute()
			end
		end
		if (tonumber(GDB.GetString("progressive_math")) or 0) < 2 then
			if (tonumber(GDB.GetString("progressive_scout")) or 0) >= 1 then
				scoutTribute()
			end
		end
	end
end

function EntityToHeroName(_HeroEntityType)
	if _HeroEntityType == Entities.PU_Hero1a or _HeroEntityType == Entities.PU_Hero1b or _HeroEntityType == Entities.PU_Hero1c then
		return "Dario"
	elseif _HeroEntityType == Entities.PU_Hero2 then
		return "Pilgrim"
	elseif _HeroEntityType == Entities.PU_Hero3 then
		return "Salim"
	elseif _HeroEntityType == Entities.PU_Hero4 then
		return "Erec"
	elseif _HeroEntityType == Entities.PU_Hero5 then
		return "Ari"
	elseif _HeroEntityType == Entities.PU_Hero6 then
		return "Helias"
	elseif _HeroEntityType == Entities.CU_BlackKnight then
		return "Kerberos"
	elseif _HeroEntityType == Entities.CU_Mary_de_Mortfichet then
		return "Mary"
	elseif _HeroEntityType == Entities.CU_Barbarian_Hero then
		return "Varg"
	elseif _HeroEntityType == Entities.PU_Hero10 then
		return "Drake"
	elseif _HeroEntityType == Entities.PU_Hero11 then
		return "Yuki"
	elseif _HeroEntityType == Entities.CU_Evil_Queen then
		return "Kala"
	end
end

function giveStartingRessources()
	if(GDB.GetString("starting_gold") ~= "") then
		AddGold(tonumber(GDB.GetString("starting_gold")*100))
	end
	if(GDB.GetString("starting_wood") ~= "") then
		AddWood(tonumber(GDB.GetString("starting_wood")*100))
	end
	if(GDB.GetString("starting_stone") ~= "") then
		AddStone(tonumber(GDB.GetString("starting_stone")*100))
	end
	if(GDB.GetString("starting_iron") ~= "") then
		AddIron(tonumber(GDB.GetString("starting_iron")*100))
	end
	if(GDB.GetString("starting_clay") ~= "") then
		AddClay(tonumber(GDB.GetString("starting_clay")*100))
	end
	if(GDB.GetString("starting_sulfur") ~= "") then
		AddSulfur(tonumber(GDB.GetString("starting_sulfur")*100))
	end
	
end

function initAttractionLimit()
	if GDB.GetString("additional_attraction") ~= "" and GDB.GetString("additional_attraction") ~= "0" then
		MemLib.BuildingType.SetAttractionSlots(Entities.PB_Headquarters1, tonumber(GDB.GetString("additional_attraction"))*5)
		MemLib.BuildingType.SetAttractionSlots(Entities.PB_Headquarters2, tonumber(GDB.GetString("additional_attraction"))*5)
		MemLib.BuildingType.SetAttractionSlots(Entities.PB_Headquarters3, tonumber(GDB.GetString("additional_attraction"))*5)
	end
end

function enableTechsOutOfGDB()
	AllowTechnology(Technologies.UP1_Headquarter)
	AllowTechnology(Technologies.UP2_Headquarter)

	--check the GDB for allowed techs

	--troops
	--sword
	if (tonumber(GDB.GetString("progressive_sword")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderSword)
		if (tonumber(GDB.GetString("progressive_sword")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSword1)  == 0 then
				AllowTechnology(Technologies.T_UpgradeSword1)
			end
			if (tonumber(GDB.GetString("progressive_sword")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSword2) == 0 then
					AllowTechnology(Technologies.T_UpgradeSword2)
				end
				if (tonumber(GDB.GetString("progressive_sword")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSword3) == 0 then
						AllowTechnology(Technologies.T_UpgradeSword3)
					end
				end
			end
		end
	end
	--spear
	if (tonumber(GDB.GetString("progressive_spear")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderSpear)
		if (tonumber(GDB.GetString("progressive_spear")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSpear1) == 0 then
				AllowTechnology(Technologies.T_UpgradeSpear1)
			end
			if (tonumber(GDB.GetString("progressive_spear")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSpear2) == 0 then
					AllowTechnology(Technologies.T_UpgradeSpear2)
				end
				if (tonumber(GDB.GetString("progressive_spear")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeSpear3) == 0 then
						AllowTechnology(Technologies.T_UpgradeSpear3)
					end
				end
			end
		end
	end
	--archer
	if (tonumber(GDB.GetString("progressive_bow")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderBow)
		if (tonumber(GDB.GetString("progressive_bow")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeBow1) == 0 then
				AllowTechnology(Technologies.T_UpgradeBow1)
			end
			if (tonumber(GDB.GetString("progressive_bow")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeBow2) == 0 then
					AllowTechnology(Technologies.T_UpgradeBow2)
				end
				if (tonumber(GDB.GetString("progressive_bow")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeBow3) == 0 then
						AllowTechnology(Technologies.T_UpgradeBow3)
					end
				end
			end
		end
	end
	--cannon
	if (tonumber(GDB.GetString("progressive_cannon")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_Cannon1)
		if (tonumber(GDB.GetString("progressive_cannon")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.MU_Cannon2) == 0 then
				AllowTechnology(Technologies.MU_Cannon2)
			end
			if (tonumber(GDB.GetString("progressive_cannon")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.MU_Cannon3) == 0 then
					AllowTechnology(Technologies.MU_Cannon3)
				end
				if (tonumber(GDB.GetString("progressive_cannon")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.MU_Cannon4) == 0 then
						AllowTechnology(Technologies.MU_Cannon4)
					end
				end
			end
		end
	end
	--hcav
	if (tonumber(GDB.GetString("progressive_heavy_cavalry")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderHeavyCavalry)
		if (tonumber(GDB.GetString("progressive_heavy_cavalry")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeHeavyCavalry1) == 0 then
				AllowTechnology(Technologies.T_UpgradeHeavyCavalry1)
			end
		end
	end
	--lcav
	if (tonumber(GDB.GetString("progressive_light_cavalry")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderLightCavalry)
		if (tonumber(GDB.GetString("progressive_light_cavalry")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeLightCavalry1) == 0 then
				AllowTechnology(Technologies.T_UpgradeLightCavalry1)
			end
		end
	end
	--rifle
	if (tonumber(GDB.GetString("progressive_rifle")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_LeaderRifle)
		if (tonumber(GDB.GetString("progressive_rifle")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_UpgradeRifle1) == 0 then
				AllowTechnology(Technologies.T_UpgradeRifle1)
			end
		end
	end
	--scout
	if (tonumber(GDB.GetString("progressive_scout")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_Scout)
		if (tonumber(GDB.GetString("progressive_scout")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_ScoutFindResources) == 0 then
				AllowTechnology(Technologies.T_ScoutFindResources)
			end
			if (tonumber(GDB.GetString("progressive_scout")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_ScoutTorches) == 0 then
					AllowTechnology(Technologies.T_ScoutTorches)
				end
			end
		end
	end
	--thief
	if (tonumber(GDB.GetString("progressive_thief")) or 0) >= 1 then
		AllowTechnology(Technologies.MU_Thief)
		if (tonumber(GDB.GetString("progressive_thief")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_ThiefSabotage) == 0 then
				AllowTechnology(Technologies.T_ThiefSabotage)
			end
		end
	end

	--buildings

	--university
	--math
	if (tonumber(GDB.GetString("progressive_math")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.GT_Mathematics) == 0 then
			AllowTechnology(Technologies.GT_Mathematics)
		end
		if (tonumber(GDB.GetString("progressive_math")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.GT_Binocular) == 0 then
				AllowTechnology(Technologies.GT_Binocular)
			end
			if (tonumber(GDB.GetString("progressive_math")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.GT_Matchlock) == 0 then
					AllowTechnology(Technologies.GT_Matchlock)
				end
				if (tonumber(GDB.GetString("progressive_math")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.GT_PulledBarrel) == 0 then
						AllowTechnology(Technologies.GT_PulledBarrel)
					end
				end
			end
		end
	end
	--mercenaries
	if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.GT_Mercenaries) == 0 then
			AllowTechnology(Technologies.GT_Mercenaries)
		end
		if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.GT_StandingArmy) == 0 then
				AllowTechnology(Technologies.GT_StandingArmy)
			end
			if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.GT_Tactics) == 0 then
					AllowTechnology(Technologies.GT_Tactics)
				end
				if (tonumber(GDB.GetString("progressive_mercenaries")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.GT_Strategies) == 0 then
						AllowTechnology(Technologies.GT_Strategies)
					end
				end
			end
		end
	end
	--construction
	if (tonumber(GDB.GetString("progressive_construction")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.GT_Construction) == 0 then
			AllowTechnology(Technologies.GT_Construction)
		end
		if (tonumber(GDB.GetString("progressive_construction")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.GT_GearWheel) == 0 then
				AllowTechnology(Technologies.GT_GearWheel)
			end
			if (tonumber(GDB.GetString("progressive_construction")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.GT_ChainBlock) == 0 then
					AllowTechnology(Technologies.GT_ChainBlock)
				end
				if (tonumber(GDB.GetString("progressive_construction")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.GT_Architecture) == 0 then
						AllowTechnology(Technologies.GT_Architecture)
					end
				end
			end
		end
	end
	--alchemy
	if (tonumber(GDB.GetString("progressive_alchemy")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.GT_Alchemy) == 0 then
			AllowTechnology(Technologies.GT_Alchemy)
		end
		if (tonumber(GDB.GetString("progressive_alchemy")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.GT_Alloying) == 0 then
				AllowTechnology(Technologies.GT_Alloying)
			end
			if (tonumber(GDB.GetString("progressive_alchemy")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.GT_Metallurgy) == 0 then
					AllowTechnology(Technologies.GT_Metallurgy)
				end
				if (tonumber(GDB.GetString("progressive_alchemy")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.GT_Chemistry) == 0 then
						AllowTechnology(Technologies.GT_Chemistry)
					end
				end
			end
		end
	end
	--literacy
	if (tonumber(GDB.GetString("progressive_literacy")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.GT_Literacy) == 0 then
			AllowTechnology(Technologies.GT_Literacy)
		end
		if (tonumber(GDB.GetString("progressive_literacy")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.GT_Trading) == 0 then
				AllowTechnology(Technologies.GT_Trading)
			end
			if (tonumber(GDB.GetString("progressive_literacy")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.GT_Printing) == 0 then
					AllowTechnology(Technologies.GT_Printing)
				end
				if (tonumber(GDB.GetString("progressive_literacy")) or 0) >= 4 then
					if Logic.IsTechnologyResearched(1, Technologies.GT_Library) == 0 then
						AllowTechnology(Technologies.GT_Library)
					end
				end
			end
		end
	end

	--troop-upgrades
	--smithy
	if (tonumber(GDB.GetString("progressive_heavy_armor")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_LeatherMailArmor) == 0 then
			AllowTechnology(Technologies.T_LeatherMailArmor)
		end
		if (tonumber(GDB.GetString("progressive_heavy_armor")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_ChainMailArmor) == 0 then
				AllowTechnology(Technologies.T_ChainMailArmor)
			end
			if (tonumber(GDB.GetString("progressive_heavy_armor")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_PlateMailArmor) == 0 then
					AllowTechnology(Technologies.T_PlateMailArmor)
				end
			end
		end
	end
	if (tonumber(GDB.GetString("progressive_light_armor")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_SoftArcherArmor) == 0 then
			AllowTechnology(Technologies.T_SoftArcherArmor)
		end
		if (tonumber(GDB.GetString("progressive_light_armor")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_PaddedArcherArmor) == 0 then
				AllowTechnology(Technologies.T_PaddedArcherArmor)
			end
			if (tonumber(GDB.GetString("progressive_light_armor")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_LeatherArcherArmor) == 0 then
					AllowTechnology(Technologies.T_LeatherArcherArmor)
				end
			end
		end
	end
	if (tonumber(GDB.GetString("progressive_sword_damage")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_MasterOfSmithery) == 0 then
			AllowTechnology(Technologies.T_MasterOfSmithery)
		end
		if (tonumber(GDB.GetString("progressive_sword_damage")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_IronCasting) == 0 then
				AllowTechnology(Technologies.T_IronCasting)
			end
		end
	end
	--sawmill
	if (tonumber(GDB.GetString("progressive_bow_damage")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_Fletching) == 0 then
			AllowTechnology(Technologies.T_Fletching)
		end
		if (tonumber(GDB.GetString("progressive_bow_damage")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_BodkinArrow) == 0 then
				AllowTechnology(Technologies.T_BodkinArrow)
			end
		end
	end
	if (tonumber(GDB.GetString("progressive_spear_damage")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_WoodAging) == 0 then
			AllowTechnology(Technologies.T_WoodAging)
		end
		if (tonumber(GDB.GetString("progressive_spear_damage")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_Turnery) == 0 then
				AllowTechnology(Technologies.T_Turnery)
			end
		end
	end
	--alchemist(cannon)
	if (tonumber(GDB.GetString("progressive_cannon_damage")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_EnhancedGunPowder) == 0 then
			AllowTechnology(Technologies.T_EnhancedGunPowder)
		end
		if (tonumber(GDB.GetString("progressive_cannon_damage")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_BlisteringCannonballs) == 0 then
				AllowTechnology(Technologies.T_BlisteringCannonballs)
			end
		end
	end
	--gunsmith
	if (tonumber(GDB.GetString("progressive_rifle_damage")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_LeadShot) == 0 then
			AllowTechnology(Technologies.T_LeadShot)
		end
		if (tonumber(GDB.GetString("progressive_rifle_damage")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_Sights) == 0 then
				AllowTechnology(Technologies.T_Sights)
			end
		end
	end
	if (tonumber(GDB.GetString("progressive_rifle_armor")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_FleeceArmor) == 0 then
			AllowTechnology(Technologies.T_FleeceArmor)
		end
		if (tonumber(GDB.GetString("progressive_rifle_armor")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_FleeceLinedLeatherArmor) == 0 then
				AllowTechnology(Technologies.T_FleeceLinedLeatherArmor)
			end
		end
	end
	--militarybuildings
	if (tonumber(GDB.GetString("better_chassis")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_BetterChassis) == 0 then
			AllowTechnology(Technologies.T_BetterChassis)
		end
	end
	if (tonumber(GDB.GetString("better_training_archery")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_BetterTrainingArchery) == 0 then
			AllowTechnology(Technologies.T_BetterTrainingArchery)
		end
	end
	if (tonumber(GDB.GetString("better_training_barracks")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_BetterTrainingBarracks) == 0 then
			AllowTechnology(Technologies.T_BetterTrainingBarracks)
		end
	end
	if (tonumber(GDB.GetString("better_training_stable")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_Shoeing) == 0 then
			AllowTechnology(Technologies.T_Shoeing)
		end
	end

	--serfs/castle
	if (tonumber(GDB.GetString("tracking")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_Tracking) == 0 then
			AllowTechnology(Technologies.T_Tracking)
		end
	end
	if (tonumber(GDB.GetString("militia")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_EnableMilitia) == 0 then
			AllowTechnology(Technologies.T_EnableMilitia)
		end
	end

	--stone
	if (tonumber(GDB.GetString("masonry")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_Masonry) == 0 then
			AllowTechnology(Technologies.T_Masonry)
		end
	end

	--villagecenter
	if (tonumber(GDB.GetString("progressive_village_center")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_TownGuard) == 0 then
			AllowTechnology(Technologies.T_TownGuard)
		end
		if (tonumber(GDB.GetString("progressive_village_center")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_Loom) == 0 then
				AllowTechnology(Technologies.T_Loom)
			end
			if (tonumber(GDB.GetString("progressive_village_center")) or 0) >= 3 then
				if Logic.IsTechnologyResearched(1, Technologies.T_Shoes) == 0 then
					AllowTechnology(Technologies.T_Shoes)
				end
			end
		end
	end

	--weather
	if (tonumber(GDB.GetString("progressive_weathertech")) or 0) >= 1 then
		if Logic.IsTechnologyResearched(1, Technologies.T_WeatherForecast) == 0 then
			AllowTechnology(Technologies.T_WeatherForecast)
		end
		if (tonumber(GDB.GetString("progressive_weathertech")) or 0) >= 2 then
			if Logic.IsTechnologyResearched(1, Technologies.T_ChangeWeather) == 0 then
				AllowTechnology(Technologies.T_ChangeWeather)
			end
		end
	end
end

function forbidAllItemTechs()
	ForbidTechnology(Technologies.MU_LeaderSword)
	ForbidTechnology(Technologies.T_UpgradeSword1)
	ForbidTechnology(Technologies.T_UpgradeSword2)
	ForbidTechnology(Technologies.T_UpgradeSword3)
	ForbidTechnology(Technologies.MU_LeaderSpear)
	ForbidTechnology(Technologies.T_UpgradeSpear1)
	ForbidTechnology(Technologies.T_UpgradeSpear2)
	ForbidTechnology(Technologies.T_UpgradeSpear3)
	ForbidTechnology(Technologies.MU_LeaderBow)
	ForbidTechnology(Technologies.T_UpgradeBow1)
	ForbidTechnology(Technologies.T_UpgradeBow2)
	ForbidTechnology(Technologies.T_UpgradeBow3)
	ForbidTechnology(Technologies.MU_Cannon1)
	ForbidTechnology(Technologies.MU_Cannon2)
	ForbidTechnology(Technologies.MU_Cannon3)
	ForbidTechnology(Technologies.MU_Cannon4)
	ForbidTechnology(Technologies.MU_LeaderHeavyCavalry)
	ForbidTechnology(Technologies.T_UpgradeHeavyCavalry1)
	ForbidTechnology(Technologies.MU_LeaderLightCavalry)
	ForbidTechnology(Technologies.T_UpgradeLightCavalry1)
	ForbidTechnology(Technologies.MU_LeaderRifle)
	ForbidTechnology(Technologies.T_UpgradeRifle1)
	ForbidTechnology(Technologies.MU_Scout)
	ForbidTechnology(Technologies.T_ScoutFindResources)
	ForbidTechnology(Technologies.T_ScoutTorches)
	ForbidTechnology(Technologies.MU_Thief)
	ForbidTechnology(Technologies.T_ThiefSabotage)
	ForbidTechnology(Technologies.GT_Mathematics)
	ForbidTechnology(Technologies.GT_Binocular)
	ForbidTechnology(Technologies.GT_Matchlock)
	ForbidTechnology(Technologies.GT_PulledBarrel)
	ForbidTechnology(Technologies.GT_Mercenaries)
	ForbidTechnology(Technologies.GT_StandingArmy)
	ForbidTechnology(Technologies.GT_Tactics)
	ForbidTechnology(Technologies.GT_Strategies)
	ForbidTechnology(Technologies.GT_Construction)
	ForbidTechnology(Technologies.GT_GearWheel)
	ForbidTechnology(Technologies.GT_ChainBlock)
	ForbidTechnology(Technologies.GT_Architecture)
	ForbidTechnology(Technologies.GT_Alchemy)
	ForbidTechnology(Technologies.GT_Alloying)
	ForbidTechnology(Technologies.GT_Metallurgy)
	ForbidTechnology(Technologies.GT_Chemistry)
	ForbidTechnology(Technologies.GT_Literacy)
	ForbidTechnology(Technologies.GT_Trading)
	ForbidTechnology(Technologies.GT_Printing)
	ForbidTechnology(Technologies.GT_Library)
	ForbidTechnology(Technologies.T_LeatherMailArmor)
	ForbidTechnology(Technologies.T_ChainMailArmor)
	ForbidTechnology(Technologies.T_PlateMailArmor)
	ForbidTechnology(Technologies.T_SoftArcherArmor)
	ForbidTechnology(Technologies.T_PaddedArcherArmor)
	ForbidTechnology(Technologies.T_LeatherArcherArmor)
	ForbidTechnology(Technologies.T_MasterOfSmithery)
	ForbidTechnology(Technologies.T_IronCasting)
	ForbidTechnology(Technologies.T_Fletching)
	ForbidTechnology(Technologies.T_BodkinArrow)
	ForbidTechnology(Technologies.T_WoodAging)
	ForbidTechnology(Technologies.T_Turnery)
	ForbidTechnology(Technologies.T_EnhancedGunPowder)
	ForbidTechnology(Technologies.T_BlisteringCannonballs)
	ForbidTechnology(Technologies.T_LeadShot)
	ForbidTechnology(Technologies.T_Sights)
	ForbidTechnology(Technologies.T_FleeceArmor)
	ForbidTechnology(Technologies.T_FleeceLinedLeatherArmor)
	ForbidTechnology(Technologies.T_BetterChassis)
	ForbidTechnology(Technologies.T_BetterTrainingArchery)
	ForbidTechnology(Technologies.T_BetterTrainingBarracks)
	ForbidTechnology(Technologies.T_Shoeing)
	ForbidTechnology(Technologies.T_Tracking)
	ForbidTechnology(Technologies.T_EnableMilitia)
	ForbidTechnology(Technologies.T_Masonry)
	ForbidTechnology(Technologies.T_TownGuard)
	ForbidTechnology(Technologies.T_Loom)
	ForbidTechnology(Technologies.T_Shoes)
	ForbidTechnology(Technologies.T_WeatherForecast)
	ForbidTechnology(Technologies.T_ChangeWeather)
end

function checkForNewItems()
	local index, tempFileName = Framework.GetSaveGameNames(0, 1)
	if tempFileName ~= SAVEFILENAME and tempFileName ~= CURRENTFILENAME then
		CURRENTFILENAME = tempFileName
		local stringArray = splitString(tempFileName,'-')
		local item = ""

		for i, techString in ipairs(stringArray) do
			if i > 1  and techString ~= "" then
				item = splitString(techString, ".")
				GDB.SetString(item[1], item[2])
			end
		end
		Message("Someone send You @color:255,255,0 ".. item[1] .. " @color:255,255,255 !")
		enableTechsOutOfGDB()
		initAttractionLimit()
	end
end

function splitString(str, delimiter)
    local result = {}
    local start = 1
    local delimiterStart, delimiterEnd = string.find(str, delimiter, start, true)
    
    while delimiterStart do
        table.insert(result, string.sub(str, start, delimiterStart - 1))
        start = delimiterEnd + 1
        delimiterStart, delimiterEnd = string.find(str, delimiter, start, true)
    end
    
    -- Letztes Element hinzufügen
    table.insert(result, string.sub(str, start))
    return result
end

function checkLocation(_string)
	if (GDB.GetString(_string) == "1") then
		do return end
	end
	GDB.SetString(_string, "1")
	initQuestLog()
	Message("You got an Item from @color:255,255,0 Another World @color:255,255,255 !")
end

function HeroSpawn(pos2)
	--creates the hero spawns and chest openers
	if(pos2 == nil) then
		pos2 = ""
	end
	if GDB.GetString("starting_hero") == "1" then
		if(GDB.GetString("progressive_dario") >= "1") then
			if(GDB.GetString("progressive_dario") >= "2") then
				if(GDB.GetString("progressive_dario") >= "3") then
					CreateMilitaryGroup(1, Entities.PU_Hero1c, 1, GetPosition("HeroSpawn"), "Dario")
				else
					CreateMilitaryGroup(1, Entities.PU_Hero1b, 1, GetPosition("HeroSpawn"), "Dario")
				end
			else
				CreateMilitaryGroup(1, Entities.PU_Hero1a, 1, GetPosition("HeroSpawn"), "Dario")
			end
			CreateChestOpener("Dario")
			return
		end
	end
	if(GDB.GetString("starting_hero") == "2") then
        CreateMilitaryGroup(1, Entities.PU_Hero2, 1, GetPosition("HeroSpawn"), "Pilgrim")
        CreateChestOpener("Pilgrim")
		return
	end
    if(GDB.GetString("starting_hero") == "3") then
        CreateMilitaryGroup(1, Entities.PU_Hero3, 1, GetPosition("HeroSpawn"), "Salim")
        CreateChestOpener("Salim")
		return
	end
    if(GDB.GetString("starting_hero") == "4") then
        CreateMilitaryGroup(1, Entities.PU_Hero4, 1, GetPosition("HeroSpawn"), "Erec")
        CreateChestOpener("Erec")
		return
	end
    if(GDB.GetString("starting_hero") == "5") then
        CreateMilitaryGroup(1, Entities.PU_Hero5, 1, GetPosition("HeroSpawn" .. pos2), "Ari")
        CreateChestOpener("Ari")
		return
	end
    if(GDB.GetString("starting_hero") == "6") then
        CreateMilitaryGroup(1, Entities.PU_Hero6, 1, GetPosition("HeroSpawn" .. pos2), "Helias")
        CreateChestOpener("Helias")
		return
	end
    if(GDB.GetString("starting_hero") == "7") then
        CreateMilitaryGroup(1, Entities.CU_BlackKnight, 1, GetPosition("HeroSpawn"), "Kerberos")
        CreateChestOpener("Kerberos")
		return
	end
    if(GDB.GetString("starting_hero") == "8") then
        CreateMilitaryGroup(1, Entities.CU_Mary_de_Mortfichet, 1, GetPosition("HeroSpawn"), "Mary")
        CreateChestOpener("Mary")
		return
	end
    if(GDB.GetString("starting_hero") == "9") then
        CreateMilitaryGroup(1, Entities.CU_Barbarian_Hero, 1, GetPosition("HeroSpawn"), "Varg")
        CreateChestOpener("Varg")
		return
	end
    if(GDB.GetString("starting_hero") == "10") then
        CreateMilitaryGroup(1, Entities.PU_Hero10, 1, GetPosition("HeroSpawn"), "Drake")
        CreateChestOpener("Drake")
		return
	end
    if(GDB.GetString("starting_hero") == "11") then
        CreateMilitaryGroup(1, Entities.PU_Hero11, 1, GetPosition("HeroSpawn"), "Yuki")
        CreateChestOpener("Yuki")
		return
	end
    if(GDB.GetString("starting_hero") == "12") then
        CreateMilitaryGroup(1, Entities.CU_Evil_Queen, 1, GetPosition("HeroSpawn"), "Kala")
        CreateChestOpener("Kala")
		return
    end
end 

function getLeadingHero()
	if GDB.GetString("starting_hero") == "1" then
		return "Dario"
	elseif GDB.GetString("starting_hero") == "2" then
		return "Pilgrim"
	elseif GDB.GetString("starting_hero") == "3" then
		return "Salim"
	elseif GDB.GetString("starting_hero") == "4" then
		return "Erec"
	elseif GDB.GetString("starting_hero") == "5" then
		return "Ari"
	elseif GDB.GetString("starting_hero") == "6" then
		return "Helias"
	elseif GDB.GetString("starting_hero") == "7" then
		return "Kerberos"
	elseif GDB.GetString("starting_hero") == "8" then
		return "Mary"
	elseif GDB.GetString("starting_hero") == "9" then
		return "Varg"
	elseif GDB.GetString("starting_hero") == "10" then
		return "Drake"
	elseif GDB.GetString("starting_hero") == "11" then
		return "Yuki"
	elseif GDB.GetString("starting_hero") == "12" then
		return "Kala"
	end
end

function initQuestLog()
	local archipelagoQuestText = "@color:255,255,0 Archipelago Infos @color:255,255,255 @cr @cr Welcome to S5s Archipelago Version. @cr To use Units that are not yet reachable by recruitement go to tribute. There you can buy the level 1 version of them. @cr To collect location progress the story and absolve side content. @cr @cr Current missing locations in this level: @color:64,224,208 @cr "
	archipelagoQuestText = archipelagoQuestText .. getMissingLocations()
	Logic.AddQuest(1, 99, MAINQUEST_OPEN, "Archipelago Infos", archipelagoQuestText, 0)
end

function reloadGDBItemsSave()
	Mission_OnSaveGameLoadedBackup = Mission_OnSaveGameLoaded
	Mission_OnSaveGameLoaded = function ()
		Message("Items reloaded")
		enableTechsOutOfGDB()
    	Mission_OnSaveGameLoadedBackup()
		setPlayerColor()
		setGameSpeed()
	end
end

function setPlayerColor()
	Display.SetPlayerColorMapping(1, tonumber(GDB.GetString("player_color")))
end

function setGameSpeed()
	if GDB.GetString("game_speed") == "1" then
		Game.GameTimeSetFactor(0.75)
	end
	if GDB.GetString("game_speed") == "3" then
		Game.GameTimeSetFactor(1.25)
	end
end

function checkMotivation()
	for workerId in MemLib.EntityIterator.Iterator(MemLib.EntityIterator.OfPlayer(1), MemLib.EntityIterator.OfCategory(EntityCategories.Worker)) do
		MemLib.Settler.SetMotivation(workerId, (tonumber(GDB.GetString("additional_motivation")) or 0))
	end
end

function setEnemyAis(_enemyAis)
	ENEMYAIS = _enemyAis
end

function aiTechnologies()
	local diff = getArchipelagoDifficultyMultiplier()*300
	local currentTime = Counter.Tick2("aiTechnologies", 7200 - diff)

	if currentTime == 3200 - diff then
		for i in pairs(ENEMYAIS) do
			ResearchTechnology(Technologies.T_LeatherMailArmor,i)
			ResearchTechnology(Technologies.T_SoftArcherArmor,i)
		end
		return false
	end
	if currentTime == 5300 - diff then
		for i in pairs(ENEMYAIS) do
			ResearchTechnology(Technologies.T_ChainMailArmor,i)
			ResearchTechnology(Technologies.T_PaddedArcherArmor,i)
			ResearchTechnology(Technologies.T_MasterOfSmithery,i)
			ResearchTechnology(Technologies.T_FleeceArmor,i)
			ResearchTechnology(Technologies.T_LeadShot,i)
			ResearchTechnology(Technologies.T_EnhancedGunPowder,i)
			ResearchTechnology(Technologies.T_Fletching,i)
			ResearchTechnology(Technologies.T_WoodAging,i)
		end
		return false
	end
	if currentTime == 7199 - diff then
		for i in pairs(ENEMYAIS) do
			ResearchTechnology(Technologies.T_PlateMailArmor,i)
			ResearchTechnology(Technologies.T_LeatherArcherArmor,i)
			ResearchTechnology(Technologies.T_IronCasting,i)
			ResearchTechnology(Technologies.T_FleeceLinedLeatherArmor,i)
			ResearchTechnology(Technologies.T_Sights,i)
			ResearchTechnology(Technologies.T_BlisteringCannonballs,i)
			ResearchTechnology(Technologies.T_BodkinArrow,i)
			ResearchTechnology(Technologies.T_Turnery,i)
		end
		return true
	end

end

function getArchipelagoDifficulty()
	return GDB.GetString("difficulty") ~= "" and tonumber(GDB.GetString("difficulty")) or 1
end

function getArchipelagoProgression()
	return GDB.GetString("progression") ~= "" and tonumber(GDB.GetString("progression")) or 0
end

function getArchipelagoDifficultyMultiplier()
	return getArchipelagoDifficulty() + getArchipelagoProgression()
end

function Modulo(_A, _B)
    while _A > _B do
        _A = _A - _B
    end
    return _A
end