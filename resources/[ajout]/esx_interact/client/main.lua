-- Handcuff
local isHandcuffed, handcuffTimer = false, {}
dragStatus = {}
dragStatus.isDragged =  false

AddEventHandler('handcuff', function(data)
	local handcuffs = exports.ox_inventory:Search('count', 'menotte')
	local rope = exports.ox_inventory:Search('count', 'rope')
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and handcuffs >= 1 or rope >= 1 and IsEntityPlayingAnim(data.entity, "missminuteman_1ig_2", "handsup_base", 3) then
		TriggerServerEvent('esx_interact:handcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
		TriggerServerEvent('esx_interact:removemenotte')
	else
		lib.notify({
			description = Config.RequiredItem,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'people-robbery',
			type = 'error'
		})
	end
	else
		lib.notify({
			description = Config.dejamenotter,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'people-robbery',
			type = 'error'
		})
	end
end)

AddEventHandler('unhandcuff', function(data)	
	local unhandcuffs = exports.ox_inventory:Search('count', 'clemenotte')
    if IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
		if unhandcuffs >= 1 then
        TriggerServerEvent('esx_interact:unhandcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        TriggerServerEvent('esx_interact:givemenotte')
        else
            lib.notify({
                description = Config.pasdecle,
                style = {
                    backgroundColor = '#000000',
                    color = '#ffffff'
                },
                icon = 'people-robbery',
                type = 'error'
            })
		end
    else
        lib.notify({
            description = Config.nonmenotter,
            style = {
                backgroundColor = '#000000',
                color = '#ffffff'
            },
            icon = 'people-robbery',
            type = 'error'
        })
    end
end)

RegisterNetEvent('esx_interact:handcuff')
AddEventHandler('esx_interact:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()
	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Wait(100)
		end
		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		RemoveAnimDict('mp_arresting')
		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(playerPed, false)
		DisplayRadar(false)
		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end
			StartHandcuffTimer()
		end
	end
end)


RegisterNetEvent('esx_interact:unhandcuff')
AddEventHandler('esx_interact:unhandcuff', function()
	TriggerEvent('esx_interact:unrestrain')
		handcuffTimer.active = false
end)

RegisterNetEvent('esx_interact:unrestrain')
AddEventHandler('esx_interact:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D


			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 21, true) -- Jump
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
					RemoveAnimDict('mp_arresting')
				end)
			end
		else
			Wait(500)
		end
	end
end)

AddEventHandler('escort', function(data)
	TriggerServerEvent('esx_interact:escort', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
end)


RegisterNetEvent('esx_interact:escort')-- escort 
AddEventHandler('esx_interact:escort', function(dragger)
	if isHandcuffed or IsPedDeadOrDying(PlayerPedId(), true) then
		escort()
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.dragger = dragger
	end
end)

function escort()
CreateThread(function()
	local wasDragged
	while true do
		if isHandcuffed then -- and (not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3)) then -- after falling player hands get detached the second and not detcting how it should 
			--TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
		if dragStatus.isDragged then
			Sleep = 50
			
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.dragger))
			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and (isHandcuffed or IsPedDeadOrDying(PlayerPedId(), true)) then
				if not wasDragged then
					if Config.npwd then 
						exports.npwd:setPhoneDisabled(true)
					end
					AttachEntityToEntity(ESX.PlayerData.ped, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					SetEntityCollision(ESX.PlayerData.ped, 1, 1)
					wasDragged = true
				else
					Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(ESX.PlayerData.ped, true, false)
				if Config.npwd then 
					exports.npwd:setPhoneDisabled(false)
				end
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(ESX.PlayerData.ped, true, false)
			if Config.npwd then 
				exports.npwd:setPhoneDisabled(false)
			end
			
		end	
		Wait(1500)
	end
end)
end
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		lib.notify({
			description = Config.Unrestrained_timer,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'handcuffs',
			type = 'inform'
		})
		TriggerEvent('esx_interact:unrestrain')
		handcuffTimer.active = false
	end)
end

-- Open inventory
AddEventHandler('search', function(data)
	if IsEntityPlayingAnim(data.entity, "missminuteman_1ig_2", "handsup_base", 3) or IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
		exports.ox_inventory:openInventory('player', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
	else
		lib.notify({
			description = Config.ShowNotificationText,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'people-robbery',
			type = 'error'
		})
	end
end)

-- Put in vehicle
AddEventHandler('putveh', function(data)
	TriggerServerEvent('esx_interact:putInVehicle', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
end)

RegisterNetEvent('esx_interact:putInVehicle')
AddEventHandler('esx_interact:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local vehicle, distance = ESX.Game.GetClosestVehicle()

		if vehicle and distance < 5 then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

-- Out the vehicle
AddEventHandler('outveh', function(data)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_interact:OutVehicle', GetPlayerServerId(closestPlayer))
	end
end)

RegisterNetEvent('esx_interact:OutVehicle')
AddEventHandler('esx_interact:OutVehicle', function()
	local playerPed = PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

-- ID
AddEventHandler('id', function(data)
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), GetPlayerServerId(PlayerId()))
end)

-- ID Driver
AddEventHandler('id-driver', function(data)
	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), GetPlayerServerId(PlayerId()), 'driver')
end)

-- Billing
RegisterNetEvent('billing', function(data)
	local player = ESX.Game.GetClosestPlayer()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unemployed' then
		lib.notify({
			description = Config.Unemployed,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'fa-x',
			type = 'error'
		})
	else
		local input = lib.inputDialog(Config.billing_title, {Config.input})
		if input then
			local lockerNumber = tonumber(input[1])
			TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_'..ESX.PlayerData.job.name, (ESX.PlayerData.job.label), lockerNumber)
		end
	end
end)

exports.ox_target:addGlobalPlayer({
-- police
	{
		event = "search",
		icon = Config.search_img,
		label = Config.search,
		num = 1,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "handcuff",
		icon = Config.handcuff_img,
		label = "Menotter",
		num = 2,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "unhandcuff",
		icon = Config.handcuff_img,
		label = "Démenotter",
		num = 3,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "escort",
		icon = Config.escort_img,
		label = Config.escort,
		num = 4,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "putveh",
		icon = Config.putveh_img,
		label = Config.putveh,
		num = 5,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "esx_policejob:voirlicence",
		icon = Config.licence_img,
		label = 'Voir les licences',
		num = 8,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 8,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "esx_policejob:mettreamende",
		icon = Config.vehplate_img,
		label = 'Mettre une amende',
		num = 9,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "esx_policejob:voirfacture",
		icon = Config.vehplate_img,
		label = 'Voir les impayés',
		num = 10,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
-- EMS
	{
		event = "ambulance:reanimation",
		icon = Config.search_img,
		label = 'Réanimer le patient',
		num = 1,
        groups = {
			['ambulance'] = 0
		},
        distance = 1.5
	},
	{
		event = "ambulance:soinleger",
		icon = Config.search_img,
		label = 'Soigner petites blessures',
		num = 2,
        groups = {
			['ambulance'] = 0
		},
        distance = 1.5
	},
	{
		event = "ambulance:soingrave",
		icon = Config.search_img,
		label = 'Soigner blessures graves',
		num = 3,
        groups = {
			['ambulance'] = 0
		},
        distance = 1.5
	},
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 5,
        groups = {
			['ambulance'] = 0
		},
        distance = 1.5
	},
-- Mechanic
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 5,
        groups = {
			['mechanic'] = 0
		},
        distance = 0.7
	},
-- Concessionnaire
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 5,
        groups = {
			['cardealer'] = 0
		},
        distance = 0.7
	},
-- Taxi
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 5,
        groups = {
			['taxi'] = 0
		},
        distance = 0.7
	},
})

exports.ox_target:addGlobalVehicle({
-- Police
	{
		event = "outveh",
		icon = Config.outveh_img,
		label = Config.outveh,
		num = 1,
        groups = {
			['police'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_policejob:vehicleinfo",
		icon = Config.vehplate_img,
		label = 'Info Véhicule',
		num = 2,
        groups = {
			['police'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_mechanicjob:crochetter",
		icon = Config.vehplate_img,
		label = 'Déverouiller les portes',
		num = 3,
        groups = {
			['police'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_policejob:vehicleimpound",
		icon = Config.vehplate_img,
		label = 'Mettre en fourrière',
		num = 4,
        groups = {
			['police'] = 0
		},
        distance = 1.5
	},
-- Mechanic
	{
		event = "esx_mechanicjob:clean",
		icon = Config.vehplate_img,
		label = 'Nettoyer le véhicule',
		num = 1,
        groups = {
			['mechanic'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_mechanicjob:reparation",
		icon = Config.vehplate_img,
		label = 'Réparer le véhicule',
		num = 2,
        groups = {
			['mechanic'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_mechanicjob:mettreplateau",
		icon = Config.vehplate_img,
		label = 'Mettre/Sortir du plateau',
		num = 3,
        groups = {
			['mechanic'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_mechanicjob:crochetter",
		icon = Config.vehplate_img,
		label = 'Crochetter le véhicule',
		num = 4,
        groups = {
			['mechanic'] = 0
		},
        distance = 1.5
	},
	{
		event = "esx_policejob:vehicleimpound",
		icon = Config.vehplate_img,
		label = 'Mettre en fourrière',
		num = 5,
        groups = {
			['mechanic'] = 0
		},
        distance = 1.5
	},
})