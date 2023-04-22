frameworkObject = nil

Citizen.CreateThread(function()
    frameworkObject = GetFrameWork()
end)

RegisterServerEvent('seatbelt:server:PlaySound')
AddEventHandler('seatbelt:server:PlaySound', function(action, passengers)
    local src = source
    pass = json.decode(passengers)
    for _, ped in ipairs(pass) do
        local vol = (src == ped and 0.25 or 0.20)
        if ped then
            TriggerClientEvent('seatbelt:client:PlaySound', ped, action, vol)
        end
    end
end)
