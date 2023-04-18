function GetWeaponName(hash)
    hash = hash.weaponhash
    if hash == GetHashKey('WEAPON_UNARMED') then return 'unarmed'
    elseif hash == GetHashKey('WEAPON_KNUCKLE') then return 'knuckle'
    elseif hash == GetHashKey('WEAPON_BOTTLE') then return 'bottle'
    elseif hash == GetHashKey('WEAPON_MACHETE') then return 'machete'
    elseif hash == GetHashKey('WEAPON_REVOLVER') then return 'revolver'
    elseif hash == GetHashKey('WEAPON_BAT') then return 'bat'
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