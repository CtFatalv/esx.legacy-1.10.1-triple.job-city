ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_dmvweapon:loadLicenses', source, licenses)
	end)
end)

ESX.RegisterServerCallback('rWeaponSchool:getWeaponLicence', function(source, cb, type)
    local _src = source
    CheckLicense(_src, type, cb)
end)

RegisterServerEvent('rWeaponSchool:moneyrequest')
AddEventHandler('rWeaponSchool:moneyrequest', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    local itemamt = xPlayer.getInventoryItem('money').count 
    if itemamt >= 5000 then
		xPlayer.removeInventoryItem('money', 5000)
        TriggerClientEvent('rWeaponSchool:moneyok', source)
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas assez d\'argent!', 'error', 5000)
    end
end)

RegisterServerEvent('rWeaponSchool:addLicence')
AddEventHandler('rWeaponSchool:addLicence', function(permis)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	exports['um-idcard']:CreateMetaLicense(source, 'weaponlicense')
    MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
        ['@type'] = permis,
        ['@owner'] = xPlayer.identifier
    })
end)

RegisterServerEvent('rWeaponSchool:addMoney')
AddEventHandler('rWeaponSchool:addMoney', function(amount)
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	xPlayer.addMoney(amount)
end)

RegisterServerEvent('rWeaponSchool:buyWeapon')
AddEventHandler('rWeaponSchool:buyWeapon', function(weaponPrice, weaponName, weaponAmmo)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	local getCash = xPlayer.getMoney()
	if getCash >= weaponPrice then
		xPlayer.removeMoney(weaponPrice)
		xPlayer.addWeapon(weaponName, weaponAmmo)
		TriggerClientEvent('esx:showAdvancedNotification', _src, 'Ammu-Nation', 'Five-Dev', "Vous venez d'acheter un ~y~"..ESX.GetWeaponLabel(weaponName).."~s~ pour "..weaponPrice.."$", 'CHAR_AMMUNATION', 9)
	end
end)

function CheckLicense(source, type, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_licenses WHERE type = @type AND owner = @owner', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(result)
		if tonumber(result[1].count) > 0 then
			cb(true)
		else
			cb(false)
		end
	end)
end

-- spawn du player
AddEventHandler('playerSpawned', function()
	id = GetPlayerServerId(PlayerId())
    Player(id).state:set('weaponpermis', false, true)
end)

RegisterServerEvent('rWeaponSchool:removeweapon')
AddEventHandler('rWeaponSchool:removeweapon', function(weaponPrice, weaponName, weaponAmmo)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('weapon_pistol_mk2', 1)
    xPlayer.removeInventoryItem('ammo-9', 12)
end)

RegisterServerEvent('rWeaponSchool:zonerequest')
AddEventHandler('rWeaponSchool:zonerequest', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    local itemamt = xPlayer.getInventoryItem('weapon_pistol_mk2').count 
    if itemamt >= 1 then
    else
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('weapon_pistol_mk2', 1)
	xPlayer.addInventoryItem('ammo-9', 12)
    end
end)