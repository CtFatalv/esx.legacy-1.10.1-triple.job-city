-- Boite si faible / resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5' // ok
local hurt = false
Citizen.CreateThread(function()
    while true do
        Wait(500)
        if GetEntityHealth(GetPlayerPed(-1)) <= 150 then
            setHurt()
        elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 150 then
            setNotHurt()
        end
    end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
end

function setNotHurt()
    hurt = false
    ResetPedMovementClipset(GetPlayerPed(-1))
    ResetPedWeaponMovementClipset(GetPlayerPed(-1))
    ResetPedStrafeClipset(GetPlayerPed(-1))
end