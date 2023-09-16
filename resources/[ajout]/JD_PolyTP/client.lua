Citizen.CreateThread(function()
    for k,v in pairs(Config.TPZones) do
		if Config.targetType == 'ox_target' then
			exports.qtarget:AddBoxZone("TeleportZone"..k, v.pos.xyz, 1, 2, {
				name="TeleportZone"..k,
				heading= v.pos.w,
				debugPoly=false,
				minZ= v.pos.z -1,
				maxZ= v.pos.z +1,
				}, {
					options = {
						{
							event = "JD_PolyTP:TPLocation",
							icon = v.icon,
							label = "".." "..Config.TPZones[v.destination].label.."",
							tp = v.destination,
							destLabel = Config.TPZones[v.destination].label,
							weatherSync = v.ShellWeatherSync,
							headingToTurnTo = v.pos.w
						},
					},
				distance = 3.5
			})
		end
	end
end)

enterFunction = function(targetName,optionName,vars,entityHit)
    if optionName == "enter" then
		local sync = vars.weatherSync
		local pos = Config.TPZones[vars.tp].pos
		local entity = PlayerPedId()
		SetPedDesiredHeading(GetPlayerPed(-1), vars.headingToTurnTo)
		Citizen.Wait(1000)
		FreezeEntityPosition(entity, true)
		exports.rprogress:Start("Waiting On Access", '3000')
		SetEntityVisible(entity, false)
		SetEntityCoords(entity, pos.xyz)
		SetEntityHeading(entity, pos.w -180.0)
		SetGameplayCamRelativeHeading(pos.w -180.0)
		DoScreenFadeOut()
		exports.rprogress:Start("Going To".." "..vars.destLabel.." Please Wait..", '5000')
		FreezeEntityPosition(entity, false)
		SetEntityVisible(entity, true)
		Citizen.Wait(1000)
		DoScreenFadeIn()
		print(sync)
		print('Sync Toggled To '..string.upper(tostring(sync)).. '')
		if Config.WeatherSync == 'vsync' then 
			TriggerEvent("vSync:toggle", not sync)
			if sync == true then
				NetworkOverrideClockTime(11, 1, 1)
				SetRainLevel(0.0)
			end
		elseif Config.WeatherSync == 'easytime' then
			TriggerEvent("cd_easytime:PauseSync", sync)
			if sync == true then
				SetRainLevel(0.0)
			end
		end
    end
end

RegisterNetEvent('JD_PolyTP:TPLocation')
AddEventHandler('JD_PolyTP:TPLocation', function(data)
	local sync = data.weatherSync
	local pos = Config.TPZones[data.tp].pos
	local entity = PlayerPedId()
	SetPedDesiredHeading(GetPlayerPed(-1), data.headingToTurnTo)
	Citizen.Wait(1000)
	FreezeEntityPosition(entity, true)
	--exports.rprogress:Start("Waiting On Access", '3000')
	SetEntityVisible(entity, false)
	SetEntityCoords(entity, pos.xyz)
	SetEntityHeading(entity, pos.w -180.0)
	SetGameplayCamRelativeHeading(pos.w -180.0)
	DoScreenFadeOut()
	--exports.rprogress:Start("Going To".." "..data.destLabel.." Please Wait..", '5000')
	FreezeEntityPosition(entity, false)
	SetEntityVisible(entity, true)
	Citizen.Wait(1000)
	DoScreenFadeIn()
	print(sync)
	print('Sync Toggled To '..string.upper(tostring(sync)).. '')
	if Config.WeatherSync == 'vsync' then 
		TriggerEvent("vSync:toggle", not sync)
		if sync == true then
			NetworkOverrideClockTime(11, 1, 1)
			SetRainLevel(0.0)
		end
	elseif Config.WeatherSync == 'easytime' then
		TriggerEvent("cd_easytime:PauseSync", sync)
		if sync == true then
			SetRainLevel(0.0)
		end
	end
end)