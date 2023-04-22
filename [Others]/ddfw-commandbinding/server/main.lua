local QBCore = exports['ddfw-core']:GetCoreObject()

QBCore.Commands.Add("binds", "Open commandbinding menu", {}, false, function(source, _)
	TriggerClientEvent("ddfw-commandbinding:client:openUI", source)
end)

RegisterNetEvent('ddfw-commandbinding:server:setKeyMeta', function(keyMeta)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)

    ply.Functions.SetMetaData("commandbinds", keyMeta)
end)
