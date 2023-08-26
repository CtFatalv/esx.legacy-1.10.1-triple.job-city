local npc = 
{
    { x = 22.90, y = -1105.45, z = 28.80, h = 160.0 },
    { x = -661.99, y = -933.49, z = 20.83, h = 180.55 },
    { x = 809.79, y = -2159.07, z = 28.62, h = 6.50 },
    { x = 1692.34, y = 3761.13, z = 33.71, h = 225.81 },
    { x = -331.49, y = 6085.28, z = 30.45, h = 229.77 },
    { x = 253.69, y = -50.80, z = 68.94, h = 67.15 },
    { x = 2567.60, y = 292.52, z = 107.73, h = 0.49 },
    { x = -1118.80, y = 2700.03, z = 17.55, h = 223.41 },
    { x = 842.14, y = -1035.44, z = 27.19, h = 358.21 },
}

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_josef")
	local npc = npc
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
	for index, value in pairs(npc) do
        local npc = CreatePed(5, hash, value.x, value.y, value.z, value.h, true, false)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
	end
end)

   