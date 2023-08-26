local lastPlayerSuccess = {}

if Config.MaxInService ~= -1 then
    TriggerEvent('esx_service:activateService', 'taxi', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'taxi', TranslateCap('taxi_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'taxi', 'Taxi', 'society_taxi', 'society_taxi', 'society_taxi', {
    type = 'public'
})

RegisterNetEvent('esx_taxijob:success')
AddEventHandler('esx_taxijob:success', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local timeNow = os.clock()

    if xPlayer.job.name == 'taxi' then
        if not lastPlayerSuccess[source] or timeNow - lastPlayerSuccess[source] > 5 then
            lastPlayerSuccess[source] = timeNow

            math.randomseed(os.time())
            local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max)

            if xPlayer.job.grade >= 3 then
                total = total * 2
            end

            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
                if account then
                    local playerMoney = ESX.Math.Round(total / 100 * 30)
                    local societyMoney = ESX.Math.Round(total / 100 * 70)

                    xPlayer.addMoney(playerMoney, "Taxi Fair")
                    account.addMoney(societyMoney)

                    xPlayer.showNotification(TranslateCap('comp_earned', societyMoney, playerMoney))
                else
                    xPlayer.addMoney(total, "Taxi Fair")
                    xPlayer.showNotification(TranslateCap('have_earned', total))
                end
            end)
        end
    else
        print(('[^3WARNING^7] Player ^5%s^7 attempted to ^5esx_taxijob:success^7 (cheating)'):format(source))
    end
end)