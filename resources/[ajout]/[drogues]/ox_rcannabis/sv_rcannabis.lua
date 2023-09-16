ESX = exports["es_extended"]:getSharedObject(obj)

local oneSyncEnabled = GetConvar('onesync_enabled', false)
local VERBOSE = false
local lastPlant = {}
local tickTimes = {}
local tickPlantCount = 0
local VERSION = '1.1.4'

AddEventHandler('playerDropped',function(why)
    lastPlant[source] = nil
end)

function verbose(...)
    if VERBOSE then
    end
end

if not oneSyncEnabled then
end

function HasItem(who, what, count)
    count = count or 1
    if ESX == nil then
        return false
    end
    local xPlayer = ESX.GetPlayerFromId(who)
    if xPlayer == nil then
        return false
    end
    local itemspec =  xPlayer.getInventoryItem(what)
    if itemspec then
        if itemspec.count >= count then
            return true
        else
            return false
        end
    else
        return false
    end
end

function TakeItem(who, what, count)
    count = count or 1
    if ESX == nil then
        return false
    end
    local xPlayer = ESX.GetPlayerFromId(who)
    if xPlayer == nil then
        return false
    end
    local itemspec =  xPlayer.getInventoryItem(what)
    if itemspec then
        if itemspec.count >= count then
            xPlayer.removeInventoryItem(what, count)
            return true
        else
            return false
        end
    else
        return false
    end
end

function GiveItem(who, what, count)
    count = count or 1
    if ESX == nil then
        return false
    end
    local xPlayer = ESX.GetPlayerFromId(who)
    if xPlayer == nil then
        return false
    end
    local itemspec =  xPlayer.getInventoryItem(what)
    if itemspec then
        if not itemspec.limit or itemspec.limit == -1 or itemspec.count + count <= itemspec.limit then
            if xPlayer.canCarryItem(what, count) then
				xPlayer.addInventoryItem(what, count)
            end
            return true
        else
            return false
        end
    else
        return false
    end
end

function makeToast(target, subject, message)
    TriggerClientEvent('ox_rcannabis:make_toast', target, subject, message)
end
function inChat(target, message)
    if target == 0 then
    else
        TriggerClientEvent('chat:addMessage',target,{args={'Rcannabis', message}})
    end
end

function plantSeed(location, soil)
    
    local hits = cropstate.octree:searchSphere(location, Config.Distance.Space)
    if #hits > 0 then
        return false
    end

    verbose('Planting at',location,'in soil', soil)
    cropstate:plant(location, soil)
    return true
end

function doScenario(who, what, where)
    verbose('Telling', who,'to',what,'at',where)
    TriggerClientEvent('ox_rcannabis:do', who, what, where)
end

RegisterNetEvent('ox_rcannabis:success_plant')
AddEventHandler ('ox_rcannabis:success_plant', function(location, soil)
    local src = source
    if oneSyncEnabled and false then
        local ped = GetPlayerPed(src)
        local pedLocation = GetEntityCoords(ped)
        local distance = #(pedLocation - location)
        if distance > Config.Distance.Interact then
            if distance > 10 then
            end
            makeToast(src, _U('planting_text'), _U('planting_too_far'))
            return
        end
    end
    if soil and Config.Soil[soil] then
        local hits = cropstate.octree:searchSphere(location, Config.Distance.Space)
        if #hits == 0 then
            if TakeItem(src, Config.Items.Seed) then
                if plantSeed(location, soil) then
                    doScenario(src, 'Plant', location)
					TriggerClientEvent('esx:showNotification', source, '~o~Revenez dans ~y~1h ~o~pour ~y~arroser ~o~la ~y~pousse!', 'success', 7000)
                else
                    GiveItem(src, Config.Items.Seed)
					TriggerClientEvent('esx:showNotification', source, '~r~Il y a eu une erreur lors de la plantation!', 'error', 3000)
                end
            else
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas de graines!', 'error', 3000)
            end
        else
			TriggerClientEvent('esx:showNotification', source, '~r~La graine a besoin de plus d\'espace!', 'error', 3000)
        end
    else
		TriggerClientEvent('esx:showNotification', source, '~r~Cette terre n\'est pas fertile...', 'error', 3000)
    end
end)

RegisterNetEvent('ox_rcannabis:test_forest')
AddEventHandler ('ox_rcannabis:test_forest',function(forest)
    local src = source


    if IsPlayerAceAllowed(src, 'command.rcannabis') then

        local soil
        for candidate, quality in pairs(Config.Soil) do
            soil = candidate
            if quality >= 1.0 then
                break
            end
        end

        for i, tree in ipairs(forest) do
            cropstate:plant(tree.location, soil, tree.stage)
            if i % 25 == 0 then
                Citizen.Wait(0)
            end
        end
    else
    end
end)

function keyCount(tbl)
    local count = 0
    if type(tbl) == 'table' then
        for key, value in pairs(tbl) do
            count = count + 1
        end
    end
    return count
end

ESX.RegisterUsableItem('graine_cannabis', function(source)
    local now = os.time()
    local last = lastPlant[source] or 0
    if now > last + (Config.ActionTime/1000) then
        if HasItem(source, Config.Items.Seed) then
            TriggerClientEvent('ox_rcannabis:attempt_plant', source)
            lastPlant[source] = now
        else
            TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez pas de graines', 'error', 3000)
        end
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Chillax, mon frère ! Attends un peu.', 'error', 3000)
    end
end)

Citizen.CreateThread(function()
    local databaseReady = false
    while not databaseReady do
        Citizen.Wait(500)
        local state = GetResourceState('mysql-async')
        if state == "started" then
            Citizen.Wait(500)
            cropstate:load(function(plantCount)
                if plantCount == 1 then
                else
                end
            end)
            databaseReady = true
        end
    end

    while true do
        Citizen.Wait(0)
        local now = os.time()
        local begin = GetGameTimer()
        local plantsHandled = 0
        for id, plant in pairs(cropstate.index) do
            if type(id) == 'number' then -- Because of the whole "hashtable = true" thing
                local stageData = Growth[plant.data.stage]
                local growthTime = (stageData.time * 60 * Config.TimeMultiplier)
                local soilQuality = Config.Soil[plant.data.soil] or 1.0

                if stageData.interact then
                    local relevantTime = plant.data.time + ((growthTime / soilQuality) * Config.TimeMultiplier)
                    if now >= relevantTime then
                        verbose('Plant',id,'has died: No interaction in time')
                        --cropstate:remove(id)
                    end
                else
                    local relevantTime = plant.data.time + ((growthTime * soilQuality) * Config.TimeMultiplier)
                    if now >= relevantTime then
                        if plant.data.stage < #Growth then
                            verbose('Plant',id,'has grown to stage',plant.data.stage + 1)
                            cropstate:update(id, plant.data.stage + 1)
                        else
                            verbose('Plant',id,'has died: Ran out of stages')
                            cropstate:remove(id)
                        end
                    end
                end

                plantsHandled = plantsHandled + 1
                if plantsHandled % 10 == 0 then
                    Citizen.Wait(0)
                end
            end
        end

        tickPlantCount = plantsHandled
        local tickTime = GetGameTimer() - begin
        table.insert(tickTimes, tickTime)
        while #tickTimes > 20 do
            table.remove(tickTimes, 1)
        end
    end
end)

local commands = {
    debug = function(source, args)
        if source == 0 then
        else
            TriggerClientEvent('ox_rcannabis:toggle_debug', source)
        end
    end,
    stage = function(source, args)
        if args[1] and string.match(args[1], "^%d+$") then
            local plant = tonumber(args[1])
            if cropstate.index[plant] then
                if args[2] and string.match(args[2], "^%d+$") then
                    local stage = tonumber(args[2])
                    if stage > 0 and stage <= #Growth then
                        cropstate:update(plant, stage)
                    else
                        inChat(source, string.format("%i is an invalid stage", stage))
                    end
                else
                    inChat(source, "What stage?")
                end
            else
                inChat(source,string.format("Plant %i does not exist!", plant))
            end
        else
            inChat(source, "What plant, you say?")
        end
    end,
    forest = function(source, args)
        if source == 0 then
        else

            local count = #Growth * #Growth
            if args[1] and string.match(args[1], "%d+$") then
                count = tonumber(args[1])
            end

            local randomStage = false
            if args[2] then randomStage = true end

            TriggerClientEvent('ox_rcannabis:test_forest', source, count, randomStage)

        end
    end,
    stats = function(source, args)
        if cropstate.loaded then
            local totalTime = 0
            for i,time in ipairs(tickTimes) do
                totalTime = totalTime + time
            end
            local tickTimeAverage = totalTime / #tickTimes
            inChat(source, string.format("Tick time average: %.1fms", tickTimeAverage))
            inChat(source, string.format("Plant count: %i", tickPlantCount))
        else
            inChat(source,'Not loaded yet')
        end
    end,
    groundmat = function(source, args)
        if source == 0 then
        else
            TriggerClientEvent('ox_rcannabis:groundmat', source)
        end
    end,
    pyro = function(source, args)
        if source == 0 then
        else
            TriggerClientEvent('ox_rcannabis:pyromaniac', source)
        end
    end,
}

RegisterNetEvent('ox_rcannabis:removewater')
AddEventHandler ('ox_rcannabis:removewater',function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem("water", 1)
end)

RegisterNetEvent('ox_rcannabis:removefertilisant')
AddEventHandler ('ox_rcannabis:removefertilisant',function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem("fertilisant", 1)
end)

RegisterNetEvent('ox_rcannabis:removegive')
AddEventHandler('ox_rcannabis:removegive', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('tete_cannabis', 1)
	xPlayer.addInventoryItem('pochon_cannabis', 2)
end)