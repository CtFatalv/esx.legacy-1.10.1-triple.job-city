-- bouton x annuler une animation
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0, 73) then
			ClearPedTasks(GetPlayerPed(-1))
		end
	end
end)