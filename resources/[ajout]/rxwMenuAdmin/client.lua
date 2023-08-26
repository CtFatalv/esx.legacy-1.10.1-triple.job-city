local ESX = nil
local IdSelected = nil
local modeAdmin = false
local showCoords = false
local showName = false
local godMode = false
local freezeP = false
local noClipMod = false
local staffMode = false
local isNoClip = false
local annonceState = false
local cooldown = false
local modeDelgun = false
local delgun = false
local NoClipSpeedMax = 2
local normalSpeed = 0.5
local gamerTags = {}
local ServersIdSession = {}
local playerResult = {}
local allReportClient = {}
local carGestion = {
    DoorIndex = 1,
    DoorList = {"Avant Gauche", "Avant Droite", "Arrière Gauche", "Arrière Droite"},
    DoorState = {
        FrontLeft = false,
        FrontRight = false,
        BackLeft = false,
        BackRight = false,
        Hood = false,
        Trunk = false
    }
}
AdminMenuTable = {
    showcoords = false,
    showNameee = false
}

Citizen.CreateThread(function()
	ESX = exports["es_extended"]:getSharedObject()
	while ESX == nil do Citizen.Wait(100) end

    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)

local function rxwMenuAdminKeyboard(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

function DrawAdvancedTextCNN(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

RegisterNetEvent("rxwMenuAdmin:killPlayerClient")
AddEventHandler("rxwMenuAdmin:killPlayerClient",function()
    SetEntityHealth(PlayerPedId(), 0)
    ESX.ShowNotification("~r~Vous avez été tuer !")
end)

RegisterNetEvent("rxwMenuAdmin:freezePlayerClient")
AddEventHandler("rxwMenuAdmin:freezePlayerClient", function(bool)
	FreezeEntityPosition(PlayerPedId(), bool)
end)

RegisterNetEvent("rxwMenuAdmin:setCoordsPlayer")
AddEventHandler("rxwMenuAdmin:setCoordsPlayer", function(coords)
    SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
end)

RegisterNetEvent('rxwMenuAdmin:annonceServerClient')
AddEventHandler('rxwMenuAdmin:annonceServerClient', function(text, bool)
    texteAnnonce = text
	annonceState = bool
    if bool then
        PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 1)
    end
end)

TriggerEvent('chat:addSuggestion', '/report', 'Faire un appel staff', {
    { name="Raison", help="Merci de détailler votre demande" },
})


function menuAdmin()
    local menuP = RageUI.CreateMenu('Admin Menu', '~b~rDev')
    local menuS = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')
    local menuGS = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')
    local menuJ = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')
    local menuJO = RageUI.CreateSubMenu(menuJ, 'Admin Menu', '~b~rDev')
    local menuJOI = RageUI.CreateSubMenu(menuJO, 'Admin Menu', '~b~rDev')
    local menuVoi = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')
    local menuRep = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')
    local menuRep2 = RageUI.CreateSubMenu(menuRep, 'Admin Menu', '~b~rDev')
    local menuDel = RageUI.CreateSubMenu(menuP, 'Admin Menu', '~b~rDev')

            RageUI.Visible(menuP, not RageUI.Visible(menuP))
            while menuP do
            Citizen.Wait(0)
            RageUI.IsVisible(menuP, true, true, true, function()

                RageUI.Checkbox("Activer/Désactiver le Staff Mode",nil, modeAdmin,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        modeAdmin = Checked
                        if Checked then
                            ESX.ShowNotification("StaffMode ~g~ON")
                            staffMode = true
                        else
                            ESX.ShowNotification("StaffMode ~r~OFF")
                            staffMode = false
                        end
                    end
                end)

                if staffMode then

                RageUI.ButtonWithStyle("Gestion Personel", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                end, menuS)

                RageUI.ButtonWithStyle("Gestion Serveur", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                end, menuGS)

                RageUI.ButtonWithStyle("Gestion Joueurs", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                end, menuJ)

                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    RageUI.ButtonWithStyle("Gestion Voitures", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    end, menuVoi)
                else
                    RageUI.ButtonWithStyle("Gestion Voitures", nil, {RightLabel = "→→→"},false, function(Hovered, Active, Selected)
                    end)
                end

                RageUI.ButtonWithStyle("Gestion Report", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.TriggerServerCallback('rxwMenuAdmin:getAllReport', function(result)
                            allReportClient = result
                        end)
                    end
                end, menuRep)

                RageUI.ButtonWithStyle("Gestion DelGun", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                end, menuDel)
            
                end
                
            
            end, function()
            end)

            RageUI.IsVisible(menuS, true, true, true, function()

                RageUI.Separator("~b~Mon niveau de heal : "..GetEntityHealth(PlayerPedId()))

                RageUI.ButtonWithStyle("TP marker", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local plyPed = PlayerPedId()
                        local waypointHandle = GetFirstBlipInfoId(8)
                        if DoesBlipExist(waypointHandle) then
                            CreateThread(function()
                                local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                                local foundGround, zCoords, zPos = false, -500.0, 0.0
                                while not foundGround do
                                    zCoords = zCoords + 10.0
                                    RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                    Wait(0)
                                    foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                    if not foundGround and zCoords >= 2000.0 then
                                        foundGround = true
                                    end
                                end
                                SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
                                ESX.ShowNotification("Téléporté sur le marqueur !")
                            end)
                        else
                            ESX.ShowNotification("Pas de marqueur sur la carte !")
                        end
                    end
                end)

                RageUI.Checkbox("Afficher les coordonnées",nil, showCoords,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        showCoords = Checked
                        if Checked then
                            AdminMenuTable.showcoords = true
                        else
                            AdminMenuTable.showcoords = false
                        end
                    end
                end)

                RageUI.Checkbox("Afficher id + nom",nil, showName,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        showName = Checked
                        if Checked then
                            AdminMenuTable.showNameee = true
                        else
                            AdminMenuTable.showNameee = false
                        end
                    end
                end)

                RageUI.Checkbox("NoClip",nil, noClipMod,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        noClipMod = Checked
                        if Checked then
                            ToggleNoClipMode()
                            isNoClip = true
                            ESX.ShowNotification("NoClip ~g~ON")
                        else
                            ToggleNoClipMode()
                            isNoClip = false
                            ESX.ShowNotification("NoClip ~r~OFF")
                        end
                    end
                end)


                RageUI.Checkbox("Invincible",nil, godMode,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        godMode = Checked
                        if Checked then
                            SetEntityInvincible(PlayerPedId(), true)
                            SetPlayerInvincibleKeepRagdollEnabled(PlayerPedId(), true)
                            ESX.ShowNotification("Invincible ~g~ON")
                        else
                            SetEntityInvincible(PlayerPedId(), false)
                            SetPlayerInvincibleKeepRagdollEnabled(PlayerPedId(), false)
                            ESX.ShowNotification("Invincible ~r~OFF")
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Soin/Nourriture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Soin en cours....")
                        TriggerServerEvent("rxwMenuAdmin:heal", GetPlayerServerId(PlayerId()))
                    end
                end)

                RageUI.ButtonWithStyle("Réanimer", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Réanimation en cours....")
                        TriggerServerEvent("rxwMenuAdmin:revive", GetPlayerServerId(PlayerId()))
                    end
                end)


                RageUI.Separator("~b~Give")

                RageUI.ButtonWithStyle("Item", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local itemName = rxwMenuAdminKeyboard("Nom de l'item ?", "", 20)
                        local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                        TriggerServerEvent("rxwMenuAdmin:giveInventory", "item", itemName, tonumber(amountGive), GetPlayerServerId(PlayerId()))
                    end
                end)

            if not Config.armesItems then
                RageUI.ButtonWithStyle("Armes", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local itemName = rxwMenuAdminKeyboard("Nom de l'arme ?", "", 20)
                        local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                        TriggerServerEvent("rxwMenuAdmin:giveInventory", "weapon", itemName, tonumber(amountGive), GetPlayerServerId(PlayerId()))
                    end
                end)
            end

            RageUI.ButtonWithStyle("Argent propre", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "cash", tonumber(amountGive), GetPlayerServerId(PlayerId()))
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Argent banque", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "bank", tonumber(amountGive), GetPlayerServerId(PlayerId()))
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Argent sale", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "sale", tonumber(amountGive), GetPlayerServerId(PlayerId()))
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)


            end, function()
            end)

            RageUI.IsVisible(menuJ, true, true, true, function()

                RageUI.Separator("~y~Voici les joueurs connectés")

                for k,v in ipairs(ServersIdSession) do
                    if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then table.remove(ServersIdSession, k) end
                    RageUI.ButtonWithStyle(v.." : " ..GetPlayerName(GetPlayerFromServerId(v)), nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                        if Selected then
                            IdSelected = v
                            ESX.TriggerServerCallback('rxwMenuAdmin:getPlayerInfos', function(result)
                                playerResult = result
                            end, IdSelected)
                        end
                    end, menuJO)
                end
                
            end, function()
            end)

            RageUI.IsVisible(menuJO, true, true, true, function()

                RageUI.Separator("→→ ID du joueur : ~g~"..IdSelected)
                RageUI.Separator("→→ Nom du joueur : ~g~"..GetPlayerName(GetPlayerFromServerId(IdSelected)))

                RageUI.ButtonWithStyle("Se téléporter à lui", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("rxwMenuAdmin:gotoPlayer", IdSelected)
                    end
                end)

                RageUI.ButtonWithStyle("Le téléporter sur moi", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("rxwMenuAdmin:bringPlayer", IdSelected)
                    end
                end)

                RageUI.ButtonWithStyle("Envoyer un message", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local msg = rxwMenuAdminKeyboard("Message ?", "", 20)
                        if msg then
                            TriggerServerEvent("rxwMenuAdmin:sendMsg", IdSelected, msg)
                        else
                            ESX.ShowNotification("Votre message ne peut pas être vide !")
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Soin/Nourriture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Soin en cours ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
                        TriggerServerEvent("rxwMenuAdmin:heal", IdSelected)
                    end
                end)

                RageUI.ButtonWithStyle("Revive", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Revive en cours ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
                        TriggerServerEvent("rxwMenuAdmin:revive", IdSelected)
                    end
                end)

                RageUI.Separator("~b~Give")

                RageUI.ButtonWithStyle("Item", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local itemName = rxwMenuAdminKeyboard("Nom de l'item ?", "", 20)
                        local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                        TriggerServerEvent("rxwMenuAdmin:giveInventory", "item", itemName, tonumber(amountGive), IdSelected)
                    end
                end)

            if not Config.armesItems then
                RageUI.ButtonWithStyle("Armes", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local itemName = rxwMenuAdminKeyboard("Nom de l'arme ?", "", 20)
                        local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                        TriggerServerEvent("rxwMenuAdmin:giveInventory", "weapon", itemName, tonumber(amountGive), IdSelected)
                    end
                end)
            end

            RageUI.ButtonWithStyle("Argent propre", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "cash", tonumber(amountGive), IdSelected)
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Argent banque", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "bank", tonumber(amountGive), IdSelected)
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("Argent sale", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local amountGive = rxwMenuAdminKeyboard("Combien ?", "", 20)
                    if tonumber(amountGive) then
                        TriggerServerEvent("rxwMenuAdmin:giveMoney", "sale", tonumber(amountGive), IdSelected)
                    else
                        ESX.ShowNotification("Montant invalide !")
                    end
                end
            end)

            RageUI.Separator("~b~Autre(s)")

            RageUI.ButtonWithStyle("Informations", nil, {RightLabel = "→→→"},true, function(Hovered, Active, Selected)
                if Selected then
                    ESX.TriggerServerCallback('rxwMenuAdmin:getPlayerInfos', function(result)
                        playerResult = result
                    end, IdSelected)
                end
            end, menuJOI)

            RageUI.ButtonWithStyle("setJob", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local jobName = rxwMenuAdminKeyboard("Nom du job ?", "", 20)
                    local gradeJob = rxwMenuAdminKeyboard("Grade ?", "", 20)
                    if jobName and tonumber(gradeJob) then
                        TriggerServerEvent("rxwMenuAdmin:setJobPlayer", IdSelected, jobName, gradeJob)
                    else
                        ESX.ShowNotification("Erreur !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("setJob2", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local jobName = rxwMenuAdminKeyboard("Nom du job ?", "", 20)
                    local gradeJob = rxwMenuAdminKeyboard("Grade ?", "", 20)
                    if jobName and tonumber(gradeJob) then
                        TriggerServerEvent("rxwMenuAdmin:setJob2Player", IdSelected, jobName, gradeJob)
                    else
                        ESX.ShowNotification("Erreur !")
                    end
                end
            end)


            RageUI.Separator("~b~Sanction(s)")

            RageUI.Checkbox("Freeze / Unfreeze",nil, freezeP,{},function(Hovered,Ative,Selected,Checked)
                if Selected then
                    freezeP = Checked
                    if Checked then
                        TriggerServerEvent("rxwMenuAdmin:freezePlayer", IdSelected, true)
                    else
                        TriggerServerEvent("rxwMenuAdmin:freezePlayer", IdSelected, false)
                    end
                end
            end)

            RageUI.ButtonWithStyle("Kick", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local raison = rxwMenuAdminKeyboard("Raison du kick ?", "", 20)
                    if raison then
                        TriggerServerEvent("rxwMenuAdmin:kickPlayer", IdSelected, raison)
                    else
                        ESX.ShowNotification("La raison ne peut pas être vide !")
                    end
                end
            end)

            RageUI.ButtonWithStyle("tuer", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("rxwMenuAdmin:killPlayer", IdSelected)
                end
            end)
--[[
            RageUI.ButtonWithStyle("Wipe", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    TriggerServerEvent("rxwMenuAdmin:wipePlayer", IdSelected)
                end
            end)
]]
            RageUI.ButtonWithStyle("Avertissement", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                if Selected then
                    local raison = rxwMenuAdminKeyboard("Raison de l'Avertissement ?", "", 20)
                    if raison then
                        TriggerServerEvent("rxwMenuAdmin:warnPlayer", IdSelected, raison)
                    else
                        ESX.ShowNotification("La raison ne peut pas être vide !")
                    end
                end
            end)

            end, function()
            end)

            RageUI.IsVisible(menuJOI, true, true, true, function()


                RageUI.Separator("→→ Nom du joueur : ~g~"..playerResult.namePlayer)

                RageUI.Separator("→→ Emploi : ~g~"..playerResult.job1)

                RageUI.Separator("→→ Gang : ~g~"..playerResult.job2)

                RageUI.Separator("→→ Argent propre : ~g~"..playerResult.moneyAmount)

                RageUI.Separator("→→ Argent banque : ~g~"..playerResult.bankAmount)

                RageUI.Separator("→→ Argent sale : ~g~"..playerResult.saleAmount)

                RageUI.Separator("~y~Inventaire")

                for k,v in pairs(playerResult.inventory) do
                    if v.count > 0 then
                        RageUI.ButtonWithStyle("→→ "..v.label, nil, {RightLabel = "x"..v.count},true, function(Hovered, Active, Selected)
                        end)
                    end
                end
                

            end, function()
            end)

            RageUI.IsVisible(menuGS, true, true, true, function()
            
                RageUI.ButtonWithStyle("Annonce", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        local msg = rxwMenuAdminKeyboard("Message de l'annonce ?", "", 30)
                        if msg then
                            TriggerServerEvent("rxwMenuAdmin:annonceServer", msg)
                        else
                            ESX.ShowNotification("L'annonce ne peut pas être vide !")
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Activer/Desactiver les PNJ", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        if deleteAllPeds then
                            deleteAllPeds = false
                            ESX.ShowNotification("~g~Vous avez remis tout les peds !")
                        else
                            deleteAllPeds = true
                            ESX.ShowNotification("~r~Vous avez retirer tout les peds !")
                        end
                    end
                end)

                RageUI.Separator("~o~Gestion Météo")

                RageUI.ButtonWithStyle("Soleil", "Rend le ciel ensoleillé", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather extrasunny')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Les prévision annonce un temps ~y~Ensoleillé")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)

                RageUI.ButtonWithStyle("Nuageux", "Rend le ciel nuageux", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather overcast')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Les prévision annonce un temps ~c~Nuageux")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)

                RageUI.ButtonWithStyle("Pluie", "Rend le ciel pluvieux", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather rain')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Les prévision annonce de la ~b~Pluie")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)

                RageUI.ButtonWithStyle("Orage", "Rend le ciel orageux", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather thunder')
                        TriggerServerEvent("orage", "Les prévision annonce une tempête ~r~d'orage")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                
                RageUI.ButtonWithStyle("Neige", "Rend le ciel en tempête de neige", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather blizzard')
                        TriggerServerEvent("orage", "Les prévision annonce une tempête de ~r~ Neige")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                
               	RageUI.ButtonWithStyle("Halloween", "Mettre Halloween", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather halloween 0 0')
                        ExecuteCommand('time 00 00 00 3000 0')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Mettre Halloween")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
				RageUI.ButtonWithStyle("Freeze le temps en soleil", "Bloquer le temps sur soleil", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather extrasunny 0 1')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Bloquer le temps sur ~r~soleil")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                
                RageUI.ButtonWithStyle("Defreeze le temps", "Defreeze le temps", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weather extrasunny 0 0')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Defreeze le temps")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)

                RageUI.Separator("~o~Gestion de l'Horloge")
                
                
                RageUI.ButtonWithStyle("Midi", "Avancer l'heure à 12h00", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('time 00 12 00 3000 0')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "L'horloge est avancé à ~c~midi")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                RageUI.ButtonWithStyle("Minuit", "Avancer l'heure à 00h00", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('time 00 00 00 3000 0')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "L'horloge est avancé à ~r~minuit")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                RageUI.ButtonWithStyle("Blackout", "Activer/Desactiver le Blackout", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('blackout')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Vous avez mis un ~r~Blackout")
                        cooldown = false
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)
                RageUI.ButtonWithStyle("Desactiver/Activer l'horloge", "Desactiver/Activer l'horloge", { RightLabel = "→→" }, not cooldown, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('weathersync')
                        TriggerServerEvent("rxwMenuAdmin:Soleil", "Desactiver/Activer ~r~l'horloge")
                        cooldown = true
                        Citizen.SetTimeout(10000, function()
                            cooldown = false
                        end)
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(menuVoi, true, true, true, function()

                local Ped = GetPlayerPed(-1)
                local GetSourcevehicle = GetVehiclePedIsIn(Ped, false)
                local Vengine = GetVehicleEngineHealth(GetSourcevehicle)/10
                local Vengine = math.floor(Vengine)
                local VehPed = GetVehiclePedIsIn(PlayerPedId(), false)

                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    RageUI.Separator("Plaque d'immatriculation = ~b~"..GetVehicleNumberPlateText(VehPed).." ")
                else
                    RageUI.GoBack()
                end

                RageUI.Separator("Etat du moteur~s~ =~b~ "..Vengine.."%")
                
                RageUI.ButtonWithStyle("Allumer/Eteindre le Moteur", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        
                            if GetIsVehicleEngineRunning(plyVeh) then
                                SetVehicleEngineOn(plyVeh, false, false, true)
                                SetVehicleUndriveable(plyVeh, true)
                            elseif not GetIsVehicleEngineRunning(plyVeh) then
                                SetVehicleEngineOn(plyVeh, true, false, true)
                                SetVehicleUndriveable(plyVeh, false)
                            end
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)


                RageUI.List("Ouvrir/Fermer Porte", carGestion.DoorList, carGestion.DoorIndex, nil, {}, true, function(Hovered, Active, Selected, Index)
                    if (Selected) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        
                            if Index == 1 then
                                if not carGestion.DoorState.FrontLeft then
                                    carGestion.DoorState.FrontLeft = true
                                    SetVehicleDoorOpen(plyVeh, 0, false, false)
                                elseif carGestion.DoorState.FrontLeft then
                                    carGestion.DoorState.FrontLeft = false
                                    SetVehicleDoorShut(plyVeh, 0, false, false)
                                end
                            elseif Index == 2 then
                                if not carGestion.DoorState.FrontRight then
                                    carGestion.DoorState.FrontRight = true
                                    SetVehicleDoorOpen(plyVeh, 1, false, false)
                                elseif carGestion.DoorState.FrontRight then
                                    carGestion.DoorState.FrontRight = false
                                    SetVehicleDoorShut(plyVeh, 1, false, false)
                                end
                            elseif Index == 3 then
                                if not carGestion.DoorState.BackLeft then
                                    carGestion.DoorState.BackLeft = true
                                    SetVehicleDoorOpen(plyVeh, 2, false, false)
                                elseif carGestion.DoorState.BackLeft then
                                    carGestion.DoorState.BackLeft = false
                                    SetVehicleDoorShut(plyVeh, 2, false, false)
                                end
                            elseif Index == 4 then
                                if not carGestion.DoorState.BackRight then
                                    carGestion.DoorState.BackRight = true
                                    SetVehicleDoorOpen(plyVeh, 3, false, false)
                                elseif carGestion.DoorState.BackRight then
                                    carGestion.DoorState.BackRight = false
                                    SetVehicleDoorShut(plyVeh, 3, false, false)
                                end
                            end
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
        
                    carGestion.DoorIndex = Index
                end)

                RageUI.ButtonWithStyle("Ouvrir/Fermer Capot", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        
                            if not carGestion.DoorState.Hood then
                                carGestion.DoorState.Hood = true
                                SetVehicleDoorOpen(plyVeh, 4, false, false)
                            elseif carGestion.DoorState.Hood then
                                carGestion.DoorState.Hood = false
                                SetVehicleDoorShut(plyVeh, 4, false, false)
                            end
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Ouvrir/Fermer Coffre", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
        
                            if not carGestion.DoorState.Trunk then
                                carGestion.DoorState.Trunk = true
                                SetVehicleDoorOpen(plyVeh, 5, false, false)
                            elseif carGestion.DoorState.Trunk then
                                carGestion.DoorState.Trunk = false
                                SetVehicleDoorShut(plyVeh, 5, false, false)
                            end
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)


                RageUI.Separator("~b~Action(s)")

                RageUI.ButtonWithStyle("Réparer le véhicule", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetVehicleFixed(plyVeh)
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Supprimer le véhicule", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                            DeleteEntity(plyVeh)
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)
--[[
                RageUI.ButtonWithStyle("Custom au maximum", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        if IsPedSittingInAnyVehicle(PlayerPedId()) then
                            FullVehicleBoost()
                        else
                            ESX.ShowNotification("Vous n'êtes pas dans un véhicule")
                        end
                    end
                end)
]]

            end, function()
            end)


            RageUI.IsVisible(menuRep, true, true, true, function()

                if #allReportClient == 0 then
                    RageUI.Separator("")
                    RageUI.Separator("~r~Aucun report ouvert")
                    RageUI.Separator("")
                else
                    for k,infoPlayer in pairs(allReportClient) do
                        RageUI.ButtonWithStyle("[~y~"..infoPlayer.idPlayer.."~s~] →→ "..infoPlayer.namePlayer, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                            if Selected then
                                reportSelected, idReport = infoPlayer, k
                            end
                        end, menuRep2)
                    end
                end

            end, function()
            end)

            RageUI.IsVisible(menuRep2, true, true, true, function()

                RageUI.Separator("→→ ~g~ID du joueur~s~ : "..reportSelected.idPlayer)
                RageUI.Separator("→→ ~y~Nom du joueur~s~ : "..reportSelected.namePlayer)
                RageUI.Separator("→→ ~o~Raison du report~s~ : "..reportSelected.reasonReport)

                RageUI.ButtonWithStyle("Se téléporter à lui", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("rxwMenuAdmin:gotoPlayer", reportSelected.idPlayer)
                    end
                end)

                RageUI.ButtonWithStyle("Le téléporter sur moi", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("rxwMenuAdmin:bringPlayer", reportSelected.idPlayer)
                    end
                end)

                RageUI.ButtonWithStyle("Revive", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Revive en cours ("..GetPlayerName(GetPlayerFromServerId(reportSelected.idPlayer))..")")
                        TriggerServerEvent("rxwMenuAdmin:revive", reportSelected.idPlayer)
                    end
                end)

                RageUI.ButtonWithStyle("Soin/Nourriture", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        ESX.ShowNotification("~g~Soin en cours ("..GetPlayerName(GetPlayerFromServerId(reportSelected.idPlayer))..")")
                        TriggerServerEvent("rxwMenuAdmin:heal", reportSelected.idPlayer)
                    end
                end)


                RageUI.Separator("~g~Actions sur le report")

                RageUI.ButtonWithStyle("Cloturer ce report", nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("rxwMenuAdmin:closeReport", idReport, reportSelected.idPlayer)
                        ESX.TriggerServerCallback('rxwMenuAdmin:getAllReport', function(result)
                            allReportClient = result
                        end)
                        RageUI.GoBack()
                    end
                end)


            end, function()
            end)

            RageUI.IsVisible(menuDel, true, true, true, function()

                RageUI.Checkbox("Activer/Désactiver le Delgun",nil, modeDelgun,{},function(Hovered,Ative,Selected,Checked)

                    if Selected then
                        modeDelgun = Checked
                        if Checked then
                            ESX.ShowNotification("Delgun ~g~ON")
                            delgun = true
                        else
                            ESX.ShowNotification("Delgun ~r~OFF")
                            delgun = false
                        end
                    end
                end)

            end, function()
            end)

            if not RageUI.Visible(menuP) and not RageUI.Visible(menuS) and not RageUI.Visible(menuJ) and not RageUI.Visible(menuJO) and not RageUI.Visible(menuJOI) and not RageUI.Visible(menuGS) and not RageUI.Visible(menuVoi) and not RageUI.Visible(menuRep) and not RageUI.Visible(menuRep2) and not RageUI.Visible(menuDel) then
            menuP = RMenu:DeleteType("menuP", true)
        end
    end
end


Keys.Register("F11", "MenuAdmin", "Ouvrir le menu admin", function()
    ESX.TriggerServerCallback('rxwMenuAdmin:getUsergroup', function(result)
        if result == "admin" then
            menuAdmin()
        end
    end)
end)


---- Coords


local MainColor = {
	r = 225, 
	g = 55, 
	b = 55,
	a = 255
}

Citizen.CreateThread(function()
    while true do
    	if AdminMenuTable.showcoords then
            x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
            roundx=tonumber(string.format("%.2f",x))
            roundy=tonumber(string.format("%.2f",y))
            roundz=tonumber(string.format("%.2f",z))
            DrawTxt("~r~X:~s~ "..roundx,0.05,0.00)
            DrawTxt("     ~r~Y:~s~ "..roundy,0.11,0.00)
            DrawTxt("        ~r~Z:~s~ "..roundz,0.17,0.00)
            DrawTxt("             ~r~Angle:~s~ "..GetEntityHeading(PlayerPedId()),0.21,0.00)
        end
        if invisible then
            SetEntityVisible(GetPlayerPed(-1), 0, 0)
            NetworkSetEntityInvisibleToNetwork(GetPlayerPed(-1), 1)
        else
            SetEntityVisible(GetPlayerPed(-1), 1, 0)
            NetworkSetEntityInvisibleToNetwork(GetPlayerPed(-1), 0)
        end
    	Citizen.Wait(0)
    end
end)

--DrawTxt
function DrawTxt(text,r,z)
    SetTextColour(MainColor.r, MainColor.g, MainColor.b, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(r,z)
end


function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
    local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))
    
    if len ~= 0 then
        coords = coords / len
    end
    
    return coords
end

local eps = 0.01
local speed = 0.5
local input = vector3(0, 0, 0)
local previousVelocity = vector3(0, 0, 0)
local breakSpeed = 10.0;
local offset = vector3(0, 0, 1);
local noClippingEntity = PlayerPedId();
function ToggleNoClipMode()
    return NoClip(not isNoClip)
end
function IsControlAlwaysPressed(inputGroup, control) return IsControlPressed(inputGroup, control) or IsDisabledControlPressed(inputGroup, control) end
function IsControlAlwaysJustPressed(inputGroup, control) return IsControlJustPressed(inputGroup, control) or IsDisabledControlJustPressed(inputGroup, control) end
function Lerp(a, b, t) return a + (b - a) * t end
function IsPedDrivingVehicle(ped, veh)
    return ped == GetPedInVehicleSeat(veh, -1);
end
function SetInvincible(val, id)
    SetEntityInvincible(id, val)
    return SetPlayerInvincible(id, val)
end

function NoClip(bool)
    if (isNoClip == false) then
        
        noClippingEntity = PlayerPedId();
        
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false);
            if IsPedDrivingVehicle(PlayerPedId(), veh) then
                noClippingEntity = veh;
            end
        end
        
        local isVeh = IsEntityAVehicle(noClippingEntity);
        
        isNoClip = bool;
        SetUserRadioControlEnabled(not isNoClip);
        
        if (isNoClip) then
            SetEntityAlpha(noClippingEntity, 51, 0)
            CreateThread(function()
                    
                    local clipped = noClippingEntity
                    local pPed = PlayerPedId();
                    local isClippedVeh = isVeh;
                    
                    SetInvincible(true, clipped);
                    
                    if not isClippedVeh then
                        ClearPedTasksImmediately(pPed)
                    end
                    
                    while isNoClip do
                        Wait(0);
                        
                        FreezeEntityPosition(clipped, true);
                        SetEntityCollision(clipped, false, false);
                        
                        SetEntityVisible(clipped, false, false);
                        SetLocalPlayerVisibleLocally(true);
                        SetEntityAlpha(clipped, 51, false)
                        
                        SetEveryoneIgnorePlayer(pPed, true);
                        SetPoliceIgnorePlayer(pPed, true);
                        
                        input = vector3(GetControlNormal(0, 30), GetControlNormal(0, 31), (IsControlAlwaysPressed(1, 38) and 1) or ((IsControlAlwaysPressed(1, 44) and -1) or 0))
                        speed = ((IsControlAlwaysPressed(1, 21) and NoClipSpeedMax) or normalSpeed) * ((isClippedVeh and 2.75) or 1)
                        
                        SetEntityRotation(noClippingEntity, GetGameplayCamRot(0), 0, false)
                        local forward, right, up, c = GetEntityMatrix(noClippingEntity);
                        previousVelocity = Lerp(previousVelocity, (((right * input.x * speed) + (up * -input.z * speed) + (forward * -input.y * speed))), Timestep() * breakSpeed);
                        c = c + previousVelocity
                        SetEntityCoords(noClippingEntity, c - offset, true, true, true, false)
                    
                    end
                    Wait(0);
                    
                    FreezeEntityPosition(clipped, false);
                    SetEntityCollision(clipped, true, true);
                    
                    SetEntityVisible(clipped, true, false);
                    SetLocalPlayerVisibleLocally(true);
                    ResetEntityAlpha(clipped);
                    
                    SetEveryoneIgnorePlayer(pPed, false);
                    SetPoliceIgnorePlayer(pPed, false);
                    ResetEntityAlpha(clipped);
                    
                    Wait(500);
                    
                    if isClippedVeh then
                        while (not IsVehicleOnAllWheels(clipped)) and not isNoClip do
                            Wait(0);
                        end
                        while not isNoClip do
                            Wait(0);
                            if IsVehicleOnAllWheels(clipped) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    else
                        if (IsPedFalling(clipped) and math.abs(1 - GetEntityHeightAboveGround(clipped)) > eps) then
                            while (IsPedStopped(clipped) or not IsPedFalling(clipped)) and not isNoClip do
                                Wait(0);
                            end
                        end
                        while not isNoClip do
                            Wait(0);
                            if (not IsPedFalling(clipped)) and (not IsPedRagdoll(clipped)) then
                                return SetInvincible(false, clipped);
                            end
                        end
                    end
            end)
        else
            ResetEntityAlpha(noClippingEntity)
        end
    end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(200)

		if AdminMenuTable.showNameee then
			local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
			for _, v in pairs(GetActivePlayers()) do
				local otherPed = GetPlayerPed(v)
			
				if otherPed ~= pPed then
					if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
						gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
						SetMpGamerTagVisibility(gamerTags[v], 4, 1)
					else
						RemoveMpGamerTag(gamerTags[v])
						gamerTags[v] = nil
					end
				end
			end
		else
			for _, v in pairs(GetActivePlayers()) do
				RemoveMpGamerTag(gamerTags[v])
			end
		end
    end
end)

--[[
CreateThread(function()
    while true do
        plyPed = PlayerPedId()
        if IsControlPressed(1, 19) and IsControlJustReleased(1, 38) and IsInputDisabled(2) then
            ESX.TriggerServerCallback('rxwMenuAdmin:getUsergroup', function(plyGroup)
                if plyGroup ~= nil and (plyGroup == 'mod' or plyGroup == 'admin' or plyGroup == 'superadmin' or plyGroup == '_dev') then
                    local waypointHandle = GetFirstBlipInfoId(8)
                    if DoesBlipExist(waypointHandle) then
                        CreateThread(function()
                            local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                            local foundGround, zCoords, zPos = false, -500.0, 0.0

                            while not foundGround do
                                zCoords = zCoords + 10.0
                                RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                Wait(0)
                                foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                if not foundGround and zCoords >= 2000.0 then
                                    foundGround = true
                                end
                            end

                            SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
                            ESX.ShowNotification("Téléporté sur le marqueur !")
                        end)
                    else
                        ESX.ShowNotification("Pas de marqueur sur la carte !")
                    end
                else
                    ESX.ShowNotification("Pas la permission !")
                end
            end)
        end
        Wait(0)
    end
end)
]]
Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)    
		if (annonceState == true) then
			DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
			DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, '~r~ '.."Annonce serveur"..' ~d~', 255, 255, 255, 255, 1, 0)
			DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteAnnonce, 255, 255, 255, 255, 7, 0)
			DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
		end
	end
end)


CreateThread(function()
    while true do
        Wait(0)
        if delgun then
            if IsPlayerFreeAiming(PlayerId()) then
                local entity = getEntity(PlayerId())
                if IsPedShooting(GetPlayerPed(-1)) then
                    SetEntityAsMissionEntity(entity, true, true)
                    DeleteEntity(entity)
                end
            end
        end
    end
end)

function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)
    return entity
end

--[[
function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 12) 
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
		for i = 0,14 do
			SetVehicleExtra(veh, i, 0)
		end
		SetVehicleModKit(veh, 0)
		for i = 0,49 do
			local custom = GetNumVehicleMods(veh, i)
			for j = 1,custom do
				SetVehicleMod(veh, i, math.random(1,j), 1)
			end
		end
	end
end
]]