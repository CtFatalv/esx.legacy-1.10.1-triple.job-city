Config                            = {}

Config.DrawDistance               = 100.0
Config.Locale                     = 'en'

Config.OpenViaButton              = true
Config.CreateKeyCommand           = true
Config.MenuButton                 = 168       -- F7
Config.VehicleMenu                = 56        -- F9

Config.EngineButton               = 20        -- Z or Y can be diffrent between German and English Layout
Config.LockButton                 = 303       -- U

Config.TrustedKeys                = false     --Enable / Disable Trusted Key Option
Config.ChangePlate                = false      --Enable / Disable Change Plate Option
Config.RenameKey                  = true      --Enable / Disable Give Key Name Option
Config.RenameKeyLenght            = 15        --Maximal count of Letters of Custom Name key

Config.KeyPrice                   = 100
Config.TrustedKeyPrice            = 150
Config.ChangePlatePrice           = 500

Config.LockRange                  = 15.0



Config.Zones = {
  CopyKeyStore = {
    Name      = 'serrurier',
    Blip      = 186,
    BlipColor = 53,
    BlipScale = 1.0,
    Pos       = { x = 170.13, y = -1799.38, z = 28.2 },
    Size      = { x = 1.5, y = 1.5, z = 0.5 },
    Color     = { r = 0, g = 255, b = 0 },  
    Type      = 1,
  },
  --ChangePlate = {
    --Name      = 'Bureau des admissions',
    --Blip      = 525,
    --BlipColor = 53,
    --BlipScale = 0.7,
    --Pos       = { x = -311.15, y = -1013.88, z = 29.3 },
    --Size      = { x = 2.5, y = 2.5, z = 0.5 },
    --Color     = { r = 0, g = 255, b = 0 },  
    --Type      = 1,
  --},
}



Locales = {}

Locales['de'] = {
  ['invalidEntry']          = 'Ungültige eingabe',
  ['entryTooLong']          = 'Deine Eingabe ist zu lang',
  ['notEnoughMoney']        = 'Du hast zu wenig Geld dabei',
  ['noPlayerNearYou']       = 'Es befindet sich kein Spieler in deiner Nähe',

  ['gotKey']                = 'Du hast einen Schlüssel für das Fahrzeug: %s erhalten',
  ['NoKeyForVehicle']       = 'Du hast keinen Schlüssel für dieses Fahrzeug',

  ['VehicleLocked']         = 'Fahrzeug ~r~abgeschlossen',
  ['VehicleUnlocked']       = 'Fahrzeug ~g~aufgeschlossen',

  ['renamedKey']            = 'Du hast deinen Schlüssel zu ~b~%s~s~ umbenannt',
  ['gaveKey']               = 'Du hast den Schlüssel mit dem Kennzeichen ~b~%s~s~ weitergegeben',
  ['CantDeleteOriginal']    = 'Du kannst keinen ~r~Originalschlüssel ~s~wegwerfen',
  ['DeleteKey']             = 'Du hast den Fahrzeugschlüssel ~b~%s~r~ weggeworfen',
  ['CopiedKey']             = 'Du hast den Schlüssel für das Fahrzeug ~b~%s~s~ Copiert',
  ['removedKeyLabel']       = 'Du hast den Namen deines Schlüssels ~r~entfernt',

  ['PlateExists']           = '~r~Das Kennzeichen ~b~%s~r~ ist bereits vergeben',
  ['PlateChanged']          = 'Du hast das Kennzeichen zu ~b~%s~s~ geändert',
  ['NewPlateTooLong']       = 'Das Nummernschild ist ~r~zu Lang~s~ (Max 8 Zeichen)',
}

Locales['en'] = {
  ['invalidEntry'] = 'Entrée invalide',
  ['entryTooLong'] = 'Entrée trop longue',
  ['notEnoughMoney'] = 'Vous n\'avez pas ~r~assez ~s~argent',
  ['noPlayerNearYou'] = 'Il n\'y a pas de joueur près de chez vous',

  ['gotKey'] = 'Vous avez une clé pour la plaque du véhicule ~b~%s',
  ['NoKeyForVehicle'] = 'Vous n\'avez pas de clé pour ce véhicule',

  ['VehicleLocked'] = 'Véhicule ~r~verrouillé',
  ['VehicleUnlocked'] = 'Véhicule ~g~déverrouillé',

  ['renamedKey'] = 'Vous avez renommé votre clé en ~b~%s~s~',
  ['gaveKey'] = 'Vous avez donné la clé avec la plaque ~b~%s~s~',
  ['CantDeleteOriginal'] = 'Vous ne pouvez pas supprimer une clé ~r~Original !',
  ['CantGiveOriginal'] = 'Vous ne pouvez pas donner une clé ~r~Original !',
  ['DeleteKey'] = 'Vous avez supprimé la clé de la plaque ~b~%s~r~',
  ['CopiedKey'] = 'Vous avez copié la clé de la plaque ~b~%s~s~',
  ['removedKeyLabel'] = 'Vous avez supprimé le libellé de la clé',

  ['PlateExists'] = 'Cette plaque existe déjà',
  ['PlateChanged'] = 'Vous avez changé votre plaque en ~b~%s~s~',
  ['NewPlateTooLong'] = 'Votre nouvelle plaque est ~r~trop longue~s~ (Max 8 lettres)',
}
