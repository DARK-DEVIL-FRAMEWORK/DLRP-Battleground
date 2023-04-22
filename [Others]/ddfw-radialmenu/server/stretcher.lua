RegisterNetEvent('ddfw-radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('ddfw-radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('ddfw-radialmenu:Stretcher:BusyCheck', function(id, type)
    TriggerClientEvent('ddfw-radialmenu:Stretcher:client:BusyCheck', id, source, type)
end)

RegisterNetEvent('ddfw-radialmenu:server:BusyResult', function(isBusy, otherId, type)
    TriggerClientEvent('ddfw-radialmenu:client:Result', otherId, isBusy, type)
end)