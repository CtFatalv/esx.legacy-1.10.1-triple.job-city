-- Target PNJ Achat
    Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_business_01")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local npc = CreatePed(4, hash, -254.73, -943.24, 30.22, 250.34, false, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityInvincible(npc, true)
    SetPedFleeAttributes(npc, 0, 0)
    FreezeEntityPosition(npc, true)
    TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 0, true)

    local options = {
        {
            name = 'test',
            event = 'identite:identite',
            icon = 'fa-solid fa-road',
            label = 'Refaire une pièce d\'identification',
            distance = 1.6,
        },
    }label = 'test',
    exports.ox_target:addLocalEntity(npc, options)
    end)

    local identityMenu = {
        id = 'identity_menu',
        title = 'Select identity',
        options = {},
      }
      
      for i = 1, #Config.MenuCards, 1 do
        identityMenu.options[#identityMenu.options + 1] = {
            title = Config.MenuCards[i].title,
            icon = Config.MenuCards[i].icon,
            serverEvent = 'um-idcard-npc:server:AddItemtoExport',
            args = Config.MenuCards[i].args,
            disabled = false,
            onSelect = function()
                identityMenu.options[i].disabled = true
                lib.registerContext({identityMenu})
            end,
        }
      end

      lib.registerContext({identityMenu})
    
    AddEventHandler('identite:identite',function()
        lib.showContext("identity_menu")
    end)