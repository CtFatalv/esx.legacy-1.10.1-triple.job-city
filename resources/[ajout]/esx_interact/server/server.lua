RegisterNetEvent('esx_interact:handcuff')
AddEventHandler('esx_interact:handcuff', function(target)
	TriggerClientEvent('esx_interact:handcuff', target)
end)

RegisterNetEvent('esx_interact:zip')
AddEventHandler('esx_interact:zip', function(target)
	TriggerClientEvent('esx_interact:zip', target)
end)

RegisterNetEvent('esx_interact:cagoule')
AddEventHandler('esx_interact:cagoule', function(target)
	TriggerClientEvent('esx_interact:cagoule', target)
end)

RegisterNetEvent('esx_interact:unhandcuff')
AddEventHandler('esx_interact:unhandcuff', function(target)
	TriggerClientEvent('esx_interact:unhandcuff', target)
end)

RegisterNetEvent('esx_interact:unzip')
AddEventHandler('esx_interact:unzip', function(target)
	TriggerClientEvent('esx_interact:unzip', target)
end)

RegisterNetEvent('esx_interact:uncagoule')
AddEventHandler('esx_interact:uncagoule', function(target)
	TriggerClientEvent('esx_interact:uncagoule', target)
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

RegisterNetEvent('esx_interact:removelockpick')
AddEventHandler('esx_interact:removelockpick', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('lockpick', 1)
end)

RegisterNetEvent('esx_interact:removezip')
AddEventHandler('esx_interact:removezip', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('zip', 1)
end)

RegisterNetEvent('esx_interact:givezip')
AddEventHandler('esx_interact:givezip', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('zip', 1)
end)

RegisterNetEvent('esx_interact:removecagoule')
AddEventHandler('esx_interact:removecagoule', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('cagoule', 1)
end)

RegisterNetEvent('esx_interact:givecagoule')
AddEventHandler('esx_interact:givecagoule', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('cagoule', 1)
end)

RegisterServerEvent('esx_worek:zdejmij')
AddEventHandler('esx_worek:zdejmij', function()
    TriggerClientEvent('esx_worek:zdejmijc', najblizszy)
end)