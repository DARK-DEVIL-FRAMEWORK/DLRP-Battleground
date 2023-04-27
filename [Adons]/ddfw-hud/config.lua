Config = {}
Config.Framework = "newqb" -- newqb, oldqb, esx
Config.UseLegacyFuel = true
Config.HideRadarOnFoot = true  -- if true Hide the map when you're walking
Config.EnableAmmoHud = true
Config.HudCommand = "hud"
Config.EnableHudCommand = true
Config.SpeedType = "kmh" -- kmh, mph

Config.GetVehicleFuel = function(vehicle)
    if Config.UseLegacyFuel then
        return exports["LegacyFuel"]:GetFuel(vehicle)
    else
        return GetVehicleFuelLevel(vehicle)
    end
end



Config.Notification = function(message, type, time)
    TriggerEvent("codem-cyberhud:Notify", message, type, time)
end
Config.DefaultCruiseControlKey = "j"
Config.DefaultSeatbeltControlKey = "k"

Config.EnableSpamNotification = true
Config.Notifications = {
    ["took_off_seatbelt"] = {
        type = "succes",
        message = "You took off your seatbelt.",
        time = 2500
    },
    ["took_seatbelt"] = {
        type = "succes",
        message = "You put on your seatbelt.",
        time = 2500
    },
    ["cruise_actived"] = {
        type = "info",
        message = "Cruise actived.",
        time = 2500
    },
    ["cruise_disabled"] = {
        type = "error",
        message = "Cruise disabled.",
        time = 2500
    },
    ["spam"] = {
        type = "error",
        message = "Please wait for a few seconds.",
        time = 2500
    },
}
Config.ejectVelocity = (60 / 2.236936)
Config.unknownEjectVelocity = (70 / 2.236936)
Config.unknownModifier = 17.0 --  Default: 17.0,
Config.minDamage = 30