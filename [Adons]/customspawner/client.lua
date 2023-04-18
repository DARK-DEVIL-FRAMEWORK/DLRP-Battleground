--		Created by Wallbanged				--
--		Custom Add-On Spawner V 1.0.0			--



local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('DLRP', "", 1420, 0) --  Enter Server Name/ Menu Name Here
local submain = menuPool:AddSubMenu(mainMenu, 'Vehicle Spawner', "", 1420, 0)
local vehiclesMenu = menuPool:AddSubMenu(submain, 'Vehicles', "", 1420, 0) -- Name whatever you'd like for categorization
local policeVehiclesMenu = menuPool:AddSubMenu(vehiclesMenu, 'Cars',"", 1420, 0)
local sheriffVehiclesMenu = menuPool:AddSubMenu(vehiclesMenu, 'Bikes', "", 1420, 0)
-- local chpVehiclesMenu = menuPool:AddSubMenu(vehiclesMenu, 'CHP Vehicles', "",1420, 0)

--policeVehiclesMenu:AddItem(NativeUI.CreateItem('~r~Coming Soon!', 'Get this vehicle.') )
-- chpVehiclesMenu:AddItem(NativeUI.CreateItem('~r~Coming Soon!', 'Get this vehicle.') )

local soVehiceMenus = {}
soVehiceMenus.so12 = NativeUI.CreateItem('Bati', 'Get this vehicle.')
soVehiceMenus.so13 = NativeUI.CreateItem('Thrust', 'Get this vehicle.')
soVehiceMenus.so1 = NativeUI.CreateItem('Bati 801RR', 'Get this vehicle.')
soVehiceMenus.so6 = NativeUI.CreateItem('Hakuchou', 'Get this vehicle.')
soVehiceMenus.so8 = NativeUI.CreateItem('Hakuchou Drag', 'Get this vehicle.')
soVehiceMenus.so3 = NativeUI.CreateItem('Shinobi', 'Get this vehicle.')
soVehiceMenus.so7 = NativeUI.CreateItem('Carbon RS', 'Get this vehicle.')
soVehiceMenus.so11 = NativeUI.CreateItem('Vindicator', 'Get this vehicle.') 
soVehiceMenus.so9 = NativeUI.CreateItem('Double-T', 'Get this vehicle.') 
soVehiceMenus.so5 = NativeUI.CreateItem('-', 'Get this vehicle.') 
soVehiceMenus.so15 = NativeUI.CreateItem('-', 'Get this vehicle.') 
soVehiceMenus.so4 = NativeUI.CreateItem('-', 'Get this vehicle.') 
soVehiceMenus.so10 = NativeUI.CreateItem('-', 'Get this vehicle.') 

sheriffVehiclesMenu:AddItem(soVehiceMenus.so12)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so13)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so1)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so6)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so8)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so3)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so7)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so11)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so9)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so5)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so15)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so4)
sheriffVehiclesMenu:AddItem(soVehiceMenus.so10)

local pdVehiceMenus = {}
pdVehiceMenus.pd1 = NativeUI.CreateItem('Cheetah Classic', 'Get this vehicle.')
pdVehiceMenus.pd7 = NativeUI.CreateItem('Sultan RS', 'Get this vehicle.')
pdVehiceMenus.pd17 = NativeUI.CreateItem('Sugoi', 'Get this vehicle.')
pdVehiceMenus.pd11 = NativeUI.CreateItem('vectre', 'Get this vehicle.')
pdVehiceMenus.pd15 = NativeUI.CreateItem('omnis', 'Get this vehicle.')
pdVehiceMenus.pdhoe = NativeUI.CreateItem('tenf2', 'Get this vehicle.')
pdVehiceMenus.pd12 = NativeUI.CreateItem('elegy2', 'Get this vehicle.')
pdVehiceMenus.pd9 = NativeUI.CreateItem('jugular', 'Get this vehicle.')

policeVehiclesMenu:AddItem(pdVehiceMenus.pd1)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd7)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd17)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd11)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd15)
policeVehiclesMenu:AddItem(pdVehiceMenus.pdhoe)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd12)
policeVehiclesMenu:AddItem(pdVehiceMenus.pd9)

sheriffVehiclesMenu.OnItemSelect = function(sender, item, index)
    if item == soVehiceMenus.so12 then
        deleteVeh()
        spawnVehicle('bati', 'Bati')
    elseif item == soVehiceMenus.so13 then
        deleteVeh()
        spawnVehicle('thrust', 'Thrust')
    elseif item == soVehiceMenus.so1 then
        deleteVeh()
        spawnVehicle('bati2', 'Bati 801RR')
    elseif item == soVehiceMenus.so6 then
        deleteVeh()
        spawnVehicle('hakuchou', 'Hakuchou')
    elseif item == soVehiceMenus.so8 then
        deleteVeh()
        spawnVehicle('hakuchou2', 'Hakuchou Drag')
    elseif item == soVehiceMenus.so3 then
        deleteVeh()
        spawnVehicle('shinobi', 'Shinobi')
    elseif item == soVehiceMenus.so7 then
        deleteVeh()
        spawnVehicle('carbonrs', 'Carbon RS')
    elseif item == soVehiceMenus.so11 then
        deleteVeh()
        spawnVehicle('vindicator', 'Vindicator')
    elseif item == soVehiceMenus.so9 then
        deleteVeh()
        spawnVehicle('double', 'Double-T')
    elseif item == soVehiceMenus.so5 then
        deleteVeh()
        spawnVehicle('-', '2018 Charger')
    elseif item == soVehiceMenus.so15 then
        deleteVeh()
        spawnVehicle('-', '2016 Explorer')
    elseif item == soVehiceMenus.so4 then
        deleteVeh()
        spawnVehicle('-', '2014 Charger')
    elseif item == soVehiceMenus.so10 then
        deleteVeh()
        spawnVehicle('-', '2013 Tahoe')
    end
end

policeVehiclesMenu.OnItemSelect = function(sender, item, index)
    if item == pdVehiceMenus.pd1 then
        deleteVeh()
		spawnVehicle ('cheetah2', 'Cheetah Classic')
    elseif item == pdVehiceMenus.pd7 then
        deleteVeh()
		spawnVehicle ('sultanrs', 'Sultan RS')
    elseif item == pdVehiceMenus.pd17 then
        deleteVeh()
		spawnVehicle ('sugoi', 'Sugoi')
    elseif item == pdVehiceMenus.pd11 then
        deleteVeh()
		spawnVehicle ('vectre', 'Vectre')
    elseif item == pdVehiceMenus.pd15 then
        deleteVeh()
		spawnVehicle ('omnis', 'Omnis')
    elseif item == pdVehiceMenus.pdhoe then
        deleteVeh()
		spawnVehicle ('tenf2', '10 F')
    elseif item == pdVehiceMenus.pd12 then
        deleteVeh()
		spawnVehicle ('elegy2', 'Elegy RH8')
    elseif item == pdVehiceMenus.pd9 then
        deleteVeh()
		spawnVehicle ('jugular', 'Jugular')
	end
end
---------------------------------------------------------------------------------------------------------------
--[[                           EXAMPLE
local audi = menuPool:AddSubMenu(vehiclesMenu, 'Audi', "", 1420, 0)

local aVehiclesMenus = {}

aVehiclesMenus.a8audi = NativeUI.CreateItem('2010 Audi A8', 'Get this vehicle.')
aVehiclesMenus.audirs6tk = NativeUI.CreateItem('2013 Audi RS6 Avant', 'Get this vehicle.')
aVehiclesMenus.audis8om = NativeUI.CreateItem('2014 Audi S8', 'Get this vehicle.')
aVehiclesMenus.rs7 = NativeUI.CreateItem('2015 Audi RS7', 'Get this vehicle.')

audi:AddItem(aVehiclesMenus.a8audi)
audi:AddItem(aVehiclesMenus.audirs6tk)
audi:AddItem(aVehiclesMenus.audis8om)
audi:AddItem(aVehiclesMenus.rs7)

audi.OnItemSelect = function(sender, item, index)
    if item == aVehiclesMenus.a8audi then
        deleteVeh()
        spawnVehicle ('a8audi', '2010 Audi A8')
    elseif item == aVehiclesMenus.audirs6tk then
        deleteVeh()
        spawnVehicle ('audirs6tk', '2013 Audi RS6 Avant')
    elseif item == aVehiclesMenus.audis8om then
        deleteVeh()
        spawnVehicle ('audis8om', '2014 Audi S8')
    elseif item == aVehiclesMenus.rs7 then
        deleteVeh()
        spawnVehicle ('rs7', '2015 Audi RS7')
    end
end]]

RegisterCommand('wbmenu', function() -- edit this line to change the command to open the menu
    mainMenu:Visible(not mainMenu:Visible())
end, false)

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        if IsControlJustPressed(1, 243) then -- ~ is pressed

                    mainMenu:Visible(not mainMenu:Visible())

                end

            end

    end, false)

------------------------------------------------DO NOT EDIT BELOW THIS LINE---------------------------------------------------------------

function deleteVeh()
    local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

		if (IsPedSittingInAnyVehicle(ped)) then 
			local handle = GetVehiclePedIsIn(ped, false)
			NetworkRequestControlOfEntity(handle)
			SetEntityHealth(handle, 100)
			SetEntityAsMissionEntity(handle, true, true)
			SetEntityAsNoLongerNeeded(handle)
			DeleteEntity(handle)
            ShowInfo("The vehicle you were in has been deleted.")
        end
    end
end

function ShowInfo(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end


function spawnVehicle(vehicle, name)
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
        local color = "~y~"
        local color2 = "~r~"
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(ped) then
            vehiclehash = GetHashKey(vehicle)
            RequestModel(vehiclehash)
            Citizen.CreateThread(function() 
                local waiting = 0
                while not HasModelLoaded(vehiclehash) do
                    waiting = waiting + 100
                    Citizen.Wait(100)
                    if waiting > 5000 then
                        ShowInfo(color2 .."Could not load model in time. Crash was prevented.")
                        break
                    end
                end
                local spawnedVeh = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
                SetPedIntoVehicle(PlayerPedId(), spawnedVeh, -1)
                SetVehicleDirtLevel(spawnedVeh, 0.0)
            end)
            ShowInfo("You have recieved the keys to a ".. color .. name .. ".")
            Wait(1000)
            return true
    end
    ShowInfo("All parking spots are currently full.")
    return false
end


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

menuPool:MouseControlsEnabled(false)
menuPool:ControlDisablingEnabled(false)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)


function HelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end
