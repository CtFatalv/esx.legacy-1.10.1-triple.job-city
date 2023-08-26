Config = {};

Config.IdCardSettings = {
   closeKey = 'Backspace',
   autoClose = {
      status = false, -- or true
      time = 3000
   }
};

Config.Licenses = {
   ['id_card'] = {
      header = 'Identity',
      background = '#ebf7fd',
      prop = 'prop_franklin_dl'
   },
   ['driver_license_voiture'] = {
      header = 'Permis Voiture',
      background = '#ff77cbff',
      prop = 'prop_franklin_dl',
   },
   ['driver_license_moto'] = {
      header = 'Permis Moto',
      background = '#febbbb',
      prop = 'prop_franklin_dl',
   },
   ['driver_license_camion'] = {
      header = 'Permis Camion',
      background = '#77ff7eff',
      prop = 'prop_franklin_dl',
   },
   ['weaponlicense'] = {
      header = 'Permis Arme',
      background = '#e8ff81ff',
      prop = 'prop_franklin_dl',
   },
}