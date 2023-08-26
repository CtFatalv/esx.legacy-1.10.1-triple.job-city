fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'config.lua',
    'client.lua'
}

server_script 'server.lua'

shared_script { '@ox_lib/init.lua', '@es_extended/imports.lua' }

dependencies { 'ox_lib' }