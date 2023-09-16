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
PHPMYADMIN -- SQL
==================================================================================================
CREATE TABLE `rcannabis` (
  `id` int(10) UNSIGNED NOT NULL,
  `stage` int(3) UNSIGNED NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `soil` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `rcannabis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stage` (`stage`,`time`);

ALTER TABLE `rcannabis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
==================================================================================================
OBJETS OX_INVENTORY
==================================================================================================
	['phone_crypter'] = {
		label = 'Téléphone Crypté',
		weight = 190,
	},

	['graine_cannabis'] = {
		label = 'Graine de cannabis',
		stack = true,
		weight = 10,
	},

	['fertilisant'] = {
		label = 'Fertilisant',
		stack = true,
		weight = 10,
	},

	['tete_cannabis'] = {
		label = 'Tête de Cannabis',
		stack = true,
		weight = 10,
	},

	['pochon_cannabis'] = {
		label = 'Pochon de Cannabis',
		stack = true,
		weight = 10,
	},
==================================================================================================
[ajout]/JD_PolyTP
==================================================================================================
    ['labo_weedout'] = {
        label = "Interieur Labo Weed",
        icon = 'fas fa-square-caret-up',
        pos = vector4(1066.40, -3183.39, -40.16, 277.00),
        destination = 'labo_weedin',
        ShellWeatherSync = false,
    },
    ['labo_weedin'] = {
        label = "Exterieur Labo Weed",
        icon = 'fas fa-square-caret-down',
        pos = vector4(996.37, -1486.78, 30.51, 88.75),
        destination = 'labo_weedout',
        ShellWeatherSync = false,
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