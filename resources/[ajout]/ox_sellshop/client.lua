ESX = exports["es_extended"]:getSharedObject()
--==============================================================================
-- NPC Légal
--==============================================================================
local NpcLegalPositions = Config.npc
for index, value in pairs(NpcLegalPositions) do

Citizen.CreateThread(function()
local hash = GetHashKey("a_m_m_ktown_01")
RequestModel(hash)
while not HasModelLoaded(hash) do
    Wait(1)
end

local npc = CreatePed(4, hash,  value.x, value.y, value.z, value.h, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
            
    for i=1, #Config.SellShops do  
    local options = {
        {
            event = 'ws_sellshop:interact',
            icon = 'fas fa-pepper-hot',
            label = 'Nourritures',
            distance = 1.6,
            store = Config.SellShops[i]
            
        },
        {
            event = 'ws_sellshop:interact2',
            icon = 'fas fa-gem',
            label = 'Minages',
            distance = 1.6,
            store = Config.SellShops[i]
        },
        {
            event = 'ws_sellshop:interact3',
            icon = 'fas fa-cubes',
            label = 'Divers',
            distance = 1.6,
            store = Config.SellShops[i]
        },
    }
    exports.ox_target:addLocalEntity(npc, options)
    end
            	--Blips
    local blip = AddBlipForEntity(npc)
    SetBlipSprite(blip, 478)
    SetBlipColour(blip, 2)
	SetBlipDisplay(blip, 3)
    SetBlipScale(blip, 0.7)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Vente d\'objet')
    EndTextCommandSetBlipName(blip)
end)
end
--==============================================================================
-- NPC Illégal
--==============================================================================
local NpcIllegalPositions = Config.npc2
for index, value in pairs(NpcIllegalPositions) do

Citizen.CreateThread(function()
local hash = GetHashKey("a_m_m_ktown_01")
RequestModel(hash)
while not HasModelLoaded(hash) do
    Wait(1)
end

local npc2 = CreatePed(4, hash,  value.x, value.y, value.z, value.h, false, true)
FreezeEntityPosition(npc2, true)
SetEntityInvincible(npc2, true)
SetBlockingOfNonTemporaryEvents(npc2, true)
            
    for i=1, #Config.SellShopsillegal do  
    local options = {
        {
            event = 'ws_sellshop:interacti',
            icon = 'fas fa-capsules',
            label = 'Drogues',
            distance = 1.6,
            store = Config.SellShopsillegal[i]
            
        },
        {
            event = 'ws_sellshop:interacti2',
            icon = 'fas fa-city',
            label = 'Braquages',
            distance = 1.6,
            store = Config.SellShopsillegal[i]
        },
        {
            event = 'ws_sellshop:interacti3',
            icon = 'far fa-gem',
            label = 'Meteaux',
            distance = 1.6,
            store = Config.SellShopsillegal[i]
        },
    }
    exports.ox_target:addLocalEntity(npc2, options)
    end
end)
end
--==============================================================================
-- Fonction légal de detection de catégorie du menu
--==============================================================================
AddEventHandler('ws_sellshop:interact', function(data)
    local storeData = data.store
    local items = storeData.items
    local Options = {}
    for i=1, #items do
        table.insert(Options, {
            title = items[i].label,
            description = 'Prix de vente: $'..items[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items[i].item, price = items[i].price, currency = items[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)

AddEventHandler('ws_sellshop:interact2', function(data)
    local storeData = data.store
    local items2 = storeData.items2
    local Options = {}
    for i=1, #items2 do
        table.insert(Options, {
            title = items2[i].label,
            description = 'Prix de vente: $'..items2[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items2[i].item, price = items2[i].price, currency = items2[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)

AddEventHandler('ws_sellshop:interact3', function(data)
    local storeData = data.store
    local items3 = storeData.items3
    local Options = {}
    for i=1, #items3 do
        table.insert(Options, {
            title = items3[i].label,
            description = 'Prix de vente: $'..items3[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items3[i].item, price = items3[i].price, currency = items3[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)
--==============================================================================
-- Fonction Illégal de detection de catégorie du menu
--==============================================================================
AddEventHandler('ws_sellshop:interacti', function(data)
    local storeData = data.store
    local items = storeData.items
    local Options = {}
    for i=1, #items do
        table.insert(Options, {
            title = items[i].label,
            description = 'Prix de vente: $'..items[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items[i].item, price = items[i].price, currency = items[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)

AddEventHandler('ws_sellshop:interacti2', function(data)
    local storeData = data.store
    local items2 = storeData.items2
    local Options = {}
    for i=1, #items2 do
        table.insert(Options, {
            title = items2[i].label,
            description = 'Prix de vente: $'..items2[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items2[i].item, price = items2[i].price, currency = items2[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)

AddEventHandler('ws_sellshop:interacti3', function(data)
    local storeData = data.store
    local items3 = storeData.items3
    local Options = {}
    for i=1, #items3 do
        table.insert(Options, {
            title = items3[i].label,
            description = 'Prix de vente: $'..items3[i].price,
            event = 'ws_sellshop:sellItem',
            args = { item = items3[i].item, price = items3[i].price, currency = items3[i].currency }
        })
    end
    lib.registerContext({
        id = 'storeInteract',
        title = 'Vendre des objets',
        options = Options
    })
    lib.showContext('storeInteract')
end)
--==============================================================================
-- Fonction de vente
--==============================================================================
addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
	:gsub(",(%-?)$","%1"):reverse()
end

AddEventHandler('ws_sellshop:sellItem', function(data)
    local data = data
    local input = lib.inputDialog('Combien souhaitez-vous vendre?', {'Quantités'})
    if input then
        data.quantity = math.floor(tonumber(input[1]))
        if data.quantity < 1 then
            lib.notify({
                title = 'Error',
                description = 'Veuillez entrer un montant valide!',
                type = 'error'
            })
        else
            local done = lib.callback.await('ws_sellshop:sellItem', 100, data)
            if not done then
                lib.notify({
                    title = 'Error',
                    description = 'Il vous manque des articles demandés sur cette vente!',
                    type = 'error'
                })
            else
                lib.notify({
                    title = 'Success',
                    description = 'Vous avez vendu vos objets pour $'..addCommas(done),
                    type = 'success'
                })
            end
        end
    else
        lib.notify({
            title = 'Error',
            description = 'Veuillez entrer un montant valide!',
            type = 'error'
        })
    end
end)
--==============================================================================