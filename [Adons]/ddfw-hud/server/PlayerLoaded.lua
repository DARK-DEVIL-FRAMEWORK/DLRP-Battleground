RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(src)
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('ddfw-hud:client:UpdateSettings', src, preferences[identifier])
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])

    end
    TriggerClientEvent('codem-blackhudv2:SetForceHide', src, false)
    TriggerClientEvent('ddfw-hud:UpdateNitroData', src, nitro)
    TriggerClientEvent('ddfw-hud:Loaded', src)
end)

RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    local identifier = GetIdentifier(src)
    CheckPreferencesExist(identifier)
    TriggerClientEvent('ddfw-hud:client:UpdateSettings', src,  preferences[identifier])
    if Config.UseStress then
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])

    end
    TriggerClientEvent('ddfw-hud:UpdateNitroData', src, nitro)
    TriggerClientEvent('codem-blackhudv2:SetForceHide', src, false)
    TriggerClientEvent('ddfw-hud:Loaded', src)

end)