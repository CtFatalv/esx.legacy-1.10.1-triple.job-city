local Debug = ESX.GetConfig().EnableDebug

local function Notify(notificatonType, length, message)

    if Debug then
        print("1 ".. tostring(notificatonType))
        print("2 "..tostring(length))
        print("3 "..message)
    end

    if type(notificatonType) ~= "string" then
        notificatonType = "info"
    end

    if type(length) ~= "number" then
        length = 3000
    end

    if Debug then
        print("4 ".. tostring(notificatonType))
        print("5 "..tostring(length))
        print("6 "..message)
    end

    SendNuiMessage(json.encode({
        type = notificatonType or "info",
        length = length or 3000,
        message = message or "ESX-Notify"
    }))
end


exports('Notify', Notify)
RegisterNetEvent("ESX:Notify", Notify)

if Debug then
    RegisterCommand("oldnotify", function()
        ESX.ShowNotification('No Waypoint Set.', true, false, 140)
    end)

    RegisterCommand("notify", function()
        ESX.ShowNotification("You Recived ~br~ 1x ball~s~!", "success", 3000)
    end)

    RegisterCommand("notify1", function()
        ESX.ShowNotification("Well ~g~Done~s~!", "success", 3000)
    end)

    RegisterCommand("notify2", function()
        ESX.ShowNotification("Information Recived", "info", 3000)
    end)

    RegisterCommand("notify3", function()
        ESX.ShowNotification("You Did something ~r~WRONG~s~!", "error", 3000)
    end)
end