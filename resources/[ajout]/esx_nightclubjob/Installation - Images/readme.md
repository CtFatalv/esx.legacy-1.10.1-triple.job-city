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
PHPMYADMIN - SQL
==================================================================================================
INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_nightclub', 'Nightclub', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_nightclub', 'Nightclub', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_nightclub', 'Nightclub', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('nightclub', 'Nightclub')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('nightclub', 0, 'barman', 'Barman', 0, '{}', '{}'),
  ('nightclub', 1, 'dancer', 'Danseur', 0, '{}', '{}'),
  ('nightclub', 2, 'chef', 'Chef', 0, '{}', '{}'),
  ('nightclub', 3, 'boss', 'Patron', 0, '{}', '{}')
;
==================================================================================================
OBJETS OX_INVENTORY
==================================================================================================
	['drpepper'] = {
		label = 'Dr. Pepper',
		stack = true,
		weight = 10,
	},

	['limonade'] = {
		label = 'Limonade',
		stack = true,
		weight = 10,
	},

	['glace'] = {
		label = 'Glaçon',
		stack = true,
		weight = 10,
	},

	['vodka'] = {
		label = 'vodka',
		stack = true,
		weight = 10,
	},

	['whisky'] = {
		label = 'whisky',
		stack = true,
		weight = 10,
	},

	['rhum'] = {
		label = 'Rhum',
		stack = true,
		weight = 10,
	},

	['tequila'] = {
		label = 'Tequila',
		stack = true,
		weight = 10,
	},

	['menthe'] = {
		label = 'Feuille de menthe',
		stack = true,
		weight = 10,
	},

	['jager'] = {
		label = 'Jager',
		stack = true,
		weight = 10,
	},

	['jagerbomb'] = {
		label = 'Jägerbomb',
		stack = true,
		weight = 10,
	},

	['golem'] = {
		label = 'Golem',
		stack = true,
		weight = 10,
	},

	['whiskycoca'] = {
		label = 'Whisky-coca',
		stack = true,
		weight = 10,
	},

	['rhumcoca'] = {
		label = 'Rhum-coca',
		stack = true,
		weight = 10,
	},

	['vodkaenergy'] = {
		label = 'Vodka-energy',
		stack = true,
		weight = 10,
	},

	['vodkafruit'] = {
		label = 'Vodka-fruits',
		stack = true,
		weight = 10,
	},

	['rhumfruit'] = {
		label = 'Rhumfruits',
		stack = true,
		weight = 10,
	},

	['teqpaf'] = {
		label = 'Teq paf',
		stack = true,
		weight = 10,
	},

	['mojito'] = {
		label = 'Mojito',
		stack = true,
		weight = 10,
	},

	['metreshooter'] = {
		label = 'Mètre de shooter',
		stack = true,
		weight = 10,
	},

	['jagercerbere'] = {
		label = 'Jäger Cerbère',
		stack = true,
		weight = 10,
	},
==================================================================================================
CRAFTING
==================================================================================================
			{
				items = {
					{
						name = 'jusfruit',
						ingredients = {
							jusorange = 1,
							jusraisin = 1,
							juspomme = 1,
						},
						duration = 5000,
						count = 2,
					},			{
						name = 'jagerbomb',
						ingredients = {
							drpepper = 2,
							jager = 2,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'golem',
						ingredients = {
							limonade = 2,
							vodka = 2,
							glace = 1,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'whiskycoca',
						ingredients = {
							cola = 2,
							whisky = 2,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'rhumcoca',
						ingredients = {
							cola = 2,
							rhum = 2,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'vodkaenergy',
						ingredients = {
							drpepper = 2,
							vodka = 2,
							glace = 1,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'vodkafruit',
						ingredients = {
							jusfruit = 2,
							vodka = 2,
							glace = 1,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'rhumfruit',
						ingredients = {
							jusfruit = 2,
							rhum = 2,
							glace = 1,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'teqpaf',
						ingredients = {
							limonade = 2,
							tequila = 2,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'mojito',
						ingredients = {
							rhum = 2,
							limonade = 2,
							menthe = 2,
							glace = 1,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'metreshooter',
						ingredients = {
							jager = 2,
							vodka = 2,
							whisky = 2,
							tequila = 2,
						},
						duration = 5000,
						count = 1,
					},
					{
						name = 'jagercerbere',
						ingredients = {
							jagerbomb = 1,
							vodka = 2,
							tequila = 2,
						},
						duration = 5000,
						count = 1,
					},
				},
				points = {
					 vec3(128.68, -1284.35, 29.27),
				},
				zones = {
					{
						coords = vec3(128.68, -1284.35, 29.27),
						size = vec3(1.0, 0.8, 0.5),
						distance = 1.5,
						rotation = 30.0,
					},
				},
				--blip = { id = 267, colour = 16, scale = 0.5 },
			},
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