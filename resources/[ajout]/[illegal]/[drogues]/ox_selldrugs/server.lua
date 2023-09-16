ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('phone_crypter', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer = ESX.GetPlayerFromId(source)
    drugToSell = {
        price = 0,
    }
		TriggerClientEvent('selldrugsfindClient', source, drugToSell)
end, false)

RegisterServerEvent('selldrugspay')
AddEventHandler('selldrugspay', function(drugToSell)
    xPlayer = ESX.GetPlayerFromId(source)
    local itemamt = xPlayer.getInventoryItem('pochon_cannabis').count
    local itemamt2 = xPlayer.getInventoryItem('coke_pooch').count
    if itemamt >= 1 then
    xPlayer.removeInventoryItem('pochon_cannabis', 1)
        if Config.account == 'money' then
            xPlayer.addMoney(drugToSell.price)
        else
            xPlayer.addAccountMoney(Config.account, drugToSell.price)
        end          
    elseif itemamt2 >= 1 then
        xPlayer.removeInventoryItem('coke_pooch', 1)
        if Config.account == 'money' then
            xPlayer.addMoney(drugToSell.price)
        else
			price = math.floor(drugToSell.price * 1.4)
            xPlayer.addAccountMoney(Config.account, price)
        end
            else
				TriggerClientEvent('esx:showNotification', source, '~o~Me prend pas pour un con, je viens de te balancer!', 'error', 5000)
				TriggerClientEvent('selldrugsnotifyPolice', -1, drugToSell.coords)
	end
end)


RegisterServerEvent('selldrugsnotifycops')
AddEventHandler('selldrugsnotifycops', function(drugToSell)
    TriggerClientEvent('selldrugsnotifyPolice', -1, drugToSell.coords)
end)

ESX.RegisterServerCallback('selldrugsgetPoliceCount', function(source, cb)
    count = 0

    for _, playerId in pairs(ESX.GetPlayers()) do
        xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.job.name == 'police' then
            count = count + 1
        end
    end

    cb(count)
end)
