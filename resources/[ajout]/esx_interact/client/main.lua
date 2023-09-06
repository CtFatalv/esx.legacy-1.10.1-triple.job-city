-- Handcuff
local isHandcuffed, handcuffTimer = false, {}
local isHandzip, handzipTimer = false, {}
local isCagoule, cagouleTimer = false, {}
dragStatus = {}
dragStatus.isDragged =  false
local HaveBagOnHead = false

AddEventHandler('playerSpawned', function()
	DoScreenFadeIn(2000)
	id = GetPlayerServerId(PlayerId())
    Player(id).state:set('HaveBagOnHead', false, true)
	TriggerEvent('esx_interact:startcagoule')
    Player(id).state:set('HaveBagOnHead', false, true)
end)

AddEventHandler('handcuff', function(data)
	local handcuffs = exports.ox_inventory:Search('count', 'menotte')
	local rope = exports.ox_inventory:Search('count', 'rope')
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "run", 3) or IsPedDeadOrDying(data.entity) then
	if handcuffs >= 1 or rope >= 1 and IsEntityPlayingAnim(data.entity, "missminuteman_1ig_2", "handsup_base", 3) then
		TriggerServerEvent('esx_interact:handcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
		TriggerServerEvent('esx_interact:removemenotte')
	else
		ESX.ShowNotification("~r~Vous n'avez pas de paire de menotte!", "error", 3000)
	end
	else
		ESX.ShowNotification("~r~La personne est déjà menotté!", "error", 3000)
	end
	else
		ESX.ShowNotification("~r~La personne à des ZIP aux poignets!", "info", 3000)
	end
end)

AddEventHandler('zip', function(data)
	local zips = exports.ox_inventory:Search('count', 'zip')
	local rope = exports.ox_inventory:Search('count', 'rope')
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "run", 3) or IsPedDeadOrDying(data.entity) then
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
	if zips >= 1 or rope >= 1 and IsEntityPlayingAnim(data.entity, "missminuteman_1ig_2", "handsup_base", 3) then
		TriggerServerEvent('esx_interact:zip', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
		TriggerServerEvent('esx_interact:removezip')
	else
		ESX.ShowNotification("~r~Vous n'avez pas de ZIP!", "error", 3000)
	end
	else
		ESX.ShowNotification("~r~La personne a déjà des ZIP aux poignets!", "error", 3000)
	end
	else
		ESX.ShowNotification("~o~La personne a une paire de menotte aux poignets!", "info", 3000)
	end
end)

AddEventHandler('cagoule', function(data)
	local cagoules = exports.ox_inventory:Search('count', 'cagoule')
	if cagoules >= 1 then
		--print(GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
		local target_id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
		--print(target_id)
		Wait(200)
		if Player(target_id).state.HaveBagOnHead == false then
		--print(target_id)
		--print(HaveBagOnHead)
		id = GetPlayerServerId(PlayerId())
		TriggerServerEvent('esx_interact:cagoule', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
		TriggerServerEvent('esx_interact:removecagoule')
		else
			ESX.ShowNotification("~r~La personne est déjà cagoulé!", "error", 3000)
		end
	else
		ESX.ShowNotification("~r~Vous n'avez pas de cagoule!", "error", 3000)
	end
end)

AddEventHandler('unhandcuff', function(data)	
	local unhandcuffs = exports.ox_inventory:Search('count', 'clemenotte')
if not IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
    if IsEntityPlayingAnim(data.entity, "mp_arresting", "run", 3) or IsPedDeadOrDying(data.entity) then
		if unhandcuffs >= 1 then
        TriggerServerEvent('esx_interact:unhandcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        TriggerServerEvent('esx_interact:givemenotte')
        else
			ESX.ShowNotification("~r~Vous n'avez pas de clé de menotte!", "error", 3000)
		end
    else
			ESX.ShowNotification("~o~Vous ne pouvez pas effectuer cette action!", "info", 3000)
    end
    else
		ESX.ShowNotification("~r~La personne est déjà un ZIP aux poignets", "error", 3000)
    end
end)

AddEventHandler('bunhandcuff', function(data)	
	local reunhandcuffs = exports.ox_inventory:Search('count', 'lockpick')
if not IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
    if IsEntityPlayingAnim(data.entity, "mp_arresting", "run", 3) or IsPedDeadOrDying(data.entity) then
		if reunhandcuffs >= 1 then
        TriggerServerEvent('esx_interact:unhandcuff', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        TriggerServerEvent('esx_interact:removelockpick')
		ESX.ShowNotification("~o~Vous avez brissé les menottes!", "info", 3000)
        else
			ESX.ShowNotification("~r~Vous n'avez pas de lockpick!", "error", 3000)
		end
    else
			ESX.ShowNotification("~o~Vous ne pouvez pas effectuer cette action!", "info", 3000)
    end
    else
		ESX.ShowNotification("~r~La personne est déjà un ZIP aux poignets", "error", 3000)
    end
end)

AddEventHandler('unzip', function(data)	
	local unzips = exports.ox_inventory:Search('count', 'cutter')
	if not IsEntityPlayingAnim(data.entity, "mp_arresting", "run", 3) or IsPedDeadOrDying(data.entity) then
    if IsEntityPlayingAnim(data.entity, "mp_arresting", "idle", 3) or IsPedDeadOrDying(data.entity) then
		if unzips >= 1 then
        TriggerServerEvent('esx_interact:unzip', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        --TriggerServerEvent('esx_interact:givezip')
        else
			ESX.ShowNotification("~r~Vous n'avez pas de cutter!", "error", 3000)
		end
    else
		ESX.ShowNotification("~o~Vous ne pouvez pas effectuer cette action!", "info", 3000)
    end
    else
			ESX.ShowNotification("~r~La personne a une paire de menotte aux poignets!", "error", 3000)
    end
end)

AddEventHandler('uncagoule', function(data)	
		local target_id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
		Wait(200)
		if Player(target_id).state.HaveBagOnHead == true then
		id = GetPlayerServerId(PlayerId())
        TriggerServerEvent('esx_interact:uncagoule', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
        TriggerServerEvent('esx_interact:givecagoule')
		else
			ESX.ShowNotification("~o~La personne ne porte pas de cagoule!", "info", 3000)
		end
end)

RegisterNetEvent('esx_interact:uncagoule')
AddEventHandler('esx_interact:uncagoule', function()
	TriggerEvent('esx_interact:unremovecagoule')
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
		TaskPlayAnim(playerPed, 'mp_arresting', 'run', 8.0, -8, -1, 49, 0, 0, 0, 0)
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

RegisterNetEvent('esx_interact:zip')
AddEventHandler('esx_interact:zip', function()
	isHandzip = not isHandzip
	local playerPed = PlayerPedId()
	if isHandzip then
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
			if handzipTimer.active then
				ESX.ClearTimeout(handzipTimer.task)
			end
			StartHandzipTimer()
		end
	end
end)

RegisterNetEvent('esx_interact:cagoule')
AddEventHandler('esx_interact:cagoule', function()
	isCagoule = not isCagoule
	local playerPed = PlayerPedId()
	if isCagoule then
		Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
		AttachEntityToEntity(Worek, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, false, 1, true) 
		SetNuiFocus(false,false)
		SendNUIMessage({type = 'openGeneral'})
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(playerPed, false)
		DisplayRadar(false)
		id = GetPlayerServerId(PlayerId())
		Player(id).state:set('HaveBagOnHead', true, true)
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

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_interact:unzip')
AddEventHandler('esx_interact:unzip', function()
	TriggerEvent('esx_interact:unrestrainzip')
		handzipTimer.active = false
end)

RegisterNetEvent('esx_interact:unrestrainzip')
AddEventHandler('esx_interact:unrestrainzip', function()
	if isHandzip then
		local playerPed = PlayerPedId()
		isHandzip = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		if Config.EnableHandcuffTimer and handzipTimer.active then
			ESX.ClearTimeout(handzipTimer.task)
		end
	end
end)

RegisterNetEvent('esx_interact:unremovecagoule')
AddEventHandler('esx_interact:unremovecagoule', function()
	if isCagoule then
		local playerPed = PlayerPedId()
		isCagoule = false

        DeleteEntity(Worek)
        SetEntityAsNoLongerNeeded(Worek)
        SendNUIMessage({type = 'closeAll'})
		SetNuiFocus(false,false)
		DeleteEntity(Worek)
   		SetEntityAsNoLongerNeeded(Worek)
		DisplayRadar(true)
		id = GetPlayerServerId(PlayerId())
		Player(id).state:set('HaveBagOnHead', false, true)
	end
end)

RegisterNetEvent('esx_interact:startcagoule')
AddEventHandler('esx_interact:startcagoule', function()
	local playerPed = PlayerPedId()
		Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
		AttachEntityToEntity(Worek, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, false, 1, true) 
		--SetNuiFocus(false,false)
		--SendNUIMessage({type = 'openGeneral'})
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		SetPedCanPlayGestureAnims(playerPed, false)
		DisplayRadar(false)
		id = GetPlayerServerId(PlayerId())
		Player(id).state:set('HaveBagOnHead', true, true)
		Wait(1000)
		local playerPed = PlayerPedId()
        DeleteEntity(Worek)
        SetEntityAsNoLongerNeeded(Worek)
        --SendNUIMessage({type = 'closeAll'})
		--SetNuiFocus(false,false)
		DeleteEntity(Worek)
   		SetEntityAsNoLongerNeeded(Worek)
		DisplayRadar(true)
		id = GetPlayerServerId(PlayerId())
		Player(id).state:set('HaveBagOnHead', false, true)
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			--DisableControlAction(0, 1, true)
			--DisableControlAction(0, 2, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 45, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 37, true)
			--DisableControlAction(0, 23, true)
			DisableControlAction(0, 288,  true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 167, true)
			--DisableControlAction(0, 0, true)
			DisableControlAction(0, 26, true)
			DisableControlAction(0, 73, true)
			DisableControlAction(0, 105, true)
			DisableControlAction(0, 120, true)
			DisableControlAction(0, 186, true)
			DisableControlAction(0, 252, true)
			DisableControlAction(0, 323, true)
			DisableControlAction(0, 337, true)
			DisableControlAction(2, 199, true)
			DisableControlAction(0, 59, true)
			DisableControlAction(0, 71, true)
			DisableControlAction(0, 72, true)
			DisableControlAction(2, 36, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
			exports.ox_inventory:closeInventory()
		else
			Wait(500)
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if isHandzip then
			--DisableControlAction(0, 1, true)
			--DisableControlAction(0, 2, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 45, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 37, true)
			--DisableControlAction(0, 23, true)
			DisableControlAction(0, 288,  true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 167, true)
			--DisableControlAction(0, 0, true)
			DisableControlAction(0, 26, true)
			DisableControlAction(0, 73, true)
			DisableControlAction(0, 105, true)
			DisableControlAction(0, 120, true)
			DisableControlAction(0, 186, true)
			DisableControlAction(0, 252, true)
			DisableControlAction(0, 323, true)
			DisableControlAction(0, 337, true)
			DisableControlAction(2, 199, true)
			DisableControlAction(0, 59, true)
			DisableControlAction(0, 71, true)
			DisableControlAction(0, 72, true)
			DisableControlAction(2, 36, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
			exports.ox_inventory:closeInventory()
		else
			Wait(500)
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()

		if isCagoule then
			--DisableControlAction(0, 1, true)
			--DisableControlAction(0, 2, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 45, true)
			DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 37, true)
			--DisableControlAction(0, 23, true)
			DisableControlAction(0, 288,  true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 167, true)
			--DisableControlAction(0, 0, true)
			DisableControlAction(0, 26, true)
			DisableControlAction(0, 73, true)
			DisableControlAction(0, 105, true)
			DisableControlAction(0, 120, true)
			DisableControlAction(0, 186, true)
			DisableControlAction(0, 252, true)
			DisableControlAction(0, 323, true)
			DisableControlAction(0, 337, true)
			DisableControlAction(2, 199, true)
			DisableControlAction(0, 59, true)
			DisableControlAction(0, 71, true)
			DisableControlAction(0, 72, true)
			DisableControlAction(2, 36, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
			exports.ox_inventory:closeInventory()
		else
			Wait(100)
		end
	end
end)

AddEventHandler('escort', function(data)
	TriggerServerEvent('esx_interact:escort', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
end)


RegisterNetEvent('esx_interact:escort')-- escort 
AddEventHandler('esx_interact:escort', function(dragger)
	if isHandcuffed or isHandzip or IsPedDeadOrDying(PlayerPedId(), true) then
		escort()
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.dragger = dragger
	end
end)

function escort()
CreateThread(function()
	local wasDragged
	while true do
		if isHandcuffed then --and (not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3)) then -- after falling player hands get detached the second and not detcting how it should 
			--TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'run', 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
		if dragStatus.isDragged then
			Sleep = 50
			
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.dragger))
			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and (isHandcuffed or IsPedDeadOrDying(PlayerPedId(), true)) or (isHandzip or IsPedDeadOrDying(PlayerPedId(), true)) then
				if not wasDragged then
					if Config.npwd then 
						exports.npwd:setPhoneDisabled(true)
					end
					AttachEntityToEntity(ESX.PlayerData.ped, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					SetEntityCollision(ESX.PlayerData.ped, 1, 1)
					wasDragged = true
				else
					Wait(250)
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
		Wait(150)
	end
end)
end

CreateThread(function()
	while true do
		if isHandcuffed then --and (not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3)) then -- after falling player hands get detached the second and not detcting how it should 
			TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'run', 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
		Wait(5000)
	end
end)

CreateThread(function()
	while true do
		if isHandzip then --and (not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3)) then -- after falling player hands get detached the second and not detcting how it should 
			TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
		end
		Wait(5000)
	end
end)

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

function StartHandzipTimer()
	if Config.EnableHandcuffTimer and handzipTimer.active then
		ESX.ClearTimeout(handzipTimer.task)
	end

	handzipTimer.active = true

	handzipTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		lib.notify({
			description = Config.Unrestrained_timer,
			style = {
				backgroundColor = '#000000',
				color = '#ffffff'
			},
			icon = 'zips',
			type = 'inform'
		})
		TriggerEvent('esx_interact:unrestrainzip')
		handzipTimer.active = false
	end)
end

-- Open inventory
AddEventHandler('search', function(data)
	if IsEntityPlayingAnim(data.entity, "random@mugging3", "handsup_standing_base", 3) then
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
			['police'] = 1
		},
        distance = 0.7
	},
	{
		event = "billing",
		icon = Config.billing_img,
		label = Config.billing,
		num = 8,
        groups = {
			['police'] = 1
		},
        distance = 0.7
	},
	{
		event = "esx_policejob:mettreamende",
		icon = Config.vehplate_img,
		label = 'Mettre une amende',
		num = 9,
        groups = {
			['police'] = 1
		},
        distance = 0.7
	},
	{
		event = "esx_policejob:voirfacture",
		icon = Config.vehplate_img,
		label = 'Voir les impayés',
		num = 10,
        groups = {
			['police'] = 1
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
	-- All
		{
			event = "search",
			icon = Config.search_img,
			label = Config.search,
			num = 1,
			distance = 0.7
		},
		{
			event = "escort",
			icon = Config.escort_img,
			label = Config.escort,
			num = 4,
			distance = 0.7
		},
		{
			event = "cagoule",
			icon = Config.search_img,
			label = "cagoule",
			num = 1,
			distance = 0.7
		},
		{
			event = "uncagoule",
			icon = Config.search_img,
			label = "Enlever la cagoule",
			num = 1,
			distance = 0.7
		},
		{
			event = "zip",
			icon = Config.search_img,
			label = "zip",
			num = 2,
			distance = 0.7
		},
		{
			event = "unzip",
			icon = Config.search_img,
			label = "unzip",
			num = 3,
			distance = 0.7
		},
        {
            event = "bunhandcuff",
            icon = Config.handcuff_img,
            label = "Casser les menottes",
            num = 3,
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