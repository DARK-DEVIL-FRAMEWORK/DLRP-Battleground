function GetWeaponName(hash)
    hash = hash.weaponhash
    if hash == GetHashKey('WEAPON_UNARMED') then return 'unarmed'
    elseif hash == GetHashKey('WEAPON_KNUCKLE') then return 'knuckle'
    elseif hash == GetHashKey('WEAPON_BOTTLE') then return 'bottle'
    elseif hash == GetHashKey('WEAPON_MACHETE') then return 'machete'
    elseif hash == GetHashKey('WEAPON_REVOLVER') then return 'revolver'
    elseif hash == GetHashKey('WEAPON_BAT') then return 'bat'
    elseif hash == GetHashKey('WEAPON_GOLFCLUB') then return 'golfclub'
    elseif hash == GetHashKey('weapon_ak47') then return 'AK-47'
    elseif hash == GetHashKey('weapon_m70') then return 'M70'
    elseif hash == GetHashKey('weapon_de') then return 'Desert Eagle'
    elseif hash == GetHashKey('weapon_fnx45') then return 'FN FNX45'
    elseif hash == GetHashKey('weapon_glock17') then return 'PD Glock 17'
    elseif hash == GetHashKey('weapon_m4') then return 'PD M4A1'
    elseif hash == GetHashKey('weapon_m9') then return 'Beretta M9A3'
    elseif hash == GetHashKey('weapon_m1911') then return 'M1911'
    elseif hash == GetHashKey('weapon_uzi') then return 'UZI'
    elseif hash == GetHashKey('weapon_mac10') then return 'MAC-10'
    elseif hash == GetHashKey('weapon_mossberg') then return 'Mossberg 500'
    elseif hash == GetHashKey('weapon_remington') then return 'Remington 870'
    elseif hash == GetHashKey('weapon_scarh') then return 'PD SCAR-H'
    elseif hash == GetHashKey('weapon_shiv') then return 'Shiv'
    elseif hash == GetHashKey('weapon_katana') then return 'Katana'
    elseif hash == GetHashKey('weapon_sledgehammer') then return 'Sledge Hammer'
    elseif hash == GetHashKey('weapon_ar15') then return 'PD AR-15'
    elseif hash == GetHashKey('weapon_mk14') then return 'PD MK14'
    elseif hash == GetHashKey('weapon_huntingrifle') then return 'Hunting Rifle'
    elseif hash == GetHashKey('weapon_ak74') then return 'AK-74'
    elseif hash == GetHashKey('weapon_m110') then return 'M110'
    elseif hash == GetHashKey('weapon_hk416') then return 'HK-416'
    elseif hash == GetHashKey('weapon_aks74') then return 'AK-74'
    elseif hash == GetHashKey('weapon_glock22') then return 'Glock 22'
    elseif hash == GetHashKey('weapon_glock18c') then return 'Glock 18C'
    elseif hash == GetHashKey('weapon_mp5') then return 'H&K MP5'
    elseif hash == GetHashKey('weapon_karambit') then return 'Karambit'
    elseif hash == GetHashKey('weapon_colbaton') then return 'Baton'
    elseif hash == GetHashKey('WEAPON_GOLFCLUB') then return 'golfclub' end
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