local QBCore = exports['ddfw-core']:GetCoreObject()
local umadmin,minpage,disablecontrol = false,false,false
local vehicles,weapons = {},{}


local function nuiWalks(bool)
    disablecontrol = bool
    while disablecontrol do
        DisableControlAction(0, 1, true) -- disable mouse look
        DisableControlAction(0, 2, true) -- disable mouse look
        DisableControlAction(0, 3, true) -- disable mouse look
        DisableControlAction(0, 4, true) -- disable mouse look
        DisableControlAction(0, 5, true) -- disable mouse look
        DisableControlAction(0, 6, true) -- disable mouse look
        DisableControlAction(0, 263, true) -- disable melee
        DisableControlAction(0, 264, true) -- disable melee
        DisableControlAction(0, 257, true) -- disable melee
        DisableControlAction(0, 140, true) -- disable melee
        DisableControlAction(0, 141, true) -- disable melee
        DisableControlAction(0, 142, true) -- disable melee
        DisableControlAction(0, 143, true) -- disable melee
        DisableControlAction(0, 177, true) -- disable escape
        DisableControlAction(0, 200, true) -- disable escape
        DisableControlAction(0, 202, true) -- disable escape
        DisableControlAction(0, 322, true) -- disable escape
        --DisableControlAction(0, 245, true) -- disable chat
        DisableControlAction(0, 24, true) -- disable
    Wait(5)
    end
end

--- Event [Nui]
RegisterNetEvent('ddfw-admin:client:openMenu', function()
    if not umadmin then
        QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetNuiFocus(true,true)
            SendNUIMessage({type = "panel", result = result})
        end)
        umadmin = true
    end
end)

RegisterNetEvent('ddfw-admin:client:getPlayerProfile', function(data)
    SendNUIMessage({type = "playerprofile", data = data})
end)

RegisterNetEvent('ddfw-admin:client:getMoney', function(totalmoney,moneytype)
    SendNUIMessage({type = "money", totalmoney = totalmoney, moneytype = moneytype})
end)


--- Callback [Nui]
RegisterNUICallback("ddfw-admin:nuicallback:getPlayers", function()
    QBCore.Functions.TriggerCallback('ddfw-admin:callback:getplayers', function(players)
        SendNUIMessage({type="getplayers", players = players})
    end)
end)

RegisterNUICallback("ddfw-admin:nuicallback:setMinPage", function()
    SetNuiFocusKeepInput(true)
    nuiWalks(true)
end)

RegisterNUICallback("ddfw-admin:nuicallback:getPlayerProfile", function(player)
    TriggerServerEvent('ddfw-admin:server:getPlayerProfile',player)
end)

RegisterNUICallback('ddfw-admin:nuicallback:getVehicles', function()
    SendNUIMessage({type="vehicles",vehicles=vehicles})
end)

RegisterNUICallback('ddfw-admin:nuicallback:getWeapons', function()
    SendNUIMessage({type="weapons",weapons=weapons})
end)

RegisterNUICallback('ddfw-admin:nuicallback:weather', function(weather)
    TriggerServerEvent('ddfw-weathersync:server:setWeather',weather)
    QBCore.Functions.Notify(Lang:t("weather.weather_changed", weather))
end)

RegisterNUICallback('ddfw-admin:nuicallback:time', function(time)
    TriggerServerEvent('ddfw-weathersync:server:setWeather', time, time)
    QBCore.Functions.Notify(Lang:t("time.changed", {time = time}))
end)

RegisterNUICallback("ddfw-admin:nuicallback:toggleMutePlayer", function(player)
    exports['pma-voice']:toggleMutePlayer(player)
end)

RegisterNUICallback('ddfw-admin:client:viewdistance', function(value)
    SetEntityViewDistance(value)
    QBCore.Functions.Notify(Lang:t("info.entity_view_distance", {distance = value}))
end)

RegisterNUICallback("ddfw-admin:nuicallback:event", function(data)
    if data[1] == 'client' then
        TriggerEvent(data[2],data[3])
    elseif data[1] == 'server' then
        TriggerServerEvent(data[2],data[3])
    elseif data[1] == 'command' then
        TriggerServerEvent('QBCore:CallCommand',data[2],{data[3]})
    elseif data[1] == 'adminserver' then
        TriggerServerEvent("ddfw-admin:server:"..data[2], data[3])
    elseif data[1] == 'kickorban' then
        TriggerServerEvent("ddfw-admin:server:"..data[2], data)
    end
end)

RegisterNUICallback("ddfw-admin:nuicallback:toFullPage", function()
    nuiWalks(false)
    SetNuiFocusKeepInput(false)
end)

RegisterNUICallback("ddfw-admin:nuicallback:escapeNui", function()
    nuiWalks(false)
    SetNuiFocusKeepInput(false)
	SetNuiFocus(false,false)
	umadmin = false
end)


CreateThread(function()
    for k, v in pairs(QBCore.Shared.Vehicles) do
        local category = v["category"]
        if vehicles[category] == nil then
            vehicles[category] = { }
        end
        vehicles[category][k] = v
    end
    for _,v in pairs(QBCore.Shared.Weapons) do
        weapons[v.label] = v
    end
end)

