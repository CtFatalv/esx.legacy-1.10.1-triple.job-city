resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
	'server/main.lua'
}

client_scripts {    
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/logo.png',
	'html/dmv.png',
	'html/styles.css',
	'html/questions.js',
	'html/scripts.js',
	'html/debounce.min.js'
}

dependencies {
	'es_extended',
	'esx_license'
}

shared_script '@es_extended/imports.lua'