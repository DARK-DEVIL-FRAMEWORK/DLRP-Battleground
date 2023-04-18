local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1096554601181876415/irlpXJtTDEMqezmV1y1msuYTBO8pdFrmZn6qBJbvPQpKyenJMePggA46IYW5_hLdinqW" --put ur webhook

RegisterServerEvent('log')
AddEventHandler('log', function(data)



    local connect = {
        {
            ["color"] = "125",
            ["title"] = "New Report | " ..data.plate.."-"..data.lastname,
            ["description"] = "Discord Name: \n **"..data.plate.."** \n Report Type: \n **"..data.lastname.."** \n \n What Happened?: \n**"..data.why.."**\n INGAME NAME?:\n **"..data.plate.."**",
	        ["footer"] = {
                ["text"] = "www.fivemm.shop",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "New Report",  avatar_url = "https://cdn.discordapp.com/attachments/1072246335576744028/1094290969005924463/DL-PvP.png?width=492&height=492",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

