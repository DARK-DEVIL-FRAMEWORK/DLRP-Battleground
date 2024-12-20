local QBCore = exports['ddfw-core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('ddfw-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('ddfw-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('ddfw-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('ddfw-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('ddfw-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

QBCore.Functions.CreateCallback('ddfw-trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then cb(true) return end
    cb(false)
end)

QBCore.Commands.Add("getintrunk", Lang:t("general.getintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('ddfw-trunk:client:GetIn', source)
end)

QBCore.Commands.Add("putintrunk", Lang:t("general.putintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('ddfw-trunk:server:KidnapTrunk', source)
end)