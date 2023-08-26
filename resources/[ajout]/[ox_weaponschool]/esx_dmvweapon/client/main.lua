ESX = exports["es_extended"]:getSharedObject()

local Licenses          = {}
local CurrentTest       = nil

local function checkLicensedmv()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(t_weapon)
	tw = t_weapon
	end, GetPlayerServerId(PlayerId()), 't_weapon')
end

RegisterNetEvent('esx_weashop:loadLicenses')
AddEventHandler('esx_weashop:loadLicenses', function (licenses)
for i = 1, #licenses, 1 do
	Licenses[licenses[i].type] = true
end
end)

function DrawMissionText(msg, time)
	ClearPrints()
	SetTextEntry_2('STRING')
	AddTextComponentString(msg)
	DrawSubtitleTimed(time, 1)
end

function StartTheoryTest()
	CurrentTest = 'theory'

	SendNUIMessage({
		openQuestion = true
	})

	ESX.SetTimeout(200, function()
		SetNuiFocus(true, true)
	end)
end

	
function StopTheoryTest(success)
	CurrentTest = nil

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		TriggerServerEvent('esx_dmvweapon:addLicense', 't_weapon')
		ESX.ShowNotification("vous avez ~g~réussi~s~ le test!", "success", 3000)
	else
		ESX.ShowNotification("vous avez ~r~raté~s~ le test!", "error", 3000)
	end
end

RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({
		openSection = 'question'
	})

	cb('OK')
end)

RegisterNUICallback('close', function(data, cb)
	StopTheoryTest(true)
	cb('OK')
end)

RegisterNUICallback('kick', function(data, cb)
	StopTheoryTest(false)
	cb('OK')
end)

RegisterNetEvent('esx_dmvweapon:loadLicenses')
AddEventHandler('esx_dmvweapon:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Block UI
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if CurrentTest == 'theory' then
			local playerPed = GetPlayerPed(-1)

			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisablePlayerFiring(playerPed, true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		else
			Citizen.Wait(2000)
		end
	end
end)

AddEventHandler('esx_dmvweapon:code', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()	 
	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
		Wait(500)
		if tw then
			ESX.ShowNotification("Vous avez déjà obtenu le ~r~code~s~!", "error", 3000)
		else
			TriggerServerEvent('esx_dmvweapon:pay')
		end
end)

RegisterNetEvent('esx_dmvweapon:codeok')
AddEventHandler('esx_dmvweapon:codeok', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()

	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
	Wait(500)
		if not tw then
			StartTheoryTest('dmv')
		else
			ESX.ShowNotification("Vous avez déjà obtenu le ~r~code~s~!", "error", 3000)
		end
end)

exports.ox_target:addBoxZone({
    coords =  vector3(9.83, -1107.12, 30.1),
    size = vec3(2.5, 0.4, 1.8),
    rotation = 255,
    debug = false,
    options = {
        {
            name = 'licence',
            event = 'esx_dmvweapon:code',
            icon = 'fa-solid fa-computer',
			label = 'Passer le code - 3000$',
			distance = 1.5,
        }
    }
})