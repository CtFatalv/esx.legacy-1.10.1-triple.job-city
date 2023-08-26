ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_dmvweapon:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('esx_dmvweapon:addLicense')
AddEventHandler('esx_dmvweapon:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('esx_dmvweapon:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('esx_dmvweapon:pay')
AddEventHandler('esx_dmvweapon:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer.getMoney() <= 3000 then
             TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
            elseif xPlayer.getMoney() >= 3000 then
                xPlayer.removeMoney(3000)
                TriggerClientEvent('esx_dmvweapon:codeok',source)
            end
end)