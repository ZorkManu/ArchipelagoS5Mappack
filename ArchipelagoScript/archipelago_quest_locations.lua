function getMissingLocations()
    local missingLocationsString = ""
    
    -- Thalgrund
	if Framework.GetCurrentMapName() == "01_THALGRUND_ARCHIPELAGO" then
        if GDB.GetString("thalgrund_save_village") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_save_village @cr "
        end
        if GDB.GetString("thalgrund_speak_with_priest") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_speak_with_priest @cr "
        end
        if GDB.GetString("thalgrund_sword_mayor") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_sword_mayor @cr "
        end
        if GDB.GetString("thalgrund_bow_mayor") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_bow_mayor @cr "
        end
        if GDB.GetString("thalgrund_build_barracks") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_build_barracks @cr "
        end
        if GDB.GetString("thalgrund_tower") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_tower @cr "
        end
        if GDB.GetString("thalgrund_ring_quest") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_ring_quest @cr "
        end
        if GDB.GetString("thalgrund_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "thalgrund_victory @cr "
        end
        return missingLocationsString
	end
    
    -- Village Attack
    if Framework.GetCurrentMapName() == "02_VILLAGEATTACK_ARCHIPELAGO" then
        if GDB.GetString("villageattack_save_village") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_save_village @cr "
        end
        if GDB.GetString("villageattack_camps_cleared") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_camps_cleared @cr "
        end
        if GDB.GetString("villageattack_speak_with_leonardo") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_speak_with_leonardo @cr "
        end
        if GDB.GetString("villageattack_troop_tribute") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_troop_tribute @cr "
        end
        if GDB.GetString("villageattack_erec_arrival") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_erec_arrival @cr "
        end
        if GDB.GetString("villageattack_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "villageattack_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Crawford
    if Framework.GetCurrentMapName() == "04_CRAWFORD_ARCHIPELAGO" then
        if GDB.GetString("crawford_west_ballista") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_west_ballista @cr "
        end
        if GDB.GetString("crawford_east_ballista") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_east_ballista @cr "
        end
        if GDB.GetString("crawford_north_ballista") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_north_ballista @cr "
        end
        if GDB.GetString("crawford_west_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_west_base @cr "
        end
        if GDB.GetString("crawford_east_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_east_base @cr "
        end
        if GDB.GetString("crawford_open_gate") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_open_gate @cr "
        end
        if GDB.GetString("crawford_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_victory @cr "
        end
        if GDB.GetString("crawford_help_leonardo") ~= "1" then
            missingLocationsString = missingLocationsString .. "crawford_help_leonardo @cr "
        end
        return missingLocationsString
    end
    
    -- Cleycourt
    if Framework.GetCurrentMapName() == "06_CLEYCOURT_ARCHIPELAGO" then
        if GDB.GetString("cleycourt_reach_barmecia") ~= "1" then
            missingLocationsString = missingLocationsString .. "cleycourt_reach_barmecia @cr "
        end
        if GDB.GetString("cleycourt_collect_key") ~= "1" then
            missingLocationsString = missingLocationsString .. "cleycourt_collect_key @cr "
        end
        if GDB.GetString("cleycourt_capture_ari") ~= "1" then
            missingLocationsString = missingLocationsString .. "cleycourt_capture_ari @cr "
        end
        if GDB.GetString("cleycourt_build_uni") ~= "1" then
            missingLocationsString = missingLocationsString .. "cleycourt_build_uni @cr "
        end
        if GDB.GetString("cleycourt_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "cleycourt_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Flood
    if Framework.GetCurrentMapName() == "07_FLOOD_ARCHIPELAGO" then
        if GDB.GetString("flood_gather_wood") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_gather_wood @cr "
        end
        if GDB.GetString("flood_gather_clay") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_gather_clay @cr "
        end
        if GDB.GetString("flood_gather_iron") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_gather_iron @cr "
        end
        if GDB.GetString("flood_get_ari") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_get_ari @cr "
        end
        if GDB.GetString("flood_find_key") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_find_key @cr "
        end
        if GDB.GetString("flood_hand_in_key") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_hand_in_key @cr "
        end
        if GDB.GetString("flood_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "flood_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Barmecia
    if Framework.GetCurrentMapName() == "08_BARMECIA_ARCHIPELAGO" then
        if GDB.GetString("barmecia_market_burning") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_market_burning @cr "
        end
        if GDB.GetString("barmecia_market_bandits") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_market_bandits @cr "
        end
        if GDB.GetString("barmecia_reach_barmecia") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_reach_barmecia @cr "
        end
        if GDB.GetString("barmecia_reach_cleycourt") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_reach_cleycourt @cr "
        end
        if GDB.GetString("barmecia_east_bandit_camp") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_east_bandit_camp @cr "
        end
        if GDB.GetString("barmecia_build_sulfur_mine") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_build_sulfur_mine @cr "
        end
        if GDB.GetString("barmecia_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "barmecia_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Folklung
    if Framework.GetCurrentMapName() == "10_FOLKLUNG_ARCHIPELAGO" then
        if GDB.GetString("folklung_speak_with_pilgrim") ~= "1" then
            missingLocationsString = missingLocationsString .. "folklung_speak_with_pilgrim @cr "
        end
        if GDB.GetString("folklung_destroy_enemies") ~= "1" then
            missingLocationsString = missingLocationsString .. "folklung_destroy_enemies @cr "
        end
        if GDB.GetString("folklung_leader") ~= "1" then
            missingLocationsString = missingLocationsString .. "folklung_leader @cr "
        end
        if GDB.GetString("folklung_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "folklung_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Norfolk
    if Framework.GetCurrentMapName() == "11_NORFOLK_ARCHIPELAGO" then
        if GDB.GetString("norfolk_defend_messenger") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_defend_messenger @cr "
        end
        if GDB.GetString("norfolk_waterfall") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_waterfall @cr "
        end
        if GDB.GetString("norfolk_behind_enemy_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_behind_enemy_base @cr "
        end
        if GDB.GetString("norfolk_barbarian_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_barbarian_base @cr "
        end
        if GDB.GetString("norfolk_kerberos_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_kerberos_base @cr "
        end
        if GDB.GetString("norfolk_winter") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_winter @cr "
        end
        if GDB.GetString("norfolk_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "norfolk_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Kaloix
    if Framework.GetCurrentMapName() == "12_KALOIX_ARCHIPELAGO" then
        if GDB.GetString("kaloix_defeat_bandits_left") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_defeat_bandits_left @cr "
        end
        if GDB.GetString("kaloix_defeat_bandits_right") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_defeat_bandits_right @cr "
        end
        if GDB.GetString("kaloix_port_tribute") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_port_tribute @cr "
        end
        if GDB.GetString("kaloix_stone_mine") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_stone_mine @cr "
        end
        if GDB.GetString("kaloix_clay_mine") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_clay_mine @cr "
        end
        if GDB.GetString("kaloix_iron_mine") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_iron_mine @cr "
        end
        if GDB.GetString("kaloix_sulfur_mine") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_sulfur_mine @cr "
        end
        if GDB.GetString("kaloix_tourte_solution") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_tourte_solution @cr "
        end
        if GDB.GetString("kaloix_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "kaloix_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Plague
    if Framework.GetCurrentMapName() == "13_PLAGUE_ARCHIPELAGO" then
        if GDB.GetString("plague_pilgrim") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_pilgrim @cr "
        end
        if GDB.GetString("plague_helias") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_helias @cr "
        end
        if GDB.GetString("plague_village_center_winter") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_village_center_winter @cr "
        end
        if GDB.GetString("plague_village_center_plague_village") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_village_center_plague_village @cr "
        end
        if GDB.GetString("plague_dario_archers") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_dario_archers @cr "
        end
        if GDB.GetString("plague_erec_swords") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_erec_swords @cr "
        end
        if GDB.GetString("plague_salim_cannons") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_salim_cannons @cr "
        end
        if GDB.GetString("plague_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "plague_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Old Kings Castle
    if Framework.GetCurrentMapName() == "15_OLDKINGSCASTLE_ARCHIPELAGO" then
        if GDB.GetString("old_kings_castle_door_key") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_door_key @cr "
        end
        if GDB.GetString("old_kings_castle_andalla") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_andalla @cr "
        end
        if GDB.GetString("old_kings_castle_bandits_front") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_bandits_front @cr "
        end
        if GDB.GetString("old_kings_castle_bandits_rock") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_bandits_rock @cr "
        end
        if GDB.GetString("old_kings_castle_bandits_castle") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_bandits_castle @cr "
        end
        if GDB.GetString("old_kings_castle_reach_castle") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_reach_castle @cr "
        end
        if GDB.GetString("old_kings_castle_liberate_village") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_liberate_village @cr "
        end
        if GDB.GetString("old_kings_castle_andalla_tribute") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_andalla_tribute @cr "
        end
        if GDB.GetString("old_kings_castle_castle_tribute") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_castle_tribute @cr "
        end
        if GDB.GetString("old_kings_castle_winter_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_winter_base @cr "
        end
        if GDB.GetString("old_kings_castle_summer") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_summer @cr "
        end
        if GDB.GetString("old_kings_castle_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "old_kings_castle_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Cloudy Mountains
    if Framework.GetCurrentMapName() == "17_CLOUDYMOUNTAINS_ARCHIPELAGO" then
        if GDB.GetString("cloudy_mountains_bandits") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_bandits @cr "
        end
        if GDB.GetString("cloudy_mountains_bandits_stoneville") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_bandits_stoneville @cr "
        end
        if GDB.GetString("cloudy_mountains_border_rocks") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_border_rocks @cr "
        end
        if GDB.GetString("cloudy_mountains_beautifications") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_beautifications @cr "
        end
        if GDB.GetString("cloudy_mountains_prospering_village") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_prospering_village @cr "
        end
        if GDB.GetString("cloudy_mountains_mordred_base") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_mordred_base @cr "
        end
        if GDB.GetString("cloudy_mountains_winter") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_winter @cr "
        end
        if GDB.GetString("cloudy_mountains_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "cloudy_mountains_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Evelance
    if Framework.GetCurrentMapName() == "18_EVELANCE_ARCHIPELAGO" then
        if GDB.GetString("evelance_destroy_kerberos") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_destroy_kerberos @cr "
        end
        if GDB.GetString("evelance_reach_tendrel") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_reach_tendrel @cr "
        end
        if GDB.GetString("evelance_cathedral") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_cathedral @cr "
        end
        if GDB.GetString("evelance_rescue_daughter") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_rescue_daughter @cr "
        end
        if GDB.GetString("evelance_sulfur_mines") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_sulfur_mines @cr "
        end
        if GDB.GetString("evelance_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "evelance_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Wasteland
    if Framework.GetCurrentMapName() == "19_WASTELAND_ARCHIPELAGO" then
        if GDB.GetString("wasteland_destroy_highport") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_destroy_highport @cr "
        end
        if GDB.GetString("wasteland_destroy_outpost_prison") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_destroy_outpost_prison @cr "
        end
        if GDB.GetString("wasteland_destroy_outpost_ashford") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_destroy_outpost_ashford @cr "
        end
        if GDB.GetString("wasteland_village_weathermaster") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_village_weathermaster @cr "
        end
        if GDB.GetString("wasteland_winter") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_winter @cr "
        end
        if GDB.GetString("wasteland_village_center_winter") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_village_center_winter @cr "
        end
        if GDB.GetString("wasteland_village_rain") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_village_rain @cr "
        end
        if GDB.GetString("wasteland_soldiers_rescue") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_soldiers_rescue @cr "
        end
        if GDB.GetString("wasteland_village_build_residences") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_village_build_residences @cr "
        end
        if GDB.GetString("wasteland_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "wasteland_victory @cr "
        end
        return missingLocationsString
    end
    
    -- Battle of Evelance
    if Framework.GetCurrentMapName() == "20_BATTLEOFEVELANCE_ARCHIPELAGO" then
        if GDB.GetString("battleofevelance_reinforcement_infantry") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_reinforcement_infantry @cr "
        end
        if GDB.GetString("battleofevelance_reinforcement_cavalry") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_reinforcement_cavalry @cr "
        end
        if GDB.GetString("battleofevelance_tribute_view") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_tribute_view @cr "
        end
        if GDB.GetString("battleofevelance_tribute_cannon") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_tribute_cannon @cr "
        end
        if GDB.GetString("battleofevelance_tribute_secretpath") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_tribute_secretpath @cr "
        end
        if GDB.GetString("battleofevelance_tribute_weathermaker") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_tribute_weathermaker @cr "
        end
        if GDB.GetString("battleofevelance_outpost") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_outpost @cr "
        end
        if GDB.GetString("battleofevelance_victory") ~= "1" then
            missingLocationsString = missingLocationsString .. "battleofevelance_victory @cr "
        end
        return missingLocationsString
    end
    
    return missingLocationsString
end