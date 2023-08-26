local ragdoll = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(2, 246) then
			if ragdoll then
				ragdoll = false
				Wait(500)
			elseif not ragdoll then
				ragdoll = true
				Wait(500)
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ragdoll then
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		end
	end
end)