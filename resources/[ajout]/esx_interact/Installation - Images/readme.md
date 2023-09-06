 _______  _______  _______           _______  _______                  _______  _______ _________
(  ____ \(  ____ \(  ____ )|\     /|(  ____ \(  ____ )       |\     /|(  ___  )(  ____ \\__   __/
| (    \/| (    \/| (    )|| )   ( || (    \/| (    )|       | )   ( || (   ) || (    \/   ) (   
| (_____ | (__    | (____)|| |   | || (__    | (____)| _____ | (___) || |   | || (_____    | |   
(_____  )|  __)   |     __)( (   ) )|  __)   |     __)(_____)|  ___  || |   | |(_____  )   | |   
      ) || (      | (\ (    \ \_/ / | (      | (\ (          | (   ) || |   | |      ) |   | |   
/\____) || (____/\| ) \ \__  \   /  | (____/\| ) \ \__       | )   ( || (___) |/\____) |   | |   
\_______)(_______/|/   \__/   \_/   (_______/|/   \__/       |/     \|(_______)\_______)   )_(   
==================================================================================================
Pour me contacter, aide à l'installation, modifiation de script, aide divers:

- Discord:
mime.sh

- Site vitrine:
https://server-host.fr/

- Discord:
https://discord.gg/gdVc4V83pB

- Mail:
server.host.contact@gmail.com
==================================================================================================
OBJETS OX_INVENTORY
==================================================================================================
    ['cagoule'] = {
        label = 'Cagoule',
        weight = 0,
        stack = true,
    },

	['menotte'] = {
		label = 'Menotte',
		weight = 100,
		stack = true,
	},

	['clemenotte'] = {
		label = 'Clé de menotte',
		weight = 100,
		stack = false,
	},

	['zip'] = {
		label = 'zip',
		weight = 100,
		stack = true,
	},

	['cutter'] = {
		label = 'Cutter',
		weight = 100,
		stack = false,
	},
==================================================================================================
OX_INTERRACT
==================================================================================================
-- Police
	{
		event = "handcuff",
		icon = Config.handcuff_img,
		label = "Menotter",
		num = 2,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
	{
		event = "unhandcuff",
		icon = Config.handcuff_img,
		label = "Démenotter",
		num = 3,
        groups = {
			['police'] = 0
		},
        distance = 0.7
	},
-- ALL
		{
			event = "cagoule",
			icon = Config.search_img,
			label = "cagoule",
			num = 1,
			distance = 0.7
		},
		{
			event = "uncagoule",
			icon = Config.search_img,
			label = "Enlever la cagoule",
			num = 1,
			distance = 0.7
		},
		{
			event = "zip",
			icon = Config.search_img,
			label = "zip",
			num = 2,
			distance = 0.7
		},
		{
			event = "unzip",
			icon = Config.search_img,
			label = "unzip",
			num = 3,
			distance = 0.7
		},
        {
            event = "bunhandcuff",
            icon = Config.handcuff_img,
            label = "Crochetter les menottes",
            num = 3,
            distance = 0.7
        },
==================================================================================================
NON FONCTIONNEL
==================================================================================================
 _______ _________ _       
(  ____ \\__   __/( (    /|
| (    \/   ) (   |  \  ( |
| (__       | |   |   \ | |
|  __)      | |   | (\ \) |
| (         | |   | | \   |
| )      ___) (___| )  \  |
|/       \_______/|/    )_)
==================================================================================================