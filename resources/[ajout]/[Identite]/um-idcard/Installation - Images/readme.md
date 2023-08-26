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
     ['id_card'] = {
        label = 'ID Card',
        weight = 0,
        stack = false,
        close = true,
    },

    ['driver_license_voiture'] = {
        label = 'Permis Voiture',
        weight = 0,
        stack = false,
        close = true,
    },

    ['driver_license_moto'] = {
        label = 'Permis Moto',
        weight = 0,
        stack = false,
        close = true,
    },

    ['driver_license_camion'] = {
        label = 'Permis Camion',
        weight = 0,
        stack = false,
        close = true,
    },

    ['weaponlicense'] = {
        label = 'Permis Arme',
        weight = 0,
        stack = false,
        close = true,
    },
==================================================================================================
PHP MY ADMIN
==================================================================================================
CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `licenses` (`type`, `label`) VALUES
('permis_bateau', 'Permis Bâteau'),
('permis_aviation', 'Permis Aviation'),
('dmv', 'Code de la route'),
('permis_camion', 'Permis Camion'),
('permis_moto', 'Permis Moto'),
('permis_voiture', 'Permis Voiture'),
('weapon', 'Permis Arme');

ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);
COMMIT;
==================================================================================================
MULTICHAR SERVEUR
==================================================================================================
    local newCharacters = {}
    AddEventHandler('esx:playerLoaded', function(source, xPlayer)
        if not newCharacters[source] then return end
        newCharacters[source] = nil
        Wait(5000)
        exports['um-idcard']:CreateMetaLicense(source, 'id_card')
    end)

    AddEventHandler('esx_identity:completedRegistration', function(source, data)
        TriggerEvent('esx:onPlayerJoined', source, PREFIX..awaitingRegistration[source], data)
        awaitingRegistration[source] = nil
        ESX.Players[GetIdentifier(source)] = true
        newCharacters[source] = true
    end)
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