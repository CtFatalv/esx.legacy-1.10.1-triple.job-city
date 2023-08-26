Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableESXOptionalneeds     = false -- Enable if you're using esx_optionalneeds
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableJobBlip              = false -- Enable blips for cops on duty, requires esx_society.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit

Config.Locale = GetConvar('esx:locale', 'fr')

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},
	}
}