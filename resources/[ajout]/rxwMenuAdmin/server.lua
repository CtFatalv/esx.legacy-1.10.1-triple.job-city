local ESX
local allWarn = {}
local allReport = {}

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('rxwMenuAdmin:getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
end)

ESX.RegisterServerCallback('rxwMenuAdmin:getPlayerInfos', function(source, cb, id)
	local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)

    local allInfos = {
        namePlayer = xPlayer.getName(),
        inventory = xPlayer.getInventory(),
        job1 = xPlayer.job.name.." "..xPlayer.job.grade_name,
        job2 = xPlayer.job2.name.." "..xPlayer.job2.grade_name,
        moneyAmount = xPlayer.getMoney(),
        bankAmount = xPlayer.getAccount('bank').money,
        saleAmount = xPlayer.getAccount('black_money').money,
    }

    cb(allInfos)
end)

ESX.RegisterServerCallback('rxwMenuAdmin:getAllReport', function(source, cb)
    cb(allReport)
    print(json.encode(allReport))
end)


RegisterNetEvent("rxwMenuAdmin:giveMoney")
AddEventHandler("rxwMenuAdmin:giveMoney", function(type, amount, id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer then
        if type == "cash" then
            xPlayer.addMoney(amount)
            xPlayer.showNotification("~g~+"..amount.." Argent liquide")
        elseif type == "bank" then
            xPlayer.addAccountMoney('bank', amount)
            xPlayer.showNotification("~g~+"..amount.." Argent banque")
        elseif type == "sale" then
            xPlayer.addAccountMoney('black_money', amount)
            xPlayer.showNotification("~g~+"..amount.." Argent sale")
        else
            xPlayer.showNotification("~r~Ce type de paiement n'existe pas !")
        end
    end
end)


RegisterNetEvent("rxwMenuAdmin:giveInventory")
AddEventHandler("rxwMenuAdmin:giveInventory", function(type, name, amount, id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    if xPlayer then
        if type == "item" then
           if ESX.GetItemLabel(name) ~= nil then
            xPlayer.addInventoryItem(name, amount)
            xPlayer.showNotification("~g~Vous avez recu x"..amount.." "..ESX.GetItemLabel(name))
           else
            xPlayer.showNotification("Item ~r~invalide")
           end
        elseif type == "weapon" then
            if ESX.GetWeaponLabel(name) ~= nil then
                xPlayer.addWeapon(name, amount)
                xPlayer.showNotification("~g~Vous avez recu x"..amount.." "..ESX.GetWeaponLabel(name))
               else
                xPlayer.showNotification("Weapon ~r~invalide")
               end
        else
            xPlayer.showNotification("~r~Ce type de give n'existe pas !")
        end
    end
end)


RegisterNetEvent("rxwMenuAdmin:heal")
AddEventHandler("rxwMenuAdmin:heal", function(id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerClientEvent("esx_basicneeds:healPlayer", _src)
    xPlayer.showNotification("Vous avez été ~g~soigné~s~ !")
end)

RegisterNetEvent("rxwMenuAdmin:revive")
AddEventHandler("rxwMenuAdmin:revive", function(id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerClientEvent("esx_ambulancejob:revive", _src)
    xPlayer.showNotification("Vous avez été ~g~réanimé~s~ !")
end)

RegisterNetEvent("rxwMenuAdmin:sendMsg")
AddEventHandler("rxwMenuAdmin:sendMsg", function(id, msg)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerClientEvent('esx:showAdvancedNotification', _src, 'Message', 'Administrateur', msg, 'myLogo')
end)

RegisterNetEvent("rxwMenuAdmin:kickPlayer")
AddEventHandler("rxwMenuAdmin:kickPlayer", function(id, reason)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    DropPlayer(_src, "Vous avez été kick par "..GetPlayerName(source).." pour la raison suivante : "..reason)
end)

RegisterNetEvent("rxwMenuAdmin:killPlayer")
AddEventHandler("rxwMenuAdmin:killPlayer", function(id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerClientEvent('rxwMenuAdmin:killPlayerClient', _src)
end)

RegisterNetEvent("rxwMenuAdmin:wipePlayer")
AddEventHandler("rxwMenuAdmin:wipePlayer", function(id)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    Config.WipeTable(xPlayer.identifier)
    DropPlayer(_src, "[rWipe] - Vous avez été wipe...")
    TriggerClientEvent("esx:showNotification", source, "~g~Wipe effectuer")
end)

RegisterNetEvent("rxwMenuAdmin:warnPlayer")
AddEventHandler("rxwMenuAdmin:warnPlayer", function(id, reason)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    -- 3 warn = kick
    if allWarn[_src] then
        allWarn[_src] = allWarn[_src] + 1
    else
        allWarn[_src] = 1
    end
    TriggerClientEvent("esx:showNotification", _src, "Vous avez était averti pour "..reason)
    if allWarn[_src] == 3 then
        DropPlayer(_src, "[rWarn] - Vous avez été kick après avoir reçu 3 warn...")
    end
end)

RegisterNetEvent("rxwMenuAdmin:freezePlayer")
AddEventHandler("rxwMenuAdmin:freezePlayer", function(id, bool)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    TriggerClientEvent("rxwMenuAdmin:freezePlayerClient", _src, bool)
end)

RegisterNetEvent("rxwMenuAdmin:setJobPlayer")
AddEventHandler("rxwMenuAdmin:setJobPlayer", function(id, jobName, grade)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.setJob(jobName, grade)
    xPlayer.showNotification("Vous avez été ~g~setJob~s~ "..jobName.." !")
end)

RegisterNetEvent("rxwMenuAdmin:setJob2Player")
AddEventHandler("rxwMenuAdmin:setJob2Player", function(id, jobName, grade)
    local _src = id
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.setJob2(jobName, grade)
    xPlayer.showNotification("Vous avez été ~g~setJob2~s~ "..jobName.." !")
end)

RegisterNetEvent("rxwMenuAdmin:gotoPlayer")
AddEventHandler("rxwMenuAdmin:gotoPlayer", function(id)
    local _src = id
    local __src = source
    TriggerClientEvent("rxwMenuAdmin:setCoordsPlayer", __src, GetEntityCoords(GetPlayerPed(_src)))
end)

RegisterNetEvent("rxwMenuAdmin:bringPlayer")
AddEventHandler("rxwMenuAdmin:bringPlayer", function(id)
    local _src = id
    local __src = source
    TriggerClientEvent("rxwMenuAdmin:setCoordsPlayer", _src, GetEntityCoords(GetPlayerPed(__src)))
end)


RegisterNetEvent("rxwMenuAdmin:annonceServer")
AddEventHandler("rxwMenuAdmin:annonceServer", function(msg)
    TriggerClientEvent("rxwMenuAdmin:annonceServerClient", -1, msg, true)
    Citizen.Wait(10000)
    TriggerClientEvent("rxwMenuAdmin:annonceServerClient", -1, nil, false)
end)


RegisterServerEvent("rxwMenuAdmin:Soleil")
AddEventHandler("rxwMenuAdmin:Soleil", function(message)
    TriggerClientEvent("esx:showAdvancedNotification", -1, "Annonce", "~r~Alerte Météo", message, "CHAR_LS_TOURIST_BOARD", 1)
end)

RegisterServerEvent("rxwMenuAdmin:orage")
AddEventHandler("rxwMenuAdmin:orage", function(message)
    TriggerClientEvent("esx:showAdvancedNotification", -1, "Annonce", "~r~Alerte Météo", message, "CHAR_LS_TOURIST_BOARD", 1)
end)

RegisterCommand("report", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if source then
        if #allReport > 0 then
        for k,v in pairs(allReport) do
            if v.idPlayer == source then
                xPlayer.showNotification("vous avez déjà un report ouvert !")
            else
                table.insert(allReport, {
                    namePlayer = xPlayer.getName(),
                    reasonReport = table.concat(args, " "),
                    idPlayer = source
                })
                xPlayer.showNotification("~g~Votre report a été envoyé !")
                sendNotifyStaff("~g~Un nouveau report a été envoyé !")
            end
        end
        else
            table.insert(allReport, {
                namePlayer = xPlayer.getName(),
                reasonReport = table.concat(args, " "),
                idPlayer = source
            })
            xPlayer.showNotification("~g~Votre report a été envoyé !")
            sendNotifyStaff("~g~Un nouveau report a été envoyé !")
        end
    end
end, false)


function sendNotifyStaff(msg)
    local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.getGroup() == "admin" or thePlayer.getGroup() == "superadmin" then
            TriggerClientEvent("esx:showNotification", xPlayers[i], msg)
        end
	end
end

RegisterServerEvent("rxwMenuAdmin:closeReport")
AddEventHandler("rxwMenuAdmin:closeReport", function(idReport, idPlayer)
    local _src = idPlayer
    local xPlayer = ESX.GetPlayerFromId(_src)
    table.remove(allReport, idReport)
    sendNotifyStaff("Le report de "..xPlayer.getName().." à été ~r~clôturé")
end)