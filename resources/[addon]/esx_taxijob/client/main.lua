local HasAlreadyEnteredMarker, OnJob, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle,
    CurrentActionData = false, false, false, false, false, {}
local CurrentCustomer, CurrentCustomerBlip, DestinationBlip, targetCoords, LastZone, CurrentAction, CurrentActionMsg

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function DrawSub(msg, time)
    ClearPrints()
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandPrint(time, 1)
end

function ShowLoadingPromt(msg, time, type)
    CreateThread(function()
        Wait(0)

        BeginTextCommandBusyspinnerOn('STRING')
        AddTextComponentSubstringPlayerName(msg)
        EndTextCommandBusyspinnerOn(type)
        Wait(time)

        BusyspinnerOff()
    end)
end

function GetRandomWalkingNPC()
        local search = {}
        local peds = GetGamePool("CPed")
    
        for i = 1, #peds, 1 do
            if IsPedHuman(peds[i]) and IsPedWalking(peds[i]) and not IsPedAPlayer(peds[i]) then
                search[#search+1] = peds[i]
            end
        end
    
        if #search > 0 then
            return search[math.random(#search)]
        end
end

function ClearCurrentMission()
    if DoesBlipExist(CurrentCustomerBlip) then
        RemoveBlip(CurrentCustomerBlip)
    end

    if DoesBlipExist(DestinationBlip) then
        RemoveBlip(DestinationBlip)
    end

    CurrentCustomer = nil
    CurrentCustomerBlip = nil
    DestinationBlip = nil
    IsNearCustomer = false
    CustomerIsEnteringVehicle = false
    CustomerEnteredVehicle = false
    targetCoords = nil
end

function StartTaxiJob()
    ShowLoadingPromt(TranslateCap('taking_service'), 5000, 3)
    ClearCurrentMission()

    OnJob = true
end

function StopTaxiJob()
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) and CurrentCustomer ~= nil then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TaskLeaveVehicle(CurrentCustomer, vehicle, 0)

        if CustomerEnteredVehicle then
            TaskGoStraightToCoord(CurrentCustomer, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
        end
    end

    ClearCurrentMission()
    OnJob = false
    DrawSub(TranslateCap('mission_complete'), 5000)
end

function IsInAuthorizedVehicle()
    local playerPed = PlayerPedId()
    local vehModel = GetEntityModel(GetVehiclePedIsIn(playerPed, false))

    for i = 1, #Config.AuthorizedVehicles, 1 do
        if vehModel == joaat(Config.AuthorizedVehicles[i].model) then
            return true
        end
    end

    return false
end

AddEventHandler('esx_taxijob:hasExitedMarker', function(zone)
    ESX.CloseContext()
    CurrentAction = nil
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
    local specialContact = {
        name = TranslateCap('phone_taxi'),
        number = 'taxi',
        base64Icon = 'data:image/png;base64,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'
    }

    TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- Create Blips
CreateThread(function()
    local blip = AddBlipForCoord(Config.Zones.TaxiActions.Pos.x, Config.Zones.TaxiActions.Pos.y,
        Config.Zones.TaxiActions.Pos.z)

    SetBlipSprite(blip, 198)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 5)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(TranslateCap('blip_taxi'))
    EndTextCommandSetBlipName(blip)
end)

-- Taxi Job
CreateThread(function()
    while true do
        local Sleep = 1500

        if OnJob then
            Sleep = 0
            local playerPed = PlayerPedId()
            if CurrentCustomer == nil then
                DrawSub(TranslateCap('drive_search_pass'), 5000)
            
                if IsPedInAnyVehicle(playerPed, false) and OnJob then
                    Wait(5000)
                        CurrentCustomer = GetRandomWalkingNPC()

                        if CurrentCustomer ~= nil then
                            CurrentCustomerBlip = AddBlipForEntity(CurrentCustomer)

                            SetBlipAsFriendly(CurrentCustomerBlip, true)
                            SetBlipColour(CurrentCustomerBlip, 2)
                            SetBlipCategory(CurrentCustomerBlip, 3)
                            SetBlipRoute(CurrentCustomerBlip, true)

                            SetEntityAsMissionEntity(CurrentCustomer, true, false)
                            ClearPedTasksImmediately(CurrentCustomer)
                            SetBlockingOfNonTemporaryEvents(CurrentCustomer, true)

                            local standTime = GetRandomIntInRange(60000, 180000)
                            TaskStandStill(CurrentCustomer, standTime)

                            ESX.ShowNotification(TranslateCap('customer_found'))
                        end
                end
            else
                if IsPedFatallyInjured(CurrentCustomer) then
                    ESX.ShowNotification(TranslateCap('client_unconcious'))

                    if DoesBlipExist(CurrentCustomerBlip) then
                        RemoveBlip(CurrentCustomerBlip)
                    end

                    if DoesBlipExist(DestinationBlip) then
                        RemoveBlip(DestinationBlip)
                    end

                    SetEntityAsMissionEntity(CurrentCustomer, false, true)

                    CurrentCustomer, CurrentCustomerBlip, DestinationBlip, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, targetCoords =
                        nil, nil, nil, false, false, false, nil
                end

                if IsPedInAnyVehicle(playerPed, false) then
                    local vehicle = GetVehiclePedIsIn(playerPed, false)
                    local playerCoords = GetEntityCoords(playerPed)
                    local customerCoords = GetEntityCoords(CurrentCustomer)
                    local customerDistance = #(playerCoords - customerCoords)

                    if IsPedSittingInVehicle(CurrentCustomer, vehicle) then
                        if CustomerEnteredVehicle then
                            local targetDistance = #(playerCoords - targetCoords)

                            if targetDistance <= 10.0 then
                                TaskLeaveVehicle(CurrentCustomer, vehicle, 0)

                                ESX.ShowNotification(TranslateCap('arrive_dest'))

                                TaskGoStraightToCoord(CurrentCustomer, targetCoords.x, targetCoords.y, targetCoords.z,
                                    1.0, -1, 0.0, 0.0)
                                SetEntityAsMissionEntity(CurrentCustomer, false, true)
                                TriggerServerEvent('esx_taxijob:success')
                                RemoveBlip(DestinationBlip)

                                local function scope(customer)
                                    ESX.SetTimeout(60000, function()
                                        DeletePed(customer)
                                    end)
                                end

                                scope(CurrentCustomer)

                                CurrentCustomer, CurrentCustomerBlip, DestinationBlip, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, targetCoords =
                                    nil, nil, nil, false, false, false, nil
                            end

                            if targetCoords then
                                DrawMarker(36, targetCoords.x, targetCoords.y, targetCoords.z + 1.1, 0.0, 0.0, 0.0, 0.0,
                                    0.0, 0.0, 1.0, 1.0, 1.0, 234, 223, 72, 155, false, false, 2, true, nil, nil, false)
                            end
                        else
                            RemoveBlip(CurrentCustomerBlip)
                            CurrentCustomerBlip = nil
                            targetCoords = Config.JobLocations[GetRandomIntInRange(1, #Config.JobLocations)]
                            local distance = #(playerCoords - targetCoords)
                            while distance < Config.MinimumDistance do
                                Wait(0)

                                targetCoords = Config.JobLocations[GetRandomIntInRange(1, #Config.JobLocations)]
                                distance = #(playerCoords - targetCoords)
                            end

                            local street = table.pack(GetStreetNameAtCoord(targetCoords.x, targetCoords.y,
                                targetCoords.z))
                            local msg = nil

                            if street[2] ~= 0 and street[2] ~= nil then
                                msg = string.format(TranslateCap('take_me_to_near', GetStreetNameFromHashKey(street[1]),
                                    GetStreetNameFromHashKey(street[2])))
                            else
                                msg = string.format(TranslateCap('take_me_to', GetStreetNameFromHashKey(street[1])))
                            end

                            ESX.ShowNotification(msg)

                            DestinationBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

                            BeginTextCommandSetBlipName('STRING')
                            AddTextComponentSubstringPlayerName('Destination')
                            EndTextCommandSetBlipName(DestinationBlip)
                            SetBlipRoute(DestinationBlip, true)

                            CustomerEnteredVehicle = true
                        end
                    else
                        DrawMarker(36, customerCoords.x, customerCoords.y, customerCoords.z + 1.1, 0.0, 0.0, 0.0, 0.0,
                            0.0, 0.0, 1.0, 1.0, 1.0, 234, 223, 72, 155, false, false, 2, true, nil, nil, false)

                        if not CustomerEnteredVehicle then
                            if customerDistance <= 40.0 then

                                if not IsNearCustomer then
                                    ESX.ShowNotification(TranslateCap('close_to_client'))
                                    IsNearCustomer = true
                                end

                            end

                            if customerDistance <= 20.0 then
                                if not CustomerIsEnteringVehicle then
                                    ClearPedTasksImmediately(CurrentCustomer)

                                    local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

                                    for i = maxSeats - 1, 0, -1 do
                                        if IsVehicleSeatFree(vehicle, i) then
                                            freeSeat = i
                                            break
                                        end
                                    end

                                    if freeSeat then
                                        TaskEnterVehicle(CurrentCustomer, vehicle, -1, freeSeat, 2.0, 0)
                                        CustomerIsEnteringVehicle = true
                                    end
                                end
                            end
                        end
                    end
                else
                    DrawSub(TranslateCap('return_to_veh'), 5000)
                end
            end
        end
        Wait(Sleep)
    end
end)

CreateThread(function()
    while OnJob do
        Wait(10000)
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade < 3 then
            if not IsInAuthorizedVehicle() then
                ClearCurrentMission()
                OnJob = false
                ESX.ShowNotification(TranslateCap('not_in_taxi'))
            end
        end
    end
end)

exports.ox_target:addBoxZone({
    coords =  vector3(907.42, -153.37, 83.19),
    size = vec3(0.6, 1.0, 0.1),
    rotation = 252,
    debug = false,
    options = {
        {
            name = 'Gestion',
            event = 'esx_taxijob:bosstaxi',
            icon = 'fa-solid fa-computer',
            label = 'Gestion',
			distance = 1.5,
        }
    }
})

AddEventHandler('esx_taxijob:bosstaxi', function()	
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
	TriggerEvent('esx_society:openBossMenu', 'taxi', function(data, menu)
	end, {wash = true})
	end
end)

AddEventHandler('esx_taxijob:facturetaxi', function()	
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
local elements = {
    {unselectable = true, icon = "fas fa-taxi", title = TranslateCap('taxi')},
    {icon = "fas fa-scroll", title = TranslateCap('billing'), value = "billing"},
}
ESX.OpenContext("right", elements, function(menu,element)
    if element.value == "billing" then
        local elements2 = {
            {unselectable = true, icon = "fas fa-taxi", title = element.title},
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
                    TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_taxi',
                        'Taxi', amount)
                    ESX.ShowNotification(TranslateCap('billing_sent'))
                end
            end
        end)
    end
end)
end
end)

AddEventHandler('esx_taxijob:jobmoldutaxi', function()	
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
 if OnJob then
                ESX.CloseContext()
                StopTaxiJob()
            else
                if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'taxi' then
                    local playerPed = PlayerPedId()
                    local vehicle = GetVehiclePedIsIn(playerPed, false)

                    if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        if tonumber(ESX.PlayerData.job.grade) >= 3 then
                            ESX.CloseContext()
                            StartTaxiJob()
                        else
                            if IsInAuthorizedVehicle() then
                                ESX.CloseContext()
                                StartTaxiJob()
                            else
                                ESX.ShowNotification(TranslateCap('must_in_taxi'))
                            end
                        end
                    else
                        if tonumber(ESX.PlayerData.job.grade) >= 3 then
                            ESX.ShowNotification(TranslateCap('must_in_vehicle'))
                        else
                            ESX.ShowNotification(TranslateCap('must_in_taxi'))
                        end
                    end
                end
            end
	end
end)
