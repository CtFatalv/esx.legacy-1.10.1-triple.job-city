local ESX = nil
local inAnim = false
local isDead = false
local garages = {}

local vehicleClassName = {
  [0] = 'Compacts',
  [1] = 'Sedans',
  [2] = 'SUVs',
  [3] = 'Coupes',
  [4] = 'Muscle',
  [5] = 'Sports Classics',
  [6] = 'Sports',
  [7] = 'Super',
  [8] = 'Motorcycles',
  [9] = 'Off-road',
  [10] = 'Industrial',
  [11] = 'Utility', 
  [12] = 'Vans',
  [13] = 'Cylces',
  [14] = 'Boats',
  [15] = 'Helicopters',
  [16] = 'Planes',
  [17] = 'Service',
  [18] = 'Emergency',
  [19] = 'Military',
  [20] = 'Commercial',
  [21] = 'Train'
}

AddEventHandler('playerSpawned', function()
	id = GetPlayerServerId(PlayerId())
    Player(id).state:set('garagein', false, true)
end)

local Zone = nil
CreateThread(function ()
	Zone = PolyZone:Create({
    vector2(201.44232177734, -806.01776123046),
    vector2(230.87916564942, -817.24353027344),
    vector2(249.4634552002, -765.78173828125),
    vector2(219.92350769042, -756.34637451172)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(-1623.2785644532, -957.73571777344),
  vector2(-1661.8477783204, -924.99645996094),
  vector2(-1615.9337158204, -871.08630371094),
  vector2(-1577.9809570312, -902.70776367188)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(3.1019978523254, 6350.2705078125),
  vector2(23.845537185668, 6325.7939453125),
  vector2(70.496154785156, 6350.513671875),
  vector2(105.10382843018, 6373.4086914062),
  vector2(66.95972442627, 6415.36328125)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(1899.4816894532, 3703.8278808594),
  vector2(1887.884765625, 3695.3176269532),
  vector2(1872.3342285156, 3723.8942871094),
  vector2(1883.7005615234, 3730.3295898438)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(1049.621459961, -769.35955810546),
  vector2(1049.4982910156, -794.42681884766),
  vector2(1031.4383544922, -794.25775146484),
  vector2(1007.809020996, -764.96435546875),
  vector2(1022.2592163086, -752.05505371094)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)

    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(-1188.314086914, -2822.8198242188),
  vector2(-1091.4627685546, -2878.6040039062),
  vector2(-1111.8717041016, -2913.1501464844),
  vector2(-1208.6999511718, -2858.8698730468)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(-784.33251953125, -1490.6889648438),
  vector2(-806.89392089844, -1498.9379882812),
  vector2(-802.64227294922, -1511.8309326172),
  vector2(-779.63269042968, -1503.702758789)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

-- Taxi
CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(914.71258544922, -153.12001037598),
  vector2(927.0532836914, -160.02151489258),
  vector2(904.66235351562, -194.68992614746),
  vector2(893.24865722656, -186.45512390136)
}, {
  name="Zone",
	debugPoly = false,
	--minZ = 30.07371520996,
	--maxZ = 31.074838638306
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

-- EMS1
CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(329.32946777344, -1463.3383789062),
  vector2(343.54052734375, -1475.2907714844),
  vector2(332.51345825196, -1481.7353515625),
  vector2(326.25424194336, -1484.8408203125),
  vector2(319.16177368164, -1482.685546875),
  vector2(316.20797729492, -1478.9173583984)
}, {
  name="Zone",
	debugPoly = false,
  minZ=28.42,
  maxZ=35.62
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

-- EMS2
CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(315.16018676758, -1478.386352539),
  vector2(327.35888671875, -1462.862915039),
  vector2(290.76263427734, -1433.0769042968),
  vector2(278.17166137696, -1447.7524414062)
}, {
  name="Zone",
	debugPoly = false,
  minZ=45.51,
  maxZ=50.31
})

Zone:onPlayerInOut(function (isPointInside)
    if isPointInside then
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', true, true)
    else
        id = GetPlayerServerId(PlayerId())
        Player(id).state:set('garagein', false, true)
    end
    end)
end)

-- Thread
CreateThread(function() -- Framework
	while ESX == nil do
		ESX = exports["es_extended"]:getSharedObject()
		Wait(10)
	end 
  
	while ESX.GetPlayerData().job == nil or ESX.GetPlayerData().job2 == nil or ESX.GetPlayerData().job3 == nil and ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
end)

CreateThread(function() -- Create Blips And Spawn Peds
  for _, v in pairs(Config.Garages) do
    if v.Blip then
      local blip = AddBlipForCoord(v.Coords)
      for blipsType, blips in pairs(Config.Blips.Garages) do
        if blipsType == v.Type then
          SetBlipSprite(blip, blips.Sprite)
          SetBlipColour(blip, blips.Colour)
          SetBlipDisplay(blip, blips.Display)
          SetBlipScale(blip, blips.Scale)
        end
      end
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentSubstringPlayerName(_K('garage', v.Label))
      EndTextCommandSetBlipName(blip)
    end
    SpawnNpc(v.Coords, v.PedHeading, Config.Peds[1])
  end

  for _, v in pairs(Config.Impound) do
    if v.Blip then
      local blip = AddBlipForCoord(v.Coords)
      for blipsType, blips in pairs(Config.Blips.Impounds) do
        if blipsType == v.Type then
          SetBlipSprite(blip, blips.Sprite)
          SetBlipColour(blip, blips.Colour)
          SetBlipDisplay(blip, blips.Display)
          SetBlipScale(blip, blips.Scale)
        end
      end
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentSubstringPlayerName(_K('impound', v.Label))
      EndTextCommandSetBlipName(blip)
    end
    SpawnNpc(v.Coords, v.PedHeading, Config.Peds[2])
  end
end)

CreateThread(function() -- ox_target Get and Save Vehicle
  if Config.UseTarget then
    exports.ox_target:addModel(Config.Peds, {
      {
        name = 'getVehGarage',
        icon = 'fa-solid fa-car',
        label = _K('get_veh_list'),
        onSelect = function(data)
          for garageName, garage in pairs(Config.Garages) do
            if #(data.coords - garage.Coords) < 2.0 then
              data.vehType = garage.Type
              data.stored = 1
              data.parkingKey = garageName
              data.NotFree = garage.NotFree
              data.spawnPoints = garage.SpawnPoint
              PlayAnim(Config.UseAnim)
              GetVehInGarage(data)
            end
          end
        end,
        canInteract = function(entity, distance, coords, name, bone)
          for garageName, garage in pairs(Config.Garages) do
            if #(coords - garage.Coords) < 2.0 then 
              if distance < 2.0 and HasPlayers(garageName) and HasGroups(garageName) and not isDead then return true end
            end
          end
        end
      },
      {
        name = 'getVehImpound',
        icon = 'fa-solid fa-car',
        label = _K('get_veh_list'),
        onSelect = function(data)
          for impoundName, impound in pairs(Config.Impound) do
            if #(data.coords - impound.Coords) < 2.0 then
              data.vehType = impound.Type
              data.stored = 0
              data.parkingKey = impoundName
              data.NotFree = impound.NotFree
              data.spawnPoints = impound.SpawnPoint
              PlayAnim(Config.UseAnim)
              GetVehInImpound(data)
            end
          end
        end,
        canInteract = function(entity, distance, coords, name, bone)
          for garageName, impound in pairs(Config.Impound) do
            if distance < 2.0 and #(coords - impound.Coords) < 2.0 and not isDead then return true end
          end
        end
      },
    })
    
    for garageName, garage in pairs(Config.Garages) do
      for i = 1, #garage.DeletePoint do
        exports.ox_target:addGlobalVehicle({
          {
            name = 'storedVeh',
            icon = 'fa-solid fa-square-parking',
            label = _K('parking'),
            onSelect = function(data)
			if Player(id).state.garagein then
				if #(data.coords - garage.DeletePoint[i].Pos) < 45.0 then
					SaveVeh(garageName, data.entity)
				end
			end
            end,
            canInteract = function(entity, distance, coords, name, bone)
			if #(coords - garage.DeletePoint[i].Pos) < 45.0 and HasPlayers(garageName) and HasGroups(garageName) and not isDead then return true end
            end
          }
        })
      end
    end
  end
end)

CreateThread(function() -- not ox_target Get and Save Vehicle
  while not Config.UseTarget do 
    local Sleep = 1500
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    local tempData = {}

    for garageName, garage in pairs(Config.Garages) do
      if #(playerCoords - garage.Coords) < 3.0  and not isDead then
        if HasPlayers(garageName) and HasGroups(garageName) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
          Sleep = 0
          tempData.type = 'Garages'
          tempData.vehType = garage.Type
          tempData.stored = 1
          tempData.parkingKey = garageName
          tempData.spawnPoints = garage.SpawnPoint
          tempData.NotFree = garage.NotFree
          ESX.Game.Utils.DrawText3D(vector3(garage.Coords.x, garage.Coords.y, garage.Coords.z + 1.0), _K('press_get_veh'), 1.0, 4)
          if IsControlJustReleased(0, 38) then
            PlayAnim(Config.UseAnim)
            GetVehInGarage(tempData)
            tempData = {}
          end
        end
      end
      
      for i = 1, #garage.DeletePoint, 1 do
        if #(playerCoords - garage.DeletePoint[i].Pos) < 10  and not isDead then
          if IsPedInAnyVehicle(GetPlayerPed(-1), false) and HasPlayers(garageName) and HasGroups(garageName) then
            DrawMarker(36, garage.DeletePoint[i].Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 100, 100, 100, false, true, 2, true, false, false, false)   
            Sleep = 0
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            if #(playerCoords - garage.DeletePoint[i].Pos) < 2.0 then
              if IsControlJustReleased(0, 38) then
                SaveVeh(garageName, vehicle)
              end
            end
          end
        end
      end
    end

    for impoundName, impound in pairs(Config.Impound) do
      if not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not isDead then
        if #(playerCoords - impound.Coords) < 3.0 then
          Sleep = 0
          tempData.type = 'Impound'
          tempData.vehType = impound.Type
          tempData.stored = 0
          tempData.parkingKey = impoundName
          tempData.spawnPoints = impound.SpawnPoint
          tempData.notFree = impound.NotFree
          ESX.Game.Utils.DrawText3D(vector3(impound.Coords.x, impound.Coords.y, impound.Coords.z + 1.0), _K('press_get_veh'), 1.0, 4)
          if IsControlJustReleased(0, 38) then
            PlayAnim(Config.UseAnim)
            GetVehInImpound(tempData)
            tempData = {}
          end
        end
      end
    end
    Wait(Sleep)
  end
end)

CreateThread(function() -- Auto Save Vehicle Properties
  while true do
    Sleep = 2500
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
      Sleep = 1000
      local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
      local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
      vehicleProps.deformation = GetVehicleDeformation(vehicle)
      TriggerServerEvent('kc_garage:updateVehicleProperties', vehicleProps.plate, vehicleProps)
    end
    Wait(Sleep)
  end
end)

-- Event
RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
  ESX.PlayerData.job = job
end)

RegisterNetEvent("esx:setJob2")
AddEventHandler("esx:setJob2", function(job2)
  ESX.PlayerData.job2 = job2
end)

RegisterNetEvent("esx:setJob3")
AddEventHandler("esx:setJob3", function(job3)
  ESX.PlayerData.job3 = job3
end)

AddEventHandler('esx:onPlayerDeath', function(data) 
  isDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(data)
	isDead = false
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  Wait(500)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('kc_garage:notify')
AddEventHandler('kc_garage:notify', function(_type, args)
  if Config.Notify == 'mythic_notify' then
    exports['mythic_notify']:DoHudText(_type, args)
  elseif Config.Notify == 'lib' then
    lib.notify({
      description = args,
      type = _type
    })
  elseif Config.Notify == 'ESX' then
    if _type == 'inform' then _type = 'info' end
    ESX.ShowNotification(args, _type)
  end
end)

RegisterNetEvent('kc_garage:vehLockedEffect')
AddEventHandler('kc_garage:vehLockedEffect', function(netId, lockStatus)
  local vehicle = NetToVeh(netId)
  if DoesEntityExist(vehicle) then
    local ped = PlayerPedId()

    local prop = GetHashKey('p_car_keys_01')
    RequestModel(prop)
    while not HasModelLoaded(prop) do
        Citizen.Wait(10)
    end
    local keyObj = CreateObject(prop, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(keyObj, ped, GetPedBoneIndex(ped, 57005), 0.08, 0.039, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    local dict = "anim@mp_player_intmenu@key_fob@"

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
      Citizen.Wait(0)
    end

    if not IsPedInAnyVehicle(PlayerPedId(), true) then
      TaskPlayAnim(ped, dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
    end

    PlayVehicleDoorOpenSound(vehicle, 1)
    SetVehicleDoorsLockedForAllPlayers(vehicle, lockStatus)
    if lockStatus then
      TriggerEvent('kc_garage:notify', 'inform', _K('veh_locked'))
    else
      TriggerEvent('kc_garage:notify', 'inform', _K('veh_unlocked'))
    end
    SetVehicleLights(vehicle, 2)
    StartVehicleHorn(vehicle, 50, 'HELDDOWN', false)
    Citizen.Wait(250)
    StartVehicleHorn(vehicle, 50, 'HELDDOWN', false)
    SetVehicleLights(vehicle, 0)
    Citizen.Wait(250)
    SetVehicleLights(vehicle, 2)
    Citizen.Wait(250)
    SetVehicleLights(vehicle, 0)
    Wait(600)
    DetachEntity(keyObj, false, false)
    DeleteEntity(keyObj)
  end
end)

RegisterNetEvent('kc_garage:deleteAllVehicles')
AddEventHandler('kc_garage:deleteAllVehicles', function()
  local minuteCalculation = 6000
  local minutesPassed = 0
  local minutesLeft = Config.DeleteVehicleTimer

  TriggerEvent('kc_garage:notify', 'inform', _K('del_veh_msg', minutesLeft))

  while minutesPassed < Config.DeleteVehicleTimer do
    Citizen.Wait(1*minuteCalculation)
    minutesPassed = minutesPassed + 1
    minutesLeft = minutesLeft - 1
    if minutesLeft == 0 then
      TriggerEvent('kc_garage:notify', 'inform', _K('del_veh_end'))
    elseif minutesLeft == 1 then
      TriggerEvent('kc_garage:notify', 'inform', _K('del_veh_msg', minutesLeft))
    else
      TriggerEvent('kc_garage:notify', 'inform', _K('del_veh_msg', minutesLeft))
    end
  end

	for vehicle in EnumerateVehicles() do
		local canDelete = true
		local carCoords = GetEntityCoords(vehicle)

		if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
			if not Config.DeleteVehiclesIfInSafeZone then
				for i = 1, #Config.SafeZones, 1 do
					dist = Vdist(Config.SafeZones[i].x, Config.SafeZones[i].y, Config.SafeZones[i].z, carCoords.x, carCoords.y, carCoords.z)
					if dist < Config.SafeZones[i].radius then
						canDelete = false
					end
				end
			end
			if canDelete then
				SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
				SetEntityAsMissionEntity(vehicle, false, false)
				DeleteVehicle(vehicle)
				if (DoesEntityExist(vehicle)) then 
					DeleteVehicle(vehicle) 
				end
        TriggerServerEvent('kc_garage:filterVehiclesType')
        -- TriggerServerEvent('kc_fuel:UpdateVehicleDateTimeIn', plate) -- REMOVE THIS
			end
		end
	end
end)

RegisterNetEvent('kc_garage:setCoords')
AddEventHandler('kc_garage:setCoords', function(coords)
  SetNewWaypoint(coords.x, coords.y)
  TriggerEvent('kc_garage:notify', 'success', _K('gps_set'))
end)

RegisterNetEvent('kc_garage:spawnVehicle')
AddEventHandler('kc_garage:spawnVehicle', function(data)
  local foundSpawn, SpawnPoint = GetAvailableVehicleSpawnPoint(data.spawnPoints)
  
  WaitForVehicleToLoad(data.vehicle.model)
  ESX.Game.SpawnVehicle(data.vehicle.model, SpawnPoint.Pos, SpawnPoint.Heading, function(vehicle)
    SetVehicleEngineHealth(vehicle, data.vehicle.engineHealth)
    SetVehicleFuelLevel(vehicle, data.vehicle.fuelLevel)
    SetVehicleBodyHealth(vehicle, data.vehicle.bodyHealth)
    SetVehicleDeformation(vehicle, data.vehicle.deformation or GetVehicleDeformation(vehicle))
    ESX.Game.SetVehicleProperties(vehicle, data.vehicle)
    
    if Config.AutoTeleportToVehicle then
      TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
      SetVehicleEngineOn(vehicle, true, true)
    end

    if Config.AutoLockVeh then
      SetVehicleDoorsLocked(vehicle, 2)
    end
    TriggerServerEvent('kc_garage:payFee', data)
    for impoundName, impound in pairs(Config.Impound) do
      if data.vehType == impound.Type then
        if impound.IsDefaultImpound then
          TriggerServerEvent('kc_garage:updateStoredVehicle', 0, impoundName, data.vehicle.plate)
        end
      end
    end
    TriggerEvent('kc_garage:notify', 'success', _K('veh_spawn'))
  end)
end)

-- Function
function GetVehInGarage(data)
  ESX.TriggerServerCallback('kc_garage:getVehiclesInParking', function(vehData)
    local vehicleList = {}
    for i = 1, #vehData, 1 do
      if Config.ShowVehImpoundInGarage then
        vehicleList['! Afficher les véhicules en fourrière'] = {
          icon = 'lock',
          arrow = true,
          onSelect = function() GetVehInImpound(data, 'Garages') end,
        }
      end
      
      local price = Config.VehicleFee.Garages[GetVehicleClassFromName(vehData[i].vehicle.model)]
      local color = '#2B8A3E'

      if vehData[i].parking ~= data.parkingKey then
        price = math.floor(price * Config.FeeSpawnVehicleInAnyGarage[1])
        color = '#C92A2A'
      end
      
      if data.vehType == vehData[i].vehType and vehData[i].stored then
        local vehLabel = GetLabelText(GetDisplayNameFromVehicleModel(vehData[i].vehicle.model))
        vehicleList[vehLabel..' | '..vehData[i].plate] = {
          description = _K('engine')..toPercent(vehData[i].vehicle.engineHealth)..'% | '.._K('body')..toPercent(vehData[i].vehicle.bodyHealth)..'% | '.._K('fuel')..vehData[i].vehicle.fuelLevel.. '%',
          icon = GetIcons(vehicleClassName[GetVehicleClassFromName(vehData[i].vehicle.model)]),
          iconColor = color or nil,
          metadata = {
            [_K('parking')] = GetParkingLabel(vehData[i].parking, 'Garages', vehData[i].vehType), 
            [_K('plate')] = vehData[i].plate,
            [_K('fee')] = price,
            [_K('type')] = vehicleClassName[GetVehicleClassFromName(vehData[i].vehicle.model)]
          },
          onSelect = function()
            spawnData = {
              type = 'Garages',
              vehType = vehData[i].vehType,
              spawnPoints = data.spawnPoints,
              vehicle = vehData[i].vehicle,
              price = price,
              notFree = data.NotFree
            }
            PlayAnim(Config.UseAnim)
            local foundSpawn, SpawnPoint = GetAvailableVehicleSpawnPoint(data.spawnPoints)
            if foundSpawn then
              if Config.SpawnVehicleInAnyGarage then
                TriggerServerEvent('kc_garage:vehicleChecking', spawnData)
              else
                if vehData[i].parking == data.parkingKey then
                  TriggerServerEvent('kc_garage:vehicleChecking', spawnData)
                else
                  TriggerEvent('kc_garage:notify', 'error', _K('canot_spawn_here'))
                end
              end
            end
          end,
        }
      end
    end
    lib.registerContext({
      id = 'kc_garage:openVehicleGaragesMenu',
      title = GetParkingLabel(data.parkingKey, 'Garages', data.vehType),
      options = vehicleList,
      onExit = function()
        PlayAnim(Config.UseAnim)
      end
    })
    lib.showContext('kc_garage:openVehicleGaragesMenu')
  end)
end

function GetVehInImpound(data, key)
  ESX.TriggerServerCallback('kc_garage:getVehiclesInParking', function(vehData)
    local vehicleList = {}
    for i = 1, #vehData, 1 do
      if data.vehType == vehData[i].vehType and not vehData[i].stored then

        local vehLabel = GetLabelText(GetDisplayNameFromVehicleModel(vehData[i].vehicle.model))
        local price = Config.VehicleFee.Impound[GetVehicleClassFromName(vehData[i].vehicle.model)]
        local color = '#2B8A3E'

        if vehData[i].parking ~= data.parkingKey then
          price = math.floor(price * Config.FeeSpawnVehicleInAnyGarage[2])
          color = '#C92A2A'
        end
        
        vehicleList[vehLabel..' | '..vehData[i].plate] = {
          description = _K('engine')..toPercent(vehData[i].vehicle.engineHealth)..'% | '.._K('body')..toPercent(vehData[i].vehicle.bodyHealth)..'% | '.._K('fuel')..vehData[i].vehicle.fuelLevel.. '%',
          icon = GetIcons(vehicleClassName[GetVehicleClassFromName(vehData[i].vehicle.model)]),
          iconColor = color or nil,
          metadata = {
            [_K('parking')] = GetParkingLabel(vehData[i].parking, 'Impound', vehData[i].vehType), 
            [_K('plate')] = vehData[i].plate,
            [_K('fee')] = price,
            [_K('type')] = vehicleClassName[GetVehicleClassFromName(vehData[i].vehicle.model)]
          },
          onSelect = function()
            spawnData = {
              type = 'Impound',
              vehType = vehData[i].vehType,
              spawnPoints = data.spawnPoints,
              vehicle = vehData[i].vehicle,
              price = price,
              notFree = data.NotFree
            }
            PlayAnim(Config.UseAnim)
            local foundSpawn, SpawnPoint = GetAvailableVehicleSpawnPoint(data.spawnPoints)
            if foundSpawn then
              if Config.SpawnVehicleInAnyGarage and not string.match(vehData[i].parking, 'Jobs',  'Jobs2') then
                TriggerServerEvent('kc_garage:vehicleChecking', spawnData)
              else
                if vehData[i].parking == data.parkingKey then
                  TriggerServerEvent('kc_garage:vehicleChecking', spawnData)
                else
                  TriggerEvent('kc_garage:notify', 'error', _K('canot_spawn_here'))
                end
              end
            end
          end,
        }
      end
    end
    
    local menu = 'kc_garage:openVehicleGaragesMenu'

    if key == nil then 
      key = 'Impound'
      menu = nil
    end

    lib.registerContext({
      id = 'kc_garage:openVehicleListImpoundMenu',
      title = GetParkingLabel(data.parkingKey, key, data.vehType),
      options = vehicleList,
      menu = menu,
      onExit = function()
        PlayAnim(Config.UseAnim)
      end
    })
    lib.showContext('kc_garage:openVehicleListImpoundMenu')
  end)
end

function SaveVeh(garageName, vehicle)
  local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
  vehicleProps.deformation = GetVehicleDeformation(vehicle)
  ESX.TriggerServerCallback('kc_garage:checkVehicle', function(data)
    if data and data[1].owner then
      if Config.Garages[garageName].Type == data[1].vehType then
        if not Config.UseTarget then
          exports.ox_target:removeGlobalVehicle('storedVeh')
          TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 1)
          Wait(2000)
        end
        if DoesEntityExist(vehicle) then
          DeleteVehicle(vehicle)
          TriggerServerEvent('kc_garage:updateOwnedVehicle', 1, garageName, vehicleProps)
          -- TriggerServerEvent('kc_fuel:UpdateVehicleDateTimeIn', plate) -- REMOVE THIS
        else
          TriggerEvent('kc_garage:notify', 'error', _K('veh_not_exist'))
        end
      else
        TriggerEvent('kc_garage:notify', 'error', _K('canot_store'))
      end
    else
      TriggerEvent('kc_garage:notify', 'error', _K('not_yours_veh'))
    end
  end, vehicleProps.plate)
end

function GetIcons(vehClass)
  if vehClass == 'Motorcycles' then
    return 'motorcycle'
  elseif vehClass == 'Cylces' then
    return 'bicycle'
  elseif vehClass == 'Boats' then
    return 'ship'
  elseif vehClass == 'Helicopters' then
    return 'helicopter'
  elseif vehClass == 'Planes'then
    return 'plane'
  else
    return 'car-side'
  end
end

function GetAvailableVehicleSpawnPoint(spawnPoints)
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].Pos, 2.0) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		TriggerEvent('kc_garage:notify', 'error', _K('veh_blocked'))
		return false
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or joaat(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyspinnerOn('STRING')
		AddTextComponentSubstringPlayerName('DOWNLOADING ASSETS...')
		EndTextCommandBusyspinnerOn(4)

		while not HasModelLoaded(modelHash) do
			Wait(0)
			DisableAllControlActions(0)
		end

		BusyspinnerOff()
	end
end

function HasPlayers(garage)
  local players = Config.Garages[garage].Players[1]
  if players then
    for i = 1, #players, 1 do
      local Player = players[i]
      if ESX.PlayerData.identifier == Player then
        return true
      end
    end
  else
    return true
  end
end

function HasGroups(garage)
  local Groups = Config.Garages[garage].Groups[1]
  if Groups then
    for i = 1, #Groups, 1 do
      local Group = Groups[i]
      if ESX.PlayerData.job.name == Group or ESX.PlayerData.job2.name == Group or ESX.PlayerData.job3.name == Group then
        return true
      end
    end
  else
    return true
  end
end

function SpawnNpc(coords, heading, model)
  local hash = GetHashKey(model)

  RequestModel(hash)
  while not HasModelLoaded(hash) do
    Wait(15)
  end

  local ped = CreatePed(4, hash, coords[1], coords[2], coords[3] - 1, 3374176, false, true)
  SetEntityHeading(ped, heading)
  FreezeEntityPosition(ped, true)
  SetEntityInvincible(ped, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
end

function toPercent(v)
  return math.floor(v * 100) / 1000
end

function JobsImpound(impoundLoc, vehicle, identifier)
  local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
  vehicleProps.deformation = GetVehicleDeformation(vehicle)

  TriggerServerEvent('kc_garage:jobsImpoundVehicle', impoundLoc, vehicleProps.plate, vehicleProps, identifier)

  if DoesEntityExist(vehicle) then
    DeleteVehicle(vehicle)
  end
end

function GetParkingLabel(configKey, configType, vehType)
  for k, v in pairs(Config[configType]) do
    if string.match(configKey, k) and vehType == v.Type then
      return v.Label
    end
  end
end

function PlayAnim(useAnim)
  if useAnim then
    SetPedCurrentWeaponVisible(GetPlayerPed(-1), 0, 1, 1, 1)
    local dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a'
    local prop = 'prop_cs_tablet'
    
    while not HasModelLoaded(prop) do
        RequestModel(prop)
        Wait(10)
    end
    
    if not inAnim then
      inAnim = true

      while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
      end
      
      TaskPlayAnim(GetPlayerPed(-1), dict, 'idle_a', 8.0, 8.0, -1, 49, 0.0, 0, 0, 0)
      local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
      local entityProp = CreateObject(GetHashKey(prop), x, y, z + 0.2,  true,  true, true)
      AttachEntityToEntity(entityProp, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), -0.05, 0.00, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

    else
      inAnim = false
      local entityProp = GetClosestObjectOfType(GetEntityCoords(GetPlayerPed(-1)), 1.0, GetHashKey(prop), false, 0, 0)
      DeleteEntity(entityProp)
      ClearPedTasks(GetPlayerPed(-1))
      SetPedCurrentWeaponVisible(GetPlayerPed(-1), 1, 1, 1, 1)
    end
  end
end

-- Commands
RegisterKeyMapping('lockvehicle', 'Toggle vehicle locks', 'keyboard', Config.LockKeyVehicle)
RegisterCommand('lockvehicle', function()
  local vehicle, dist = ESX.Game.GetClosestVehicle()

  if dist < 10 and vehicle > 0 then
    local plate = ESX.Game.GetVehicleProperties(vehicle).plate
    ClearPedTasks(PlayerPedId())
    Wait(100)
    TriggerServerEvent('kc_garage:requestVehicleLock', VehToNet(vehicle), GetVehicleDoorLockStatus(vehicle), plate)
  end
end)

RegisterCommand('givekeys', function()
  local closestP, closestD = ESX.Game.GetClosestPlayer()
  local vehicle, dist = ESX.Game.GetClosestVehicle()
  if DoesEntityExist(vehicle) and closestP ~= -1 and closestD < 4 and dist < 10 then
    local plate = ESX.Game.GetVehicleProperties(vehicle).plate
    TriggerServerEvent('kc_garage:giveKeyToPerson', plate, GetPlayerServerId(closestP))
  else
    TriggerEvent('kc_garage:notify', 'error', _K('not_found'))
  end
end)

RegisterCommand(Config.CmdVehDelete, function()
  ESX.TriggerServerCallback('kc_garage:getPlayersGroup', function(allowed)
    if allowed then
      TriggerEvent('kc_garage:deleteAllVehicles')
    else
      TriggerEvent('kc_garage:notify', 'error', _K('not_allowed'))
    end
  end)
end)

-- Exports
exports('JobsImpound', JobsImpound)

-- RegisterCommand('JobsImpound', function()
--   local vehicle = ESX.Game.GetClosestVehicle()
--   JobsImpound('JobsImpound', vehicle, ESX.PlayerData.identifier)
-- end)