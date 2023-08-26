fx_version "cerulean"
game "gta5"

server_script {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

shared_script '@es_extended/imports.lua'