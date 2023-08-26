ESX = exports["es_extended"]:getSharedObject()
local weapon = nil
local ammo = nil
local run = false
local start = false
local inout = false
local Licenses = {}

function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function checkLicensepweapon()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(p_weapon)
	pw = p_weapon
	end, GetPlayerServerId(PlayerId()), 'weapon')
end

local function checkLicensetweapon()
	ESX.TriggerServerCallback('esx_license:checkLicense', function(t_weapon)
	tw = t_weapon
	end, GetPlayerServerId(PlayerId()), 't_weapon')
end

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_ktown_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

	local npc = CreatePed(4, hash,  18.76, -1099.31, 28.83, 342.82, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

    local options = {
        {
            name = 'Passez le permis Arme',
            event = 'rWeaponSchool:code',
            icon = 'fa-solid fa-road',
            label = 'Passez le permis Arme - 5000$',
            distance = 1.6,
        },
    }label = 'test',
    exports.ox_target:addLocalEntity(npc, options)
end)

AddEventHandler('rWeaponSchool:permis', function()
	startTest(10)
end)

function startTest(nb)
    run = true
    poste = 1
    inShoot = false
    ped = {}
    ped_kill = 0
    all_ped = 0
    ligne = math.random(1,4)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(Config.weaponTest),100, true, true)
    weapon = GetSelectedPedWeapon(PlayerPedId())
    ammo = GetAmmoInPedWeapon(PlayerPedId(), weapon)
    while run do 
        Citizen.Wait(1)
        if not inShoot then
            place = math.random(1,6)
            poste = place
            if all_ped < nb then
                for k,v in pairs(Config.PosPed) do
                    if v.ligne == ligne and v.poste == place then
                            local Spawnpedname = GetHashKey(Config.pedModel)
                            while not HasModelLoaded(Spawnpedname) do
                                RequestModel(Spawnpedname)
                                Wait(60)
                            end
                            local Spawnped = CreatePed(9, Spawnpedname, v.x, v.y, v.z - 1, Config.PedHeading, false, true)
                            all_ped = all_ped + 1
                            table.insert(ped, Spawnped)
                            SetBlockingOfNonTemporaryEvents(Spawnped, true)
                            FreezeEntityPosition(Spawnped, true)
                    end 
                end
            else
                run = false
                RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.weaponTest))
                Stat()
            end
            inShoot = true
        else
            for k,v in pairs(ped) do
                if IsEntityDead(v) then
                    DeleteEntity(v)
                    table.remove(ped, k)
                    ped_kill = ped_kill + 1
                    inShoot = false
                end
            end
        end
    end
    for k,v in pairs(ped) do
        DeleteEntity(v)
        table.remove(ped, k)
    end
end

function Stat()
    new_ammo = GetAmmoInPedWeapon(PlayerPedId(), weapon)
    ammo_use = ammo - new_ammo
    pourcentage = ( ped_kill * 100) / ammo_use
    pourcentage = math.round(pourcentage)
    if pourcentage > 0 then
		start = false
        ESX.ShowNotification("~g~Vous avez réussi le test !")
        TriggerServerEvent('rWeaponSchool:addLicence', "weapon")
        	local unarmed = `WEAPON_UNARMED`
        	local player = PlayerId()
			local plyPed = GetPlayerPed(player)
		TriggerServerEvent('rWeaponSchool:removeweapon', source)
	Wait(100)
        	SetCurrentPedWeapon(plyPed, unarmed, true)
	Wait(100)
        	SetCurrentPedWeapon(plyPed, unarmed, true)
    else
        ESX.ShowNotification("~r~Vous avez raté le test !")
    end
end

function Prompt(text, spinner)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandBusyspinnerOn(spinner or 1)
end

function PromptDuration(duration, text, spinner)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        Prompt(text, spinner)
        Citizen.Wait(duration)
        if (BusyspinnerIsOn()) then
            BusyspinnerOff();
        end
    end)
end

AddEventHandler('rWeaponSchool:code', function()
	if start then
		ESX.ShowNotification("une action est déjà en cours!", "error", 3000)
			else
		local ownedLicenses = {}
		checkLicensepweapon()	 
		checkLicensetweapon()	 
		for i=1, #Licenses, 1 do
			ownedLicenses[Licenses[i].type] = true
		end
		Wait(500)
			if pw then
			ESX.ShowNotification("Vous avez déjà obtenu le permis ~r~Arme~s~!", "error", 3000)
			
			else
				if tw then
					TriggerServerEvent('rWeaponSchool:moneyrequest', source)
				else
					ESX.ShowNotification("Vous devez passez la ~r~licence théorique Arme~s~!", "error", 3000)
				end
			end
		end
end)

RegisterNetEvent('rWeaponSchool:moneyok')
AddEventHandler('rWeaponSchool:moneyok', function()
    start = true
    TriggerServerEvent('rWeaponSchool:removeMoney', source)
    TriggerEvent('rWeaponSchool:permis')
end)

-- Création polyzone
local Zone = nil
CreateThread(function ()
	Zone = PolyZone:Create({
  vector2(19.87713432312, -1098.6748046875),
  vector2(7.7124300003052, -1094.2513427734),
  vector2(6.408413887024, -1097.8823242188),
  vector2(18.519021987916, -1102.3280029296)
}, {
  name="Zone",
	debugPoly = false,
      minZ=28.79,
      maxZ=32.19
})

Zone:onPlayerInOut(function (isPointInside)
	if isPointInside then
	inout = true
	local ownedLicenses = {} 
	checkLicensetweapon()	
	checkLicensepweapon()	 
	for i=1, #Licenses, 1 do
	ownedLicenses[Licenses[i].type] = true
	end
	Wait(500)
	if tw then
		if not pw then
			TriggerServerEvent('rWeaponSchool:zonerequest', source)
		end
	end
	else  
		local player = PlayerId()
		SetPlayerInvincible(player, false)
	inout = false
	Wait(100)
	if tw then
		if not pw then
        	local unarmed = `WEAPON_UNARMED`
        	local player = PlayerId()
			local plyPed = GetPlayerPed(player)
			TriggerServerEvent('rWeaponSchool:removeweapon', source)
			Wait(100)
        	SetCurrentPedWeapon(plyPed, unarmed, true)
			Wait(100)
        	SetCurrentPedWeapon(plyPed, unarmed, true)
		end
	end
	end
	end)
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if inout then
			local player = PlayerId()
            SetPlayerInvincible(player, true)
    	    exports.ox_inventory:closeInventory()
        end
    end
end)