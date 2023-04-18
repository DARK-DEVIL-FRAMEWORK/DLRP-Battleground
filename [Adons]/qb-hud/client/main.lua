frameworkObject = nil
nuiReady = false
Citizen.CreateThread(function()
    frameworkObject = GetFrameWork()
    while not nuiReady do
        Citizen.Wait(0)
    end
    if Config.Framework == "esx" then
        Citizen.Wait(1000)
        while true do
            if frameworkObject ~= nil then
                if frameworkObject.GetPlayerData() then
                    while frameworkObject.GetPlayerData().job == nil do
                        Citizen.Wait(0)
                    end
                    SendNUIMessage({
                        type = "update_job",
                        job = frameworkObject.GetPlayerData().job.label
                    })
                    for k, v in pairs(frameworkObject.GetPlayerData().accounts) do
                        if v.name == "money" then
                            local money = v.money
                            SendNUIMessage({
                                type = "update_money",
                                money = money
                            })
                        end
                    end
                    SendNUIMessage({
                        type = "hide_vehhud",
                        hideRadar = Config.HideRadarOnFoot,
                    })
                    Togglehud(true)
                    
                    return
                end
            end
            Citizen.Wait(0)
        end
    else
        Citizen.Wait(1000)

        while true do
            Citizen.Wait(0)
            if frameworkObject ~= nil then
                local Player = frameworkObject.Functions.GetPlayerData()
                if Player then
                    if Player.job ~= nil then
                        SendNUIMessage({
                            type = "update_job",
                            job =  Player.job.label
                        })
                    end
                    if Player.money ~= nil then
                        SendNUIMessage({
                            type = "update_money",
                            money = Player.money.cash
                        })
                        SendNUIMessage({
                            type = "hide_vehhud",
                            hideRadar = Config.HideRadarOnFoot,
                        })

                        break
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        SetBigmapActive(false, false)
    end
end)

local zones = {
	["AIRP"] = "Los Santos International Airport",
	["ALAMO"] = "Alamo Sea",
	["ALTA"] = "Alta",
	["ARMYB"] = "Fort Zancudo",
	["BANHAMC"] = "Banham Canyon Dr",
	["BANNING"] = "Banning",
	["BEACH"] = "Vespucci Beach",
	["BHAMCA"] = "Banham Canyon",
	["BRADP"] = "Braddock Pass",
	["BRADT"] = "Braddock Tunnel",
	["BURTON"] = "Burton",
	["CALAFB"] = "Calafia Bridge",
	["CANNY"] = "Raton Canyon",
	["CCREAK"] = "Cassidy Creek",
	["CHAMH"] = "Chamberlain Hills",
	["CHIL"] = "Vinewood Hills",
	["CHU"] = "Chumash",
	["CMSW"] = "Chiliad Mountain State Wilderness",
	["CYPRE"] = "Cypress Flats",
	["DAVIS"] = "Davis",
	["DELBE"] = "Del Perro Beach",
	["DELPE"] = "Del Perro",
	["DELSOL"] = "La Puerta",
	["DESRT"] = "Grand Senora Desert",
	["DOWNT"] = "Downtown",
	["DTVINE"] = "Downtown Vinewood",
	["EAST_V"] = "East Vinewood",
	["EBURO"] = "El Burro Heights",
	["ELGORL"] = "El Gordo Lighthouse",
	["ELYSIAN"] = "Elysian Island",
	["GALFISH"] = "Galilee",
	["GOLF"] = "GWC and Golfing Society",
	["GRAPES"] = "Grapeseed",
	["GREATC"] = "Great Chaparral",
	["HARMO"] = "Harmony",
	["HAWICK"] = "Hawick",
	["HORS"] = "Diamond Casino And Resort",
	["HUMLAB"] = "Humane Labs and Research",
	["ISHEIST"] = "Cayo Perico",
	["JAIL"] = "Bolingbroke Penitentiary",
	["KOREAT"] = "Little Seoul",
	["LACT"] = "Land Act Reservoir",
	["LAGO"] = "Lago Zancudo",
	["LDAM"] = "Land Act Dam",
	["LEGSQU"] = "Legion Square",
	["LMESA"] = "La Mesa",
	["LOSPUER"] = "La Puerta",
	["MIRR"] = "Mirror Park",
	["MORN"] = "Morningwood",
	["MOVIE"] = "Richards Majestic",
	["MTCHIL"] = "Mount Chiliad",
	["MTGORDO"] = "Mount Gordo",
	["MTJOSE"] = "Mount Josiah",
	["MURRI"] = "Murrieta Heights",
	["NCHU"] = "North Chumash",
	["NOOSE"] = "N.O.O.S.E",
	["OCEANA"] = "Pacific Ocean",
	["PALCOV"] = "Paleto Cove",
	["PALETO"] = "Paleto Bay",
	["PALFOR"] = "Paleto Forest",
	["PALHIGH"] = "Palomino Highlands",
	["PALMPOW"] = "Palmer-Taylor Power Station",
	["PBLUFF"] = "Pacific Bluffs",
	["PBOX"] = "Pillbox Hill",
	["PROCOB"] = "Procopio Beach",
	["RANCHO"] = "Rancho",
	["RGLEN"] = "Richman Glen",
	["RICHM"] = "Richman",
	["ROCKF"] = "Rockford Hills",
	["RTRAK"] = "Redwood Lights Track",
	["SANAND"] = "San Andreas",
	["SANCHIA"] = "San Chianski Mountain Range",
	["SANDY"] = "Sandy Shores",
	["SKID"] = "Mission Row",
	["SLAB"] = "Stab City",
	["STAD"] = "Maze Bank Arena",
	["STRAW"] = "Strawberry",
	["TATAMO"] = "Tataviam Mountains",
	["TERMINA"] = "Terminal",
	["TEXTI"] = "Textile City",
	["TONGVAH"] = "Tongva Hills",
	["TONGVAV"] = "Tongva Valley",
	["VCANA"] = "Vespucci Canals",
	["VESP"] = "Vespucci",
	["VINE"] = "Vinewood",
	["WINDF"] = "Ron Alternates Wind Farm",
	["WVINE"] = "West Vinewood",
	["ZANCUDO"] = "Zancudo River",
	["ZP_ORT"] = "Port of South Los Santos",
	["ZQ_UAR"] = "Davis Quartz",
}
local cruiseIsOn = false
local cruiseSpeed = 999.0

RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(data)
    SendNUIMessage({
        type = "update_money",
        money = data.money.cash
    })
    SendNUIMessage({
        type = "update_job",
        job =  data.job.label
    })
end)

RegisterNetEvent("esx:setPlayerData")
AddEventHandler("esx:setPlayerData", function(key, val)


    if key == "job" then
        SendNUIMessage({
            type = "update_job",
            job = val.label
        })
    end
    if key == "accounts" then
        for k, v in pairs(val) do
            if v.name == "money" then
                local money = v.money
                SendNUIMessage({
                    type = "update_money",
                    money = money
                })
            end
        end
    end
end)
RegisterNUICallback("Ready", function(data, cb)
    nuiReady = true
end)

RegisterKeyMapping('cruise', 'Cruise Control', 'keyboard', Config.DefaultCruiseControlKey)
local cruiseSpam = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if cruiseSpam > 0 then
            Citizen.Wait(3500)
            cruiseSpam = 0
        end
    end
end)

RegisterCommand('cruise', function()
    if cruiseSpam >= 3 then
        if Config.EnableSpamNotification  then
            Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"], Config.Notifications["spam"]["time"])
        end
        return
    end
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    if (GetPedInVehicleSeat(vehicle, -1) == player and vehicle ~= 0) then
        cruiseIsOn = not cruiseIsOn
        if cruiseIsOn then
            Config.Notification(Config.Notifications["cruise_actived"]["message"], Config.Notifications["cruise_actived"]["type"], Config.Notifications["cruise_actived"]["time"])
        else
            Config.Notification(Config.Notifications["cruise_disabled"]["message"], Config.Notifications["cruise_disabled"]["type"], Config.Notifications["cruise_disabled"]["time"])
        end
        local currSpeed = GetEntitySpeed(vehicle)
        cruiseSpeed = currSpeed
        local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
        SetEntityMaxSpeed(vehicle, maxSpeed)
        SendNUIMessage({type = "toggle_cruise", toggle = cruiseIsOn})
        cruiseSpam = cruiseSpam + 1
    end
end, false)

Citizen.CreateThread(function()
    while true do 
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player, true)
        local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
        local vehicleIsLightsOn
        if vehicleLights == 1 and vehicleHighlights == 0 then
            vehicleIsLightsOn = 'normal'
        elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
            vehicleIsLightsOn = 'high'
        else
            vehicleIsLightsOn = 'off'
        end
        SendNUIMessage({type = "update_ligths", state = vehicleIsLightsOn})
        Citizen.Wait(400)
    end
end)


SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage);
local seatbeltOn = false



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsPedInAnyVehicle(PlayerPedId()) then
            if seatbeltOn then
                DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            end
        else
            if seatbeltOn then
                toggleSeatbelt(false, false)
            end
        end
    end
end)

Citizen.CreateThread(function()


    while true do
        local player = PlayerPedId()
        local oxygen = 0
        if IsEntityInWater(player) then
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
        else
            oxygen = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
        end
        SendNUIMessage({ type="set_stamina", oxygen = oxygen})
        Citizen.Wait(500)
    end
end)

local lastCheckIsAlreadyEngineRunning = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= 0 then
            local isRunning = GetIsVehicleEngineRunning(vehicle)
            if isRunning ~= lastCheckIsAlreadyEngineRunning then
                lastCheckIsAlreadyEngineRunning = isRunning
                if isRunning then
                    SendNUIMessage({
                        type = "toggle_engine",
                        toggle = true,
                    })
                else
                    SendNUIMessage({
                        type = "toggle_engine",
                        toggle = false,
                    })
                end
            end
        end
    end
end)
RegisterKeyMapping('seatbelt', 'Toggle Seatbelt', 'keyboard', Config.DefaultSeatbeltControlKey)
local seatbeltSpam = 0

RegisterCommand('seatbelt', function(source, args, rawCommand)
    if seatbeltSpam >= 3 then
        if Config.EnableSpamNotification  then
            Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"], Config.Notifications["spam"]["time"])
        end
        return
    end
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local class = GetVehicleClass(GetVehiclePedIsIn(ped))
        if class ~= 8 and class ~= 13 and class ~= 14 then
            toggleSeatbelt(true)
            if seatbeltOn then
                Config.Notification(Config.Notifications["took_seatbelt"]["message"], Config.Notifications["took_seatbelt"]["type"], Config.Notifications["took_seatbelt"]["time"])
            else
                Config.Notification(Config.Notifications["took_off_seatbelt"]["message"], Config.Notifications["took_off_seatbelt"]["type"], Config.Notifications["took_off_seatbelt"]["time"])
            end
            seatbeltSpam = seatbeltSpam + 1
        end
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if seatbeltSpam > 0 then
            Citizen.Wait(3500)
            seatbeltSpam = 0
        end
    end
end)

function toggleSeatbelt(makeSound, toggle)

    if toggle == nil then
        if seatbeltOn then
            playSound("unbuckle")
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
            SendNUIMessage({
                type="update_seatbelt",
                toggle = false

            })
        else
            playSound("buckle")
            SendNUIMessage({
                type="update_seatbelt",
                toggle = true
            })
            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
        end
        seatbeltOn = not seatbeltOn
    else
        if toggle then
            
            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            SendNUIMessage({
                type="update_seatbelt",
                toggle = true

            })
            playSound("buckle")
        
        else
         
            SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
            SendNUIMessage({
                type="update_seatbelt",
                toggle = false
            })
            playSound("unbuckle")
        end
        seatbeltOn = toggle

    end
end

function playSound(action)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local maxpeds = GetVehicleMaxNumberOfPassengers(veh) - 2
    local passengers = {}
    for i = -1, maxpeds do
        if not IsVehicleSeatFree(veh, i) then
            local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)) )
            table.insert(passengers, ped)
        end
    end
    TriggerServerEvent('seatbelt:server:PlaySound', action, json.encode(passengers))
end

RegisterNetEvent('seatbelt:client:PlaySound')
AddEventHandler('seatbelt:client:PlaySound', function(action, volume)
    SendNUIMessage({type = action, volume = volume})
end)




function GetZoneNameLabel(zoneName)
	if zones[zoneName] then
		return zones[zoneName]
	else
		return zoneName
	end
end
Citizen.CreateThread(function()
    Citizen.Wait(1500)
    SetBlipAlpha(GetNorthRadarBlip(), 0)
end)

local width = 0.2185
Citizen.CreateThread(function()
    Citizen.Wait(3000)
    SendNUIMessage({type = "playerid_update", playerid = GetPlayerServerId(PlayerId())})
    SendNUIMessage({type = "resourceName", resourcename = GetCurrentResourceName()})
    SendNUIMessage({type = "hideradaronfoot", toggle = Config.HideRadarOnFoot})

    
end)


local lastBodyHealth = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        if IsPedInAnyVehicle(PlayerPedId()) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if vehicle then
                local health = GetVehicleBodyHealth(vehicle)
                if health ~= lastBodyHealth then
                    SendNUIMessage({
                        type = "shake",
                    })
                    lastBodyHealth = health
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
	RequestStreamedTextureDict("squaremap", false)
	while not HasStreamedTextureDictLoaded("squaremap") do
        Wait(0)
	end

    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
	SetMinimapClipType(0)
    
    local x, y = GetActiveScreenResolution()
    SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.002, 0.1338, 0.18)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.2, 0.0, 0.065, 0.20)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.003, 0.035, width, 0.249)
    if x == 1600 and y == 900 then
        width = 0.26
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.007, 0.035, width, 0.291)
    end
    if x == 1366 and y == 768 then
        width = 0.3
        SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.040, 0.1338, 0.18)
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.007, 0.035, width, 0.347)
        
    end

    if x == 1280 and y == 1024 then
        width = 0.327
        SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.010, 0.1338, 0.18)
        
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.001, 0.04, width, 0.26)
        
    end
    if x == 1280 and y == 720 then
        width = 0.325
        SetMinimapComponentPosition("minimap", "L", "B", 0.0, -0.040, 0.1338, 0.18)
        
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.008, 0.04, width, 0.37)
        
    end
    SetMinimapClipType(0)
    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)

end)


local lastZone = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3500)
        local playerPed = PlayerPedId()
        local position = GetEntityCoords(playerPed)
        local zoneName = GetZoneNameLabel(GetNameOfZone(position.x, position.y, position.z))
        if lastZone ~= zoneName then
            SendNUIMessage({
                type = "location_update",
                location_name = GetZoneNameLabel(GetNameOfZone(position.x, position.y, position.z)),
            })
            lastZone = zoneName
        end
    end
end)



local lastArmour = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        local playerPed = PlayerPedId()
        local armour = GetPedArmour(playerPed)
        if lastArmour ~= armour then
            SendNUIMessage({
                type = "armour_update",
                armour = armour,
            })
            lastArmour = armour
        end
    end
end)

local lastHealth = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(550)
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed)
        if lastHealth ~= health then
            SendNUIMessage({
                type = "health_update",
                health = health,
            })
            if lastHealth ~= nil then
                if health < lastHealth then
                    SendNUIMessage({
                        type = "shake",
                        
                    })
                end
            end

            lastHealth = health
        end
    end
end)
local speedMultiplier = 3.6

Citizen.CreateThread(function()
    Citizen.Wait(750)
    if Config.SpeedType ~= "kmh" then
        speedMultiplier = 2.236936
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsPedInAnyVehicle(PlayerPedId()) then

            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if vehicle then
                local currSpeed = GetEntitySpeed(vehicle)    
                local speed = ("%.1d"):format(math.ceil(currSpeed * speedMultiplier)) 
                SendNUIMessage({
                    type = "speed_update",
                    speed = speed,
                    rpm =  GetVehicleCurrentRpm(vehicle),
                })
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(PlayerPedId()) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if vehicle then
                local fuel = Config.GetVehicleFuel(vehicle)
                SendNUIMessage({
                    type = "fuel_update",
                    fuel = fuel,
                })
            end
        end
        Citizen.Wait(1700)

    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local hours = GetClockHours()
        local minutes = GetClockMinutes()
        if hours < 10 then 
            hours = '0'..hours 
        end
        if minutes < 10 then 
            minutes = '0'..minutes 
        end
        SendNUIMessage({type = "clock_update", minutes = minutes, hours=hours})
    end
end)

RegisterNetEvent("codem-cyberhud:Notify")
AddEventHandler("codem-cyberhud:Notify", function(message, type, time)
    SendNUIMessage({
        type = "send_notification",
        message = message,
        notifytype = type,
        time = time,
    })
end)

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges) 
    SendNUIMessage({type = "talking_radius", radius = index  + 1})
 end)

RegisterNetEvent('SaltyChat_TalkStateChanged')
AddEventHandler('SaltyChat_TalkStateChanged', function(isTalking)
    SendNUIMessage({type = "talking", talking = isTalking})
end)

local draw = false
local lastGameView = nil
local lastAmmo = nil

Citizen.CreateThread(function()
    if Config.EnableAmmoHud then
        while true do
            local html = ""
            if draw then
                local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
                local _, ammo = GetAmmoInClip(PlayerPedId(), weaponHash)
                local maxammo = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)
                if IsControlPressed(0, 24) or lastAmmo ~= ammo  then
                    if  IsPedArmed(PlayerPedId(), 4 ) then
                        Citizen.Wait(200)
                        SendNUIMessage({type = "update_weapon_ammo", maxammo = maxammo-ammo, ammo = ammo})
                        lastAmmo = ammo
                    end 
        
                end
            end

            if IsControlPressed(0, 25) and IsPedArmed(PlayerPedId(), 4) then -- if is armed and is aiming
                if not draw then
                    local gameView = GetFollowPedCamViewMode()
                    local isStealth = GetPedStealthMovement(PlayerPedId())
                    lastGameView = gameView
                    local coords = GetPedBoneCoords(PlayerPedId(), 0x67F2, 0.0, 0.0, 0.0) --HEAD
                    local x = 47.691905498505
                    local y = 66.413694620132
                    local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
                    local maxammo = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)
                    if gameView == 0 then
                        if maxammo == 0 then
                            y = 59.413694620132
                            x = 40.891905498505
                               
                        elseif maxammo >= 100 then
                            y = 59.413694620132
                            x = 40.291905498505
                        elseif maxammo < 100 then
                            y = 59.413694620132
                            x = 40.291905498505
                        end
                    end
                    if gameView == 1 then
                        if maxammo == 0 then
                            y = 56.313694620132
                            x = 44.091905498505
                        elseif maxammo >= 100 then
                            y = 55.513694620132
                            x = 43.991905498505
                        elseif maxammo < 100 then
                            y = 55.513694620132
                            x = 43.991905498505
                        end
                  
                    end
                    if gameView == 2 then
                        if maxammo == 0 then
                            y = 53.313694620132
                            x = 46.591905498505
                        elseif maxammo >= 100 then
        
                            y = 52.913694620132
                            x = 46.691905498505
                        elseif maxammo < 100 then
                            y = 52.913694620132
                            x = 46.691905498505
                        end
                    end

                    if gameView == 4 then
                        if maxammo == 0 then
                            x = 49.991905498505
                            y = 66.013694620132
                        end
                    end
                    if gameView == 3 or IsPedWalking(PlayerPedId()) or IsPedRunning(PlayerPedId()) or (isStealth and gameView ~= 4) or not IsPedOnFoot(PlayerPedId()) then
                        html = ""
                        SendNUIMessage({type = "update_ammo", html = html})
                        draw = true
                    else
                    
                        html = "<div class='ammo-container' style=\"left: "..x.."%;top: "..y.."%; position: fixed;\"> <p class='max-ammo'>120</p><p class='ammo'>12</p></div>"
                        SendNUIMessage({type = "update_ammo", html = html})
                        draw = true
                        local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
                        local _, ammo = GetAmmoInClip(PlayerPedId(), weaponHash)
                        local maxammo = GetAmmoInPedWeapon(PlayerPedId(), weaponHash)
            
                        SendNUIMessage({type = "update_weapon_ammo", maxammo = maxammo-ammo, ammo = ammo})
                    end
                
                end
                if draw then
                    local gameView = GetFollowPedCamViewMode() 
                    local isStealth = GetPedStealthMovement(PlayerPedId())
                    if lastGameView ~= gameView or isStealth or   ((IsPedWalking(PlayerPedId()) or IsControlJustPressed(0, 21)) and gameView ~= 4) or IsPedReloading(PlayerPedId()) then
                        draw = false
                    end
                end
              
            else
                if draw then
                    SendNUIMessage({type = "update_ammo", html = ""})
                    draw = false
                end
            end
    
            Citizen.Wait(0)
        end
    end
end)

local checkTalkStatus = false
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        if NetworkIsPlayerTalking(PlayerId()) then
            if not checkTalkStatus then
                checkTalkStatus = true
                SendNUIMessage({type = "talking", talking = true})
            end
        else
            if checkTalkStatus then
                checkTalkStatus = false
                SendNUIMessage({type = "talking", talking = false})
            end
        end
        Citizen.Wait(300)
    end
end)


RegisterNetEvent('pma-voice:setTalkingMode')
AddEventHandler('pma-voice:setTalkingMode', function(voiceMode) 
    SendNUIMessage({type = "talking_radius", radius = voiceMode})

end)

RegisterNetEvent("mumble:SetVoiceData")
AddEventHandler("mumble:SetVoiceData", function(player, key, value) 
    if GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())) == player and key == 'mode' then
         SendNUIMessage({type = "talking_radius", radius = value})
    end
end)

function Togglehud(toggle)
    SendNUIMessage({
        type = "displayhud",
        toggle = toggle,
    })
end

RegisterNetEvent("codem-cyberhud:Displayhud")
AddEventHandler("codem-cyberhud:Displayhud", function(toggle)
    Togglehud(toggle)
end)

display = true

if Config.EnableHudCommand then
    RegisterCommand(Config.HudCommand, function()
        display = not display
        TriggerEvent("codem-cyberhud:Displayhud", display)
    end)
end
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Togglehud(true)
end)
local pauseActive = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(350)
        if IsPauseMenuActive() and not pauseActive then
            pauseActive = true
            TriggerEvent("codem-cyberhud:Displayhud", false)  
        end
        if not IsPauseMenuActive() and  pauseActive then
            if display then
                pauseActive = false
                TriggerEvent("codem-cyberhud:Displayhud", true)    
            end
        end
    end
end)


local alreadyInVehicle = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(700)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= 0 then
            if not alreadyInVehicle then
                SendNUIMessage({
                    type = "show_vehhud",
                    hideRadar = Config.HideRadarOnFoot,
                })

                alreadyInVehicle = true
            end
            DisplayRadar(true)
        else
            if alreadyInVehicle then
                SendNUIMessage({
                    type = "hide_vehhud",
                    hideRadar = Config.HideRadarOnFoot,
                })
                alreadyInVehicle = false
            end
            if Config.HideRadarOnFoot then
                DisplayRadar(false)
            else
                DisplayRadar(true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(6) -- VEHICLE_NAME
        HideHudComponentThisFrame(7) -- AREA_NAME
        HideHudComponentThisFrame(8) -- VEHICLE_CLASS
        HideHudComponentThisFrame(9) -- STREET_NAME
        HideHudComponentThisFrame(3) -- CASH
        HideHudComponentThisFrame(4) -- MP_CASH
        if Config.EnableAmmoHud then
            DisplayAmmoThisFrame(false)
        end
    end
end)