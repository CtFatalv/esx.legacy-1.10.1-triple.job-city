RegisterNetEvent('esx_interact:handcuff')
AddEventHandler('esx_interact:handcuff', function(target)
	TriggerClientEvent('esx_interact:handcuff', target)
end)

RegisterNetEvent('esx_interact:unhandcuff')
AddEventHandler('esx_interact:unhandcuff', function(target)
	TriggerClientEvent('esx_interact:unhandcuff', target)
end)

RegisterNetEvent('esx_interact:escort')
AddEventHandler('esx_interact:escort', function(target)
		TriggerClientEvent('esx_interact:escort', target, source)
end)

RegisterNetEvent('esx_interact:putInVehicle')
AddEventHandler('esx_interact:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_interact:putInVehicle', target)
end)

RegisterNetEvent('esx_interact:OutVehicle')
AddEventHandler('esx_interact:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_interact:OutVehicle', target)
end)

RegisterNetEvent('esx_interact:removemenotte')
AddEventHandler('esx_interact:removemenotte', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('menotte', 1)
end)

RegisterNetEvent('esx_interact:givemenotte')
AddEventHandler('esx_interact:givemenotte', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('menotte', 1)
end)