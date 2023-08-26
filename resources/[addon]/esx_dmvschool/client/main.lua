ESX = exports["es_extended"]:getSharedObject()

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local CurrentAction     = nil
local CurrentActionMsg  = nil
local CurrentActionData = nil
local Licenses          = {}
local CurrentTest       = nil
local CurrentTestType   = nil
local CurrentVehicle    = nil
local CurrentCheckPoint = 0
local LastCheckPoint    = -1
local CurrentBlip       = nil
local CurrentZoneType   = nil
local DriveErrors       = 0
local IsAboveSpeedLimit = false
local LastVehicleHealth = nil


local function checkLicensedmv()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(permis_dmv)
	dmv = permis_dmv
	end, GetPlayerServerId(PlayerId()), 'dmv')
end

local function checkLicense()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(permis_voiture)
		pv = permis_voiture
	end, GetPlayerServerId(PlayerId()), 'permis_voiture')
end

local function checkLicense2()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(permis_moto)
		pm = permis_moto
	end, GetPlayerServerId(PlayerId()), 'permis_moto')
end

local function checkLicense3()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(permis_camion)
		pc = permis_camion
	end, GetPlayerServerId(PlayerId()), 'permis_camion')
end

RegisterNetEvent('esx_weashop:loadLicenses')
AddEventHandler('esx_weashop:loadLicenses', function (licenses)
for i = 1, #licenses, 1 do
	Licenses[licenses[i].type] = true
end
end)

Citizen.CreateThread(function()
	local hash = GetHashKey("a_m_m_ktown_01")
	RequestModel(hash)
	while not HasModelLoaded(hash) do
		Wait(1)
	end

	local npc = CreatePed(4, hash,  239.37, -1381.04, 32.74, 145.00, false, true)
	FreezeEntityPosition(npc, true)
	SetEntityInvincible(npc, true)
	SetBlockingOfNonTemporaryEvents(npc, true)
	local options = {
		{
			name = 'dmv',
			event = 'esx_dmvschool:code',
			icon = 'fa-solid fa-road',
			label = 'Passer le code',
			distance = 1.6,
		},
		{
			name = 'dmv2',
			event = 'esx_dmvschool:permisvoiture',
			icon = 'fa-solid fa-road',
			label = 'Passer le permis voiture',
			distance = 1.6,
		},
		{
			name = 'dmv3',
			event = 'esx_dmvschool:permismoto',
			icon = 'fa-solid fa-road',
			label = 'Passer le permis moto',
			distance = 1.6,
		},
		{
			name = 'dmv4',
			event = 'esx_dmvschool:permiscamion',
			icon = 'fa-solid fa-road',
			label = 'Passer le permis camion',
			distance = 1.6,
		},
	}label = 'dmv',
	exports.ox_target:addLocalEntity(npc, options)
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

	--TriggerServerEvent('esx_dmvschool:pay', Config.Prices['dmv'])
end

	
function StopTheoryTest(success)
	CurrentTest = nil

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		TriggerServerEvent('esx_dmvschool:addLicense', 'dmv')
		ESX.ShowNotification(_U('passed_test'))
		TriggerServerEvent('esx_dmvschool:addItem', 'dmv')
	else
		ESX.ShowNotification(_U('failed_test'))
	end
end

function StartDriveTest(type)
		ESX.Game.SpawnVehicle(Config.VehicleModels[type], Config.Zones.VehicleSpawnPoint.Pos, 317.0, function(vehicle)
		CurrentTest       = 'drive'
		CurrentTestType   = type
		CurrentCheckPoint = 0
		LastCheckPoint    = -1
		CurrentZoneType   = 'residence'
		DriveErrors       = 0
		IsAboveSpeedLimit = false
		CurrentVehicle    = vehicle
		LastVehicleHealth = GetEntityHealth(vehicle)

		local playerPed   = GetPlayerPed(-1)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	end)

	--TriggerServerEvent('esx_dmvschool:pay', Config.Prices[type])
end

function StopDriveTest(success)
	if success then
		TriggerServerEvent('esx_dmvschool:addLicense', CurrentTestType)
		ESX.ShowNotification(_U('passed_test'))
		if CurrentTestType == 'permis_voiture' then
			TriggerServerEvent('esx_dmvschool:addItemA', 'permis_voiture')
		elseif CurrentTestType == 'permis_moto' then
			TriggerServerEvent('esx_dmvschool:addItemB', 'permis_moto')
		elseif CurrentTestType == 'permis_camion' then
			TriggerServerEvent('esx_dmvschool:addItemC', 'permis_camion')
		end
		
	else
		ESX.ShowNotification(_U('failed_test'))
	end

	CurrentTest     = nil
	CurrentTestType = nil
end

function SetCurrentZoneType(type)
CurrentZoneType = type
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

RegisterNetEvent('esx_dmvschool:loadLicenses')
AddEventHandler('esx_dmvschool:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Create Blips
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.Zones.DMVSchool.Pos.x, Config.Zones.DMVSchool.Pos.y, Config.Zones.DMVSchool.Pos.z)

	SetBlipSprite (blip, 408)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('driving_school_blip'))
	EndTextCommandSetBlipName(blip)
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

-- Drive test
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		if CurrentTest == 'drive' then
			local playerPed      = GetPlayerPed(-1)
			local coords         = GetEntityCoords(playerPed)
			local nextCheckPoint = CurrentCheckPoint + 1

			if Config.CheckPoints[nextCheckPoint] == nil then
				if DoesBlipExist(CurrentBlip) then
					RemoveBlip(CurrentBlip)
				end

				CurrentTest = nil

				ESX.ShowNotification(_U('driving_test_complete'))

				if DriveErrors < Config.MaxErrors then
					StopDriveTest(true)
				else
					StopDriveTest(false)
				end
			else

				if CurrentCheckPoint ~= LastCheckPoint then

					if DoesBlipExist(CurrentBlip) then
						RemoveBlip(CurrentBlip)
					end

					CurrentBlip = AddBlipForCoord(Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y, Config.CheckPoints[nextCheckPoint].Pos.z)
					SetBlipRoute(CurrentBlip, 1)

					LastCheckPoint = CurrentCheckPoint
				end

				local distance = GetDistanceBetweenCoords(coords, Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y, Config.CheckPoints[nextCheckPoint].Pos.z, true)

				if distance <= 100.0 then
					--DrawMarker(1, Config.CheckPoints[nextCheckPoint].Pos.x, Config.CheckPoints[nextCheckPoint].Pos.y, Config.CheckPoints[nextCheckPoint].Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 204, 102, 100, false, true, 2, false, false, false, false)
				end

				if distance <= 3.0 then
					Config.CheckPoints[nextCheckPoint].Action(playerPed, CurrentVehicle, SetCurrentZoneType)
					CurrentCheckPoint = CurrentCheckPoint + 1
				end
			end
		end
	end
end)

-- Speed / Damage control
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentTest == 'drive' then

			local playerPed = GetPlayerPed(-1)

			if IsPedInAnyVehicle(playerPed,  false) then

				local vehicle      = GetVehiclePedIsIn(playerPed,  false)
				local speed        = GetEntitySpeed(vehicle) * Config.SpeedMultiplier
				local tooMuchSpeed = false

				for k,v in pairs(Config.SpeedLimits) do
					if CurrentZoneType == k and speed > v then
						tooMuchSpeed = true

						if not IsAboveSpeedLimit then
							DriveErrors       = DriveErrors + 1
							IsAboveSpeedLimit = true

							ESX.ShowNotification(_U('driving_too_fast', v))
							ESX.ShowNotification(_U('errors', DriveErrors, Config.MaxErrors))
						end
					end
				end

				if not tooMuchSpeed then
					IsAboveSpeedLimit = false
				end

				local health = GetEntityHealth(vehicle)

				if health < LastVehicleHealth then

					DriveErrors = DriveErrors + 1

					ESX.ShowNotification(_U('you_damaged_veh'))
					ESX.ShowNotification(_U('errors', DriveErrors, Config.MaxErrors))

					-- avoid stacking faults
					Citizen.Wait(1000)
					LastVehicleHealth = health
				end
			end
		end
	end
end)


AddEventHandler('esx_dmvschool:code', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()	 
	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
		Wait(500)
		if dmv then
			ESX.ShowNotification("Vous avez déjà obtenu le ~r~code~s~!", "error", 3000)
		else
			TriggerServerEvent('esx_dmvschool:pay', Config.Prices['dmv'])
		end
end)

AddEventHandler('esx_dmvschool:permisvoiture', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()
	checkLicense()	 
	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
		Wait(500)
		if pv then
			ESX.ShowNotification("Vous avez déjà obtenu le permis ~r~voiture~s~!", "error", 3000)
		else
			if dmv then
			TriggerServerEvent('esx_dmvschool:pay2', Config.Prices['permis_voiture'])
			else
			ESX.ShowNotification("Vous devez passez votre ~r~code~s~!", "error", 3000)
			end
		end
end)

AddEventHandler('esx_dmvschool:permismoto', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()
	checkLicense2()	 
	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
		Wait(500)
		if pm then
			ESX.ShowNotification("Vous avez déjà obtenu le permis ~r~moto~s~!", "error", 3000)
		else
			if dmv then
			TriggerServerEvent('esx_dmvschool:pay3', Config.Prices['permis_moto'])
			else
			ESX.ShowNotification("Vous devez passez votre ~r~code~s~!", "error", 3000)
			end
		end
end)

AddEventHandler('esx_dmvschool:permiscamion', function(zone)
local ownedLicenses = {}
checkLicensedmv()
checkLicense3()	 
for i=1, #Licenses, 1 do
	ownedLicenses[Licenses[i].type] = true
end
	Wait(500)
	if pc then
		ESX.ShowNotification("Vous avez déjà obtenu le permis ~r~camion~s~!", "error", 3000)
	else
		if dmv then
		TriggerServerEvent('esx_dmvschool:pay4', Config.Prices['permis_camion'])
		else
		ESX.ShowNotification("Vous devez passez votre ~r~code~s~!", "error", 3000)
		end
	end
end)

RegisterNetEvent('esx_dmvschool:codeok')
AddEventHandler('esx_dmvschool:codeok', function(zone)
	local ownedLicenses = {}
	checkLicensedmv()

	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end
	Wait(500)
		if not dmv then
			StartTheoryTest('dmv')
		else
			ESX.ShowNotification("Vous avez déjà obtenu le ~r~code~s~!", "error", 3000)
		end
end)

RegisterNetEvent('esx_dmvschool:permisvoitureok')
AddEventHandler('esx_dmvschool:permisvoitureok', function()
	StartDriveTest('permis_voiture')
end)

RegisterNetEvent('esx_dmvschool:permismotook')
AddEventHandler('esx_dmvschool:permismotook', function()
	StartDriveTest('permis_moto')
end)

RegisterNetEvent('esx_dmvschool:permiscamionok')
AddEventHandler('esx_dmvschool:permiscamionok', function()
	StartDriveTest('permis_camion')
end)