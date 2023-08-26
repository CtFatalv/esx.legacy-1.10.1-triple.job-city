fx_version 'cerulean'
games { 'gta5' }

shared_script 'config.lua'

client_scripts {    
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}

shared_script '@es_extended/imports.lua'

dependencies { 'ox_lib' }