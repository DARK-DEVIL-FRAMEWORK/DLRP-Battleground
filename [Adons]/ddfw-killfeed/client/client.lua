function GetWeaponName(hash)
    hash = hash.weaponhash
    if hash == GetHashKey('WEAPON_UNARMED') then return 'unarmed'
    elseif hash == GetHashKey('WEAPON_KNUCKLE') then return 'knuckle'
    elseif hash == GetHashKey('WEAPON_BOTTLE') then return 'bottle'
    elseif hash == GetHashKey('WEAPON_MACHETE') then return 'machete'
    elseif hash == GetHashKey('WEAPON_REVOLVER') then return 'revolver'
    elseif hash == GetHashKey('WEAPON_BAT') then return 'bat'
    elseif hash == GetHashKey('WEAPON_GOLFCLUB') then return 'revolver'
    elseif hash == GetHashKey('weapon_ak47') then return 'revolver'
    elseif hash == GetHashKey('weapon_m70') then return 'revolver'
    elseif hash == GetHashKey('weapon_de') then return 'revolver'
    elseif hash == GetHashKey('weapon_fnx45') then return 'revolver'
    elseif hash == GetHashKey('weapon_glock17') then return 'revolver'
    elseif hash == GetHashKey('weapon_m4') then return 'revolver'
    elseif hash == GetHashKey('weapon_m9') then return 'revolver'
    elseif hash == GetHashKey('weapon_m1911') then return 'revolver'
    elseif hash == GetHashKey('weapon_uzi') then return 'revolver'
    elseif hash == GetHashKey('weapon_mac10') then return 'revolver'
    elseif hash == GetHashKey('weapon_mossberg') then return 'revolver'
    elseif hash == GetHashKey('weapon_remington') then return 'revolver'
    elseif hash == GetHashKey('weapon_scarh') then return 'revolver'
    elseif hash == GetHashKey('weapon_shiv') then return 'revolver'
    elseif hash == GetHashKey('weapon_katana') then return 'revolver'
    elseif hash == GetHashKey('weapon_sledgehammer') then return 'revolver'
    elseif hash == GetHashKey('weapon_ar15') then return 'revolver'
    elseif hash == GetHashKey('weapon_mk14') then return 'revolver'
    elseif hash == GetHashKey('weapon_huntingrifle') then return 'revolver'
    elseif hash == GetHashKey('weapon_ak74') then return 'revolver'
    elseif hash == GetHashKey('weapon_m110') then return 'revolver'
    elseif hash == GetHashKey('weapon_hk416') then return 'revolver'
    elseif hash == GetHashKey('weapon_aks74') then return 'revolver'
    elseif hash == GetHashKey('weapon_glock22') then return 'revolver'
    elseif hash == GetHashKey('weapon_glock18c') then return 'revolver'
    elseif hash == GetHashKey('weapon_mp5') then return 'revolver'
    elseif hash == GetHashKey('weapon_karambit') then return 'revolver'
    elseif hash == GetHashKey('weapon_colbaton') then return 'revolver'
    elseif hash == GetHashKey('WEAPON_GOLFCLUB') then return 'revolver' end
end

AddEventHandler('baseevents:onPlayerKilled', function(killerId, deathData)
    local weaponName = GetWeaponName(deathData)
    TriggerServerEvent('ddfw-killfeed:server:playerWasKilled', killerId, GetPlayerName(PlayerId()), weaponName)
end)

AddEventHandler('baseevents:onPlayerDied', function()
    TriggerServerEvent('ddfw-killfeed:server:playerDied', GetPlayerName(PlayerId()))
end)

RegisterNetEvent('ddfw-killfeed:client:feed')
AddEventHandler('ddfw-killfeed:client:feed', function(context)
    SendNUIMessage({
        context = context
    })
end)