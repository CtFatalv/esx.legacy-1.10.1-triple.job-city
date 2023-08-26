Config = {
    armesItems = true,
    WipeTable = function(identifier)
        MySQL.Sync.execute("DELETE FROM users WHERE identifier='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM billing WHERE identifier='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM open_car WHERE identifier='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM user_vetement WHERE identifier='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM addon_inventory_items WHERE owner='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM addon_account_data WHERE owner='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM owned_properties WHERE owner='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM owned_vehicles WHERE owner='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM users_licenses WHERE owner='" .. identifier .. "'")
        MySQL.Sync.execute("DELETE FROM datastore_data WHERE owner='" .. identifier .. "'")
    end,
}