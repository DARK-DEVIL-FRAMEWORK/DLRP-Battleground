RegisterNetEvent('ddfw-killfeed:server:playerWasKilled')
AddEventHandler('ddfw-killfeed:server:playerWasKilled', function(killerId, whoWasKilled, weaponName)
    TriggerClientEvent('ddfw-killfeed:client:feed', -1, '<strong>' .. tostring(GetPlayerName(killerId)) .. '</strong> <img src="img/'.. tostring(weaponName) ..'.webp" width="30px" style="transform: rotate(-30deg);;"> <strong>' .. tostring(whoWasKilled) .. '</strong>')
end)

RegisterNetEvent('ddfw-killfeed:server:playerDied')
AddEventHandler('ddfw-killfeed:server:playerDied', function(whoDied)
    TriggerClientEvent('ddfw-killfeed:client:feed', -1, '<img src="img/skull.png" width="15px" style="margin-top: 2px;"> <strong>' .. tostring(whoDied) .. '</strong>')
end)