local resourceName = 'es_extended'

if not GetResourceState(resourceName):find('start') then return end

SetTimeout(0, function()
    local ESX = exports[resourceName]:getSharedObject()

    GetPlayer = ESX.GetPlayerFromId

    if not ESX.GetConfig().OxInventory then
        function RemoveItem(playerId, item)
            local player = GetPlayer(playerId)

            if player then player.removeInventoryItem(item, 1) end
        end

        function DoesPlayerHaveItem(player, items)
            for i = 1, #items do
                local item = items[i]
                local data = player.getInventoryItem(item.name)

                if data?.count > 0 then
                    if item.remove then
                        player.removeInventoryItem(item.name, 1)
                    end

                    return item.name
                end
            end

            return false
        end
    end
end)

function GetCharacterId(player)
    return player.identifier
end

function IsPlayerInGroup(player, filter)
    local type = type(filter)

    if type == 'string' then
        if player.job.name == filter then
            return player.job.name, player.job.grade
        end
        if player.job2.name == filter then
            return player.job2.name, player.job2.grade
        end
        if player.job3.name == filter then
            return player.job3.name, player.job3.grade
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            local grade = filter[player.job.name]
            local grade2 = filter[player.job2.name]
            local grade3 = filter[player.job3.name]

            if grade and grade <= player.job.grade then
                return player.job.name, player.job.grade
            end

            if grade2 and grade2 <= player.job2.grade then
                return player.job2.name, player.job2.grade
            end

            if grade3 and grade3 <= player.job3.grade then
                return player.job3.name, player.job3.grade
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                if player.job.name == filter[i] then
                    return player.job.name, player.job.grade
                end
                if player.job2.name == filter[i] then
                    return player.job2.name, player.job2.grade
                end
                if player.job3.name == filter[i] then
                    return player.job3.name, player.job3.grade
                end
            end
        end
    end
end

