fx_version 'adamant'

game 'gta5'
lua54 'yes'

description 'ESX interact'

version '1.7.5'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

ui_page('index.html') --HEAD BAG IMAGE

files {
    'index.html'
}