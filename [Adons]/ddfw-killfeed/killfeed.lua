local killfeedacikmi = true

RegisterNetEvent("killfeed")
AddEventHandler("killfeed", function(killer, victim, weapon)
    if killfeedacikmi == false then
        return
    end
        local weap = weapon
        if weap == GetHashKey("weapon_pistol_mk2") then
            weap = "weapon_pistol_mk2"
        elseif weap == GetHashKey("weapon_combatpistol") then
            weap = "weapon_combatpistol"
        elseif weap == GetHashKey("weapon_dagger") then
            weap = "weapon_dagger"
        elseif weap == GetHashKey("weapon_bat") then
            weap = "weapon_bat"
        elseif weap == GetHashKey("weapon_unarmed") then
            weap = "weapon_unarmed"
        elseif weap == GetHashKey("weapon_bottle") then
            weap = "weapon_bottle"
        elseif weap == GetHashKey("weapon_crowbar") then
            weap = "weapon_crowbar"
        elseif weap == GetHashKey("weapon_flashlight") then
            weap = "weapon_flashlight"
        elseif weap == GetHashKey("weapon_golfclub") then
            weap = "weapon_golfclub"
        elseif weap == GetHashKey("weapon_hammer") then
            weap = "weapon_hammer"
        elseif weap == GetHashKey("weapon_hatchet") then
            weap = "weapon_hatchet"
        elseif weap == GetHashKey("weapon_knuckle") then
            weap = "weapon_knuckle"
        elseif weap == GetHashKey("weapon_knife") then
            weap = "weapon_knife"
        elseif weap == GetHashKey("weapon_machete") then
            weap = "weapon_machete"
        elseif weap == GetHashKey("weapon_switchblade") then
            weap = "weapon_switchblade"
        elseif weap == GetHashKey("weapon_nightstick") then
            weap = "weapon_nightstick"
        elseif weap == GetHashKey("weapon_wrench") then
            weap = "weapon_wrench"
        elseif weap == GetHashKey("weapon_battleaxe") then
            weap = "weapon_battleaxe"
        elseif weap == GetHashKey("weapon_poolcue") then
            weap = "weapon_poolcue"
        elseif weap == GetHashKey("weapon_stone_hatchet") then
            weap = "weapon_stone_hatchet"
        elseif weap == GetHashKey("weapon_pistol") then
            weap = "weapon_pistol"
        elseif weap == GetHashKey("weapon_appistol") then
            weap = "weapon_appistol"
        elseif weap == GetHashKey("weapon_stungun") then
            weap = "weapon_stungun"
        elseif weap == GetHashKey("weapon_pistol50") then
            weap = "weapon_pistol50"
        elseif weap == GetHashKey("weapon_snspistol") then
            weap = "weapon_snspistol"
        elseif weap == GetHashKey("weapon_snspistol_mk2") then
            weap = "weapon_snspistol_mk2"
        elseif weap == GetHashKey("weapon_heavypistol") then
            weap = "weapon_heavypistol"
        elseif weap == GetHashKey("weapon_vintagepistol") then
            weap = "weapon_vintagepistol"
        elseif weap == GetHashKey("weapon_flaregun") then
            weap = "weapon_flaregun"
        elseif weap == GetHashKey("weapon_marksmanpistol") then
            weap = "weapon_marksmanpistol"
        elseif weap == GetHashKey("weapon_revolver") then
            weap = "weapon_revolver"
        elseif weap == GetHashKey("weapon_revolver_mk2") then
            weap = "weapon_revolver_mk2"
        elseif weap == GetHashKey("weapon_doubleaction") then
            weap = "weapon_doubleaction"
        elseif weap == GetHashKey("weapon_raypistol") then
            weap = "weapon_raypistol"
        elseif weap == GetHashKey("weapon_battleaxe") then
            weap = "weapon_battleaxe"
        elseif weap == GetHashKey("weapon_ceramicpistol") then
            weap = "weapon_ceramicpistol"
        elseif weap == GetHashKey("weapon_navyrevolver") then
            weap = "weapon_navyrevolver"
        elseif weap == GetHashKey("weapon_gadgetpistol") then
            weap = "weapon_gadgetpistol"
        elseif weap == GetHashKey("weapon_microsmg") then
            weap = "weapon_microsmg"
        elseif weap == GetHashKey("weapon_smg") then
            weap = "weapon_smg"
        elseif weap == GetHashKey("weapon_smg_mk2") then
            weap = "weapon_smg_mk2"
        elseif weap == GetHashKey("weapon_assaultsmg") then
            weap = "weapon_assaultsmg"
        elseif weap == GetHashKey("weapon_combatpdw") then
            weap = "weapon_combatpdw"
        elseif weap == GetHashKey("weapon_machinepistol") then
            weap = "weapon_machinepistol"
        elseif weap == GetHashKey("weapon_minismg") then
            weap = "weapon_minismg"
        elseif weap == GetHashKey("weapon_raycarbine") then
            weap = "weapon_raycarbine"
        elseif weap == GetHashKey("weapon_pumpshotgun") then
            weap = "weapon_pumpshotgun"
        elseif weap == GetHashKey("weapon_pumpshotgun_mk2") then
            weap = "weapon_pumpshotgun_mk2"
        elseif weap == GetHashKey("weapon_sawnoffshotgun") then
            weap = "weapon_sawnoffshotgun"
        elseif weap == GetHashKey("weapon_assaultshotgun") then
            weap = "weapon_assaultshotgun"
        elseif weap == GetHashKey("weapon_bullpupshotgun") then
            weap = "weapon_bullpupshotgun"
        elseif weap == GetHashKey("weapon_musket") then
            weap = "weapon_musket"
        elseif weap == GetHashKey("weapon_heavyshotgun") then
            weap = "weapon_heavyshotgun"
        elseif weap == GetHashKey("weapon_dbshotgun") then
            weap = "weapon_dbshotgun"
        elseif weap == GetHashKey("weapon_autoshotgun") then
            weap = "weapon_autoshotgun"
        elseif weap == GetHashKey("weapon_combatshotgun") then
            weap = "weapon_combatshotgun"
        elseif weap == GetHashKey("weapon_assaultrifle") then
            weap = "weapon_assaultrifle"
        elseif weap == GetHashKey("weapon_assaultrifle_mk2") then
            weap = "weapon_assaultrifle_mk2"
        elseif weap == GetHashKey("weapon_carbinerifle") then
            weap = "weapon_carbinerifle"
        elseif weap == GetHashKey("weapon_carbinerifle_mk2") then
            weap = "weapon_carbinerifle_mk2"
        elseif weap == GetHashKey("weapon_advancedrifle") then
            weap = "weapon_advancedrifle"
        elseif weap == GetHashKey("weapon_specialcarbine") then
            weap = "weapon_specialcarbine"
        elseif weap == GetHashKey("weapon_specialcarbine_mk2") then
            weap = "weapon_specialcarbine_mk2"
        elseif weap == GetHashKey("weapon_bullpuprifle") then
            weap = "weapon_bullpuprifle"
        elseif weap == GetHashKey("weapon_bullpuprifle_mk2") then
            weap = "weapon_bullpuprifle_mk2"
        elseif weap == GetHashKey("weapon_compactrifle") then
            weap = "weapon_compactrifle"
        elseif weap == GetHashKey("weapon_militaryrifle") then
            weap = "weapon_militaryrifle"
        elseif weap == GetHashKey("weapon_mg") then
            weap = "weapon_mg"
        elseif weap == GetHashKey("weapon_combatmg") then
            weap = "weapon_combatmg"
        elseif weap == GetHashKey("weapon_combatmg_mk2") then
            weap = "weapon_combatmg_mk2"
        elseif weap == GetHashKey("weapon_gusenberg") then
            weap = "weapon_gusenberg"
        elseif weap == GetHashKey("weapon_sniperrifle") then
            weap = "weapon_sniperrifle"
        elseif weap == GetHashKey("weapon_heavysniper") then
            weap = "weapon_heavysniper"
        elseif weap == GetHashKey("weapon_heavysniper_mk2") then
            weap = "weapon_heavysniper_mk2"
        elseif weap == GetHashKey("weapon_marksmanrifle") then
            weap = "weapon_marksmanrifle"
        elseif weap == GetHashKey("weapon_marksmanrifle_mk2") then
            weap = "weapon_marksmanrifle_mk2"
        elseif weap == GetHashKey("weapon_rpg") then
            weap = "weapon_rpg"
        elseif weap == GetHashKey("weapon_grenadelauncher") then
            weap = "weapon_grenadelauncher"
        elseif weap == GetHashKey("weapon_grenadelauncher_smoke") then
            weap = "weapon_grenadelauncher_smoke"
        elseif weap == GetHashKey("weapon_minigun") then
            weap = "weapon_minigun"
        elseif weap == GetHashKey("weapon_firework") then
            weap = "weapon_firework"
        elseif weap == GetHashKey("weapon_railgun") then
            weap = "weapon_railgun"
        elseif weap == GetHashKey("weapon_hominglauncher") then
            weap = "weapon_hominglauncher"
        elseif weap == GetHashKey("weapon_compactlauncher") then
            weap = "weapon_compactlauncher"
        elseif weap == GetHashKey("weapon_rayminigun") then
            weap = "weapon_rayminigun"
        end
        
        if killer == victim then
            weap = "suicide"
        end
        SendNUIMessage(
            {
                type = "kill",
                killer = killer,
                victim = victim,
                weapon = weap
            }
        )
    end
)

RegisterCommand("killfeed", function()
    if killfeedacikmi == nil then
        killfeedacikmi = true
        exports['okokNotify']:Alert("Bilgilendirme", "Yeniden aynı kombinasyonu kullanınız.", 5000, 'info')
        return
    end
    if killfeedacikmi == true then
        exports['okokNotify']:Alert("Bilgilendirme", "Killfeed Kapandı", 5000, 'info')
        killfeedacikmi = false
    elseif killfeedacikmi == false then 
        exports['okokNotify']:Alert("Bilgilendirme", "Killfeed Açıldı", 5000, 'info')
        killfeedacikmi = true 
    end
end)


-- RegisterNetEvent("killfeed")
-- AddEventHandler("killfeed", function(killer, victim, weapon)

        
--         if killer == victim then
--             weap = "suicide"
--         end
        
--         SendNUIMessage(
--             {
--                 type = "kill",
--                 killer = killer,
--                 victim = victim,
--                 weapon = weap
--             }
--         )
--     end
-- )