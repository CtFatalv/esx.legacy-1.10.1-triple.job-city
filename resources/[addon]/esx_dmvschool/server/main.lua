ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_dmvschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('esx_dmvschool:addLicense')
AddEventHandler('esx_dmvschool:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('esx_dmvschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('esx_dmvschool:pay')
AddEventHandler('esx_dmvschool:pay', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() <= price then
             TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
            elseif xPlayer.getMoney() >= price then
                xPlayer.removeMoney(price)
                TriggerClientEvent('esx_dmvschool:codeok',source)
                TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
            end
end)

RegisterNetEvent('esx_dmvschool:pay2')
AddEventHandler('esx_dmvschool:pay2', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() <= price then
             TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
            elseif xPlayer.getMoney() >= price then
                xPlayer.removeMoney(price)
                TriggerClientEvent('esx_dmvschool:permisvoitureok',source)
				print(source)
                TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
            end
end)

RegisterNetEvent('esx_dmvschool:pay3')
AddEventHandler('esx_dmvschool:pay3', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() <= price then
             TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
            elseif xPlayer.getMoney() >= price then
                xPlayer.removeMoney(price)
                TriggerClientEvent('esx_dmvschool:permismotook',source)
                TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
            end
end)

RegisterNetEvent('esx_dmvschool:pay4')
AddEventHandler('esx_dmvschool:pay4', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() <= price then
             TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
            elseif xPlayer.getMoney() >= price then
                xPlayer.removeMoney(price)
                TriggerClientEvent('esx_dmvschool:permiscamionok',source)
                TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
            end
end)

RegisterServerEvent('esx_dmvschool:addItem')
AddEventHandler('esx_dmvschool:addItem', function(item, count)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
		if xPlayer ~= nil then
			xPlayer.addInventoryItem('dmv', 1)
		end
end)

RegisterServerEvent('esx_dmvschool:addItemA')
AddEventHandler('esx_dmvschool:addItemA', function(item, count)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
		if xPlayer ~= nil then
			--xPlayer.addInventoryItem('permis', 1)
            exports['um-idcard']:CreateMetaLicense(source, 'driver_license_voiture')
		end
end)

RegisterServerEvent('esx_dmvschool:addItemB')
AddEventHandler('esx_dmvschool:addItemB', function(item, count)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
		if xPlayer ~= nil then
		exports['um-idcard']:CreateMetaLicense(source, 'driver_license_moto')
		end
end)

RegisterServerEvent('esx_dmvschool:addItemC')
AddEventHandler('esx_dmvschool:addItemC', function(item, count)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
		if xPlayer ~= nil then
            exports['um-idcard']:CreateMetaLicense(source, 'driver_license_camion')
		end
end)