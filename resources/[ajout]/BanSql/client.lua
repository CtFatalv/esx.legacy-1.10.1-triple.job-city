ESX = exports["es_extended"]:getSharedObject()

local spawnSecond = false

RegisterNetEvent('BanSql:Respond')
AddEventHandler('BanSql:Respond', function()
	TriggerServerEvent("BanSql:CheckMe")
end)

RegisterNetEvent('GetName:Bansql')
AddEventHandler('GetName:Bansql', function(joueur)
	GetPlayerName()
end)
--Event Demo

--TriggerServerEvent("BanSql:ICheat")
--TriggerServerEvent("BanSql:ICheat", "Auto-Cheat Custom Reason")

