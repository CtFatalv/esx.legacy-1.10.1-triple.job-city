local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

function OpenMobileAmbulanceActionsMenu()
	local elements = {
		{unselectable = true, icon = "fas fa-ambulance", title = TranslateCap('ambulance')},
		{icon = "fas fa-ambulance", title = TranslateCap('ems_menu'), value = "citizen_interaction"}
	}

	ESX.OpenContext("right", elements, function(menu,element)
		if element.value == "citizen_interaction" then
			local elements2 = {
				{unselectable = true, icon = "fas fa-ambulance", title = element.title},
				--{icon = "fas fa-syringe", title = TranslateCap('ems_menu_revive'), value = "revive"},
				--{icon = "fas fa-bandage", title = TranslateCap('ems_menu_small'), value = "small"},
				--{icon = "fas fa-bandage", title = TranslateCap('ems_menu_big'), value = "big"},
				--{icon = "fas fa-car", title = TranslateCap('ems_menu_putincar'), value = "put_in_vehicle"},
				--{icon = "fas fa-syringe", title = TranslateCap('ems_menu_search'), value = "search"},
			}

			ESX.OpenContext("right", elements2, function(menu2,element2)
				if isBusy then return end
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if element2.value == 'search' then
					TriggerServerEvent('esx_ambulancejob:svsearch')
				elseif closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(TranslateCap('no_players'))
				else
					if element2.value == 'revive' then
						revivePlayer(closestPlayer)
					elseif element2.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(TranslateCap('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(TranslateCap('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(TranslateCap('player_not_conscious'))
								end
							else
								ESX.ShowNotification(TranslateCap('not_enough_bandage'))
							end
						end, 'bandage')

					elseif element2.value == 'big' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(TranslateCap('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(TranslateCap('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(TranslateCap('player_not_conscious'))
								end
							else
								ESX.ShowNotification(TranslateCap('not_enough_medikit'))
							end
						end, 'medikit')
					elseif element2.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
					end
				end
			end)
		end
	end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(TranslateCap('revive_inprogress'))

				for i=1, 15 do
					Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
						RemoveAnimDict(lib)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(TranslateCap('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(TranslateCap('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if Config.Debug then 
		print("[^2INFO^7] Healing Player - ^5" .. tostring(healType).. "^7")
	end
	if not quiet then
		ESX.ShowNotification(TranslateCap('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job.name ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			if Config.Debug then 
				print("[^2INFO^7] Removing dead blip - ^5" .. tostring(playerId).. "^7")
			end
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('esx_ambulancejob:PlayerDead')
AddEventHandler('esx_ambulancejob:PlayerDead', function(Player)
	if Config.Debug then 
		print("[^2INFO^7] Player Dead | ^5" .. tostring(Player) .. "^7")
	end
	deadPlayers[Player] = "dead"
end)

RegisterNetEvent('esx_ambulancejob:PlayerNotDead')
AddEventHandler('esx_ambulancejob:PlayerNotDead', function(Player)
	if deadPlayerBlips[Player] then
		RemoveBlip(deadPlayerBlips[Player])
		deadPlayerBlips[Player] = nil
	end
	if Config.Debug then 
		print("[^2INFO^7] Player Alive | ^5" .. tostring(Player) .. "^7")
	end
	deadPlayers[Player] = nil
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if Config.Debug then 
				print("[^2INFO^7] Player Dead | ^5" .. tostring(playerId) .. "^7")
			end
			if status == 'distress' then
				if Config.Debug then 
					print("[^2INFO^7] Creating Distress Blip for Player - ^5" .. tostring(playerId) .. "^7")
				end
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(TranslateCap('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)


RegisterNetEvent('esx_ambulancejob:PlayerDistressed')
AddEventHandler('esx_ambulancejob:PlayerDistressed', function(Player)
	deadPlayers[Player] = 'distress'

	if isOnDuty then
		if Config.Debug then 
			print("[^2INFO^7] Player Distress Recived - ID:^5" .. tostring(Player) .. "^7")
		end
				ESX.ShowNotification("[DISPATCH]: An Unconscious Person Has Been Reported", "error", 10000)
				deadPlayerBlips[Player] = nil
				local player = GetPlayerFromServerId(Player)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, Config.DistressBlip.Sprite)
				SetBlipColour(blip, Config.DistressBlip.Color)
				SetBlipScale(blip, Config.DistressBlip.Scale)
				SetBlipFlashes(blip, true)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(TranslateCap('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[Player] = blip
	end
end)

AddEventHandler('esx_ambulancejob:factureems', function()	
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
local elements = {
    {unselectable = true, icon = "fas fa-scroll", title = TranslateCap('ambulance')},
    {icon = "fas fa-scroll", title = TranslateCap('billing'), value = "billing"},
}
ESX.OpenContext("right", elements, function(menu,element)
    if element.value == "billing" then
        local elements2 = {
            {unselectable = true, icon = "fas fa-scroll", title = element.title},
            {title = "Amount", input = true, inputType = "number", inputMin = 1, inputMax = 200000, inputPlaceholder = "Amount to bill.."},
            {icon = "fas fa-check-double", title = "Confirm", value = "confirm"}
        }

        ESX.OpenContext("right", elements2, function(menu2,element2)
            local amount = tonumber(menu2.eles[2].inputValue)
            if amount == nil then
                ESX.ShowNotification(TranslateCap('amount_invalid'))
            else
                ESX.CloseContext()
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                if closestPlayer == -1 or closestDistance > 3.0 then
                    ESX.ShowNotification(TranslateCap('no_players_near'))
                else
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance',
                        'ambulance', amount)
                    ESX.ShowNotification(TranslateCap('billing_sent'))
                end
            end
        end)
    end
end)
end
end)

exports.ox_target:addBoxZone({
    coords =  vector3(231.61, -1368.27, 39.43),
    size = vec3(0.6, 0.2, 0.1),
    rotation = 261,
    debug = false,
    options = {
        {
            name = 'Gestion',
            event = 'bossMenu',
            event = 'esx_ambulancejob:bossMenu',
            icon = 'fa-solid fa-computer',
            label = 'Gestion',
        }
    }
})

AddEventHandler('esx_ambulancejob:bossMenu', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
    TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
    end, {wash = false})
	end
end)

AddEventHandler('esx_ambulancejob:actionMenu', function()
	OpenMobileAmbulanceActionsMenu()
end)

AddEventHandler('ambulance:reanimation', function(player)
    print("jojo")
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer == -1 or closestDistance > 1.5 then
    	ESX.ShowNotification(TranslateCap('no_players'))
    else
    	revivePlayer(closestPlayer)
    end
end)

AddEventHandler('ambulance:soinleger', function()
    ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if quantity > 0 then
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)

        if health > 0 then
            local playerPed = PlayerPedId()

            isBusy = true
            ESX.ShowNotification(TranslateCap('heal_inprogress'))
            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
            Wait(10000)
            ClearPedTasks(playerPed)

            TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
            TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
            ESX.ShowNotification(TranslateCap('heal_complete', GetPlayerName(closestPlayer)))
            isBusy = false
        else
            ESX.ShowNotification(TranslateCap('player_not_conscious'))
        end
    else
        ESX.ShowNotification(TranslateCap('not_enough_bandage'))
    end
    end, 'bandage')
end)

AddEventHandler('ambulance:soingrave', function()
    ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if quantity > 0 then
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)

        if health > 0 then
            local playerPed = PlayerPedId()

            isBusy = true
            ESX.ShowNotification(TranslateCap('heal_inprogress'))
            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
            Wait(10000)
            ClearPedTasks(playerPed)

            TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
            TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
            ESX.ShowNotification(TranslateCap('heal_complete', GetPlayerName(closestPlayer)))
            isBusy = false
        else
            ESX.ShowNotification(TranslateCap('player_not_conscious'))
        end
    else
        ESX.ShowNotification(TranslateCap('not_enough_medikit'))
    end
    end, 'medikit')
end)

AddEventHandler('ambulance:cherche', function()
	TriggerServerEvent('esx_ambulancejob:svsearch')
end)