Config = {}
Config.CheckForUpdates = false  -- check for update available?
Config.Locale = 'en'  -- 'en' or 'id'
Config.UseTarget = true -- if you not use ox_target you can set false
Config.Notify = 'ESX' -- 'mythic_notify', 'lib', 'ESX'
Config.UseAnim = true -- play animation when requesting vehicle list?
Config.ShowVehImpoundInGarage = true
Config.SpawnVehicleInAnyGarage = false -- if true, the fee will be multiplied.
Config.FeeSpawnVehicleInAnyGarage = {[1] = 2, [2] = 3} -- [1] = garages fee * 2, [2] = impound fee * 3 and if you set 0 it's the same as free

Config.AutoTeleportToVehicle = false -- auto teleport to vehicle if vehicle spawning
Config.AutoLockVeh = false -- auto lock to vehicle if vehicle spawning
Config.PayIn = 'money' -- Player can pay vehicle fee with 'money' or 'bank'
Config.LockKeyVehicle = 'U' -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

Config.CmdVehDelete = 'asuransi' -- Admin command for delete vehicle in the words
Config.AutoDelVeh = false -- Automatically confiscate vehicles at a certain time, you can set the time in Config.DeleteVehiclesAt line 84 config.lua
Config.DeleteVehicleTimer = 180 -- in second
Config.DeleteVehiclesIfInSafeZone = false -- you can set safe zone in `Config.SafeZone` line 95 config.lua

Config.VehicleFee = { -- if set to 0 the player does not pay
  Garages = { -- Garage Fee
    [0] = 5000, -- Compacts
    [1] = 5000, -- Sedans
    [2] = 5000, -- SUVs
    [3] = 5000, -- Coupes
    [4] = 5000, -- Muscle
    [5] = 5000, -- Sports Classics
    [6] = 5000, -- Sports
    [7] = 5000, -- Super
    [8] = 2000, -- Motorcycles
    [9] = 5000, -- Off-road
    [10] = 5000, -- Industrial
    [11] = 5000, -- Utility
    [12] = 5000, -- Vans
    [13] = 0, -- Cylces
    [14] = 50000, -- Boats
    [15] = 50000, -- Helicopters
    [16] = 50000, -- Planes
    [17] = 5000, -- Service
    [18] = 0, -- Emergency
    [19] = 5000, -- Military
    [20] = 5000, -- Commercial
    [21] = 5000 -- Train 
  },
  Impound = { -- Impound Fee
    [0] = 15000, -- Compacts
    [1] = 15000, -- Sedans
    [2] = 15000, -- SUVs
    [3] = 15000, -- Coupes
    [4] = 15000, -- Muscle
    [5] = 15000, -- Sports Classics
    [6] = 15000, -- Sports
    [7] = 15000, -- Super
    [8] = 10000, -- Motorcycles
    [9] = 15000, -- Off-road
    [10] = 15000, -- Industrial
    [11] = 15000, -- Utility
    [12] = 15000, -- Vans
    [13] = 0, -- Cylces
    [14] = 150000, -- Boats
    [15] = 150000, -- Helicopters
    [16] = 150000, -- Planes
    [17] = 15000, -- Service
    [18] = 0, -- Emergency
    [19] = 15000, -- Military
    [20] = 15000, -- Commercial
    [21] = 15000 -- Train 
  }
}

Config.Peds = { -- Peds List
  'CSB_TrafficWarden', -- Garages
  's_m_y_construct_01' -- Impounds
}

Config.GroupAdminList= { -- Admin list to use Config.CmdVehDelete
  'dev',
  'moderator',
  'headadmin',
  'admin',
}

Config.DeleteVehiclesAt = { -- Automatic clock setting to delete or impound vehicles if there is no player inside.
	{['h'] = 00, ['m'] = 00},
	{['h'] = 03, ['m'] = 00},
	{['h'] = 06, ['m'] = 00},
	{['h'] = 09, ['m'] = 00},
	{['h'] = 12, ['m'] = 00},
	{['h'] = 15, ['m'] = 00},
	{['h'] = 18, ['m'] = 00},
	{['h'] = 21, ['m'] = 00},
}

Config.SafeZones = { -- If the vehicle is within the safe zone, it will not be deleted.
	{ ['x'] = -44.155646565, ['y'] = -1100.155646565, ['z'] = 26.267009735108, ['radius'] = 50.0},
	{ ['x'] = -1688.43811035156, ['y'] = -1073.62536621094, ['z'] = 13.1521873474121, ['radius'] = 200.0},
	{ ['x'] = -2195.1352539063, ['y'] = 4288.7290039063, ['z'] = 49.173923492432, ['radius'] = 150.0},
}

Config.Garages = { -- Garages Config
  Legion = { -- key garages to input databases
    Label = 'Legion', -- garage label
    Type = 'car', -- 'car', 'aircraft' and 'boat'
    Blip = true, -- if private garages you can set false
    NotFree = true, -- fee garages
    Coords = vector3(214.7889, -806.4965, 30.8092), -- blips and ped coords
    PedHeading = 341.4469, -- ped heading
    Players = { -- Players table allowed to access garages
      -- ex: {'steam:xxxxxxxxxxxx'}
    },
    Groups = { -- Groups table allowed to access garages
      -- ex: {'police'}
    },
    SpawnPoint = {
      { Pos = vector3(222.7534, -804.3437, 30.1486), Heading = 248.5339 },
      { Pos = vector3(223.8556, -801.9759, 30.1351), Heading = 248.5339 },
      { Pos = vector3(224.4868, -799.4138, 30.1383), Heading = 248.5339 },
      { Pos = vector3(225.3986, -796.8544, 30.1434), Heading = 248.5339 },
      { Pos = vector3(225.7808, -794.0939, 30.1681), Heading = 249.2099 },
      { Pos = vector3(226.4725, -791.5930, 30.1775), Heading = 248.3668 },
      { Pos = vector3(227.9673, -789.1436, 30.1805), Heading = 248.0247 },
    },
    DeletePoint = {
      { Pos = vector3(224.74, -787.72, 30.73) },
    }
  },

  Terminal = {
    Label = 'Terminal',
    Type = 'car',
    Blip = true,
    NotFree = true,
    Coords = vector3(1222.0289, -2961.0095, 5.8661), 
    PedHeading = 95.1120,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(1217.5316, -2967.9685, 5.8661), Heading = 96.3912 },
    },
    DeletePoint = {
      { Pos = vector3(1220.53, -2961.12, 5.87) }
    }
  },

  Festival = {
    Label = 'Festival',
    Type = 'car',
    Blip = true,
    NotFree = true,
    Coords = vector3(-1592.9933, -923.3627, 9.0223), 
    PedHeading = 53.7181,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(-1598.6584, -923.6129, 8.4312), Heading = 139.0172 },
      { Pos = vector3(-1600.6407, -921.2331, 8.4414), Heading = 139.2408 },
      { Pos = vector3(-1603.2598, -919.4777, 8.4354), Heading = 140.2991 },
      { Pos = vector3(-1605.3907, -917.2253, 8.4415), Heading = 139.6384 },
      { Pos = vector3(-1607.4508, -914.8009, 8.4508), Heading = 140.9010 },
    },
    DeletePoint = {
      { Pos =  vector3(-1609.05, -909.76, 9.01) },
    }
  },

  Paleto = {
    Label = 'Paleto',
    Type = 'car',
    Blip = true,
    NotFree = true,
    Coords = vector3(79.6358, 6404.2163, 31.4458), 
    PedHeading = 131.1130,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(61.8341, 6404.0713, 30.7141), Heading = 215.2714 },
      { Pos = vector3(59.0627, 6400.9746, 30.7144), Heading = 214.8043 },
      { Pos = vector3(64.7686, 6406.2705, 30.7141), Heading = 211.2245 }
    },
    DeletePoint = {
      { Pos = vector3(43.77, 6372.25, 31.24) },
    }
  },

  SandyShoresG = {
    Label = 'Sandy Shores Garage',
    Type = 'car',
    Blip = true,
    NotFree = true,
    Coords = vector3(1894.9961, 3714.3591, 32.7538), 
    PedHeading = 118.3539,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(1888.0814, 3716.1348, 32.3407), Heading = 121.8960 },
      { Pos = vector3(1885.9080, 3719.4238, 32.3447), Heading = 119.4130 },
      { Pos = vector3(1884.1178, 3722.4272, 32.3363), Heading = 118.8460 }
    },
    DeletePoint = {
      { Pos = vector3(1884.61, 3710.53, 33.00) },
    }
  },
  
  MirrorPark = {
    Label = 'Mirror Park',
    Type = 'car',
    Blip = true,
    NotFree = true,
    Coords = vector3(1035.1742, -765.1974, 57.9947), 
    PedHeading = 153.8849,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(1027.6094, -771.8443, 57.5259), Heading = 145.7455 },
      { Pos = vector3(1030.7230, -773.7680, 57.5479), Heading = 143.9065 },
    },
    DeletePoint = {
      { Pos = vector3(1027.6094, -771.8443, 57.5479)},
    }
  },

  LSAirPort = {
    Label = 'Los Santos Airport',
    Type = 'air',
    Blip = true,
    NotFree = true,
    Coords = vector3(-1120.34, -2841.12, 13.95) , 
    PedHeading = 152.0285,
    Players = {
      
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(-1178.2308, -2845.7175, 13.9458), Heading = 146.1286 },
      { Pos = vector3(-1145.8920, -2864.2798, 13.9460), Heading = 153.7971 },
      { Pos = vector3(-1112.4072, -2883.8889, 13.9460), Heading = 152.9144 },
    },
    DeletePoint = {
      { Pos = vector3(-1145.82, -2864.57, 13.95) },
    }
  },
  
  PacificOcean = {
    Label = 'Pacific Ocean Watercraft',
    Type = 'boat',
    Blip = true,
    NotFree = true,
    Coords = vector3(-753.75, -1507.82, 5.01), 
    PedHeading = 345.0511,
    Players = {
  
    },
    Groups = {
      
    },
    SpawnPoint = {
      { Pos = vector3(-811.38, -1508.76, 0.41) , Heading = 135.0 },
    },
    DeletePoint = {
      { Pos = vector3(-794.04, -1501.16, 0.40)},
    }
  },
  
  Taxi = {
    Label = 'Taxi',
    Type = 'car',
    Blip = false,
    NotFree = true,
    Coords = vector3(903.65, -166.28, 74.10), 
    PedHeading = 237.73,
    Players = {
      
    },
    Groups = {
      {'taxi'}
    },
    SpawnPoint = {
      { Pos = vector3(915.82, -170.75, 74.00), Heading = 100.00 },
      { Pos = vector3(918.04, -167.19, 74.18), Heading = 100.00 },
    },
    DeletePoint = {
      { Pos = vector3(908.89, -174.21, 74.17)},
    }
  },
  
  Ems1 = {
    Label = 'EMS',
    Type = 'car',
    Blip = false,
    NotFree = true,
    Coords = vector3(316.91, -1479.11, 29.80), 
    PedHeading = 270.78,
    Players = {
      
    },
    Groups = {
       {'ambulance'}
    },
    SpawnPoint = {
      { Pos = vector3(331.37, -1468.44, 29.47), Heading = 229.73 },
      { Pos = vector3(328.47, -1471.86, 29.53), Heading = 230.43 },
      { Pos = vector3(325.64, -1475.27, 29.58), Heading = 229.84 },
      { Pos = vector3(322.68, -1478.83, 29.58), Heading = 230.67 },
    },
    DeletePoint = {
      { Pos = vector3(349.17, -1507.70, 29.44)},
    }
  },
  
  Ems2 = {
    Label = 'EMS',
    Type = 'air',
    Blip = false,
    NotFree = true,
    Coords = vector3(314.54, -1450.51, 46.51), 
    PedHeading = 274.96,
    Players = {
      
    },
    Groups = {
       {'ambulance'}      
    },
    SpawnPoint = {
      { Pos = vector3(299.43, -1453.30, 46.90), Heading = 319.81 },
      { Pos = vector3(313.63, -1464.89, 46.90), Heading = 320.30 },
    },
    DeletePoint = {
      { Pos = vector3(290.69, -1442.49, 46.94)},
    }
  },

}

Config.Impound = { -- Impound Config
	SandyShores = {
		Label = 'Fourrière',
    Type = 'car',
    IsDefaultImpound = true,
		Blip = true,
    NotFree = true,
		Coords = vector3(-422.71, -1705.10, 19.23),
		PedHeading = 193.79,
		SpawnPoint = {
			{ Pos = vector3(-425.98, -1689.59, 19.03), Heading = 155.0, }
		},
	},

	SandyShoresAir = {
		Label = 'Sandy Shores Air',
    Type = 'air',
    IsDefaultImpound = true,
		Blip = true,
    NotFree = true,
		Coords = vector3(1727.7544, 3293.1646, 41.1973),
		PedHeading = 193.5272,
		SpawnPoint = {
			{ Pos = vector3(1749.2124, 3264.2148, 41.2852), Heading = 102.5581, }
		},
	},

	SandyShoresBoat = {
		Label = 'Sandy Shores Watercraft',
    Type = 'boat',
    IsDefaultImpound = true,
		Blip = true,
    NotFree = true,
		Coords = vector3(1733.4327, 3985.1807, 31.9787),
		PedHeading = 121.1930,
		SpawnPoint = {
			{ Pos = vector3(1730.9972, 3990.8796, 29.7878), Heading = 304.6193, }
		},
	},

	JobsImpound = { -- if for jobs keywords should start with the word Jobs
		Label = 'Fourrière de Police',
    Type = 'car',
    IsDefaultImpound = false,
		Blip = true,
    NotFree = false,
		Coords = vector3(409.5207, -1623.1407, 29.2919),
		PedHeading = 226.8043,
		SpawnPoint = {
			{ Pos = vector3(416.9999, -1627.8965, 29.0), Heading = 137.3000, },
			{ Pos = vector3(419.6365, -1629.6110, 29.0), Heading = 135.3693, },
			{ Pos = vector3(420.4732, -1635.9071, 29.0), Heading = 88.7233, },
			{ Pos = vector3(420.4871, -1638.9510, 29.0), Heading = 86.0705, },
			{ Pos = vector3(420.5472, -1641.9459, 29.0), Heading = 87.1742, },
		},
	},
}

Config.Blips = {
  Garages = {
    air = {
      Sprite = 359,
      Colour = 3,
      Display = 2,
      Scale = 0.8
    },
    car = {
      Sprite = 357,
      Colour = 3,
      Display = 2,
      Scale = 0.8
    },
    boat = {
      Sprite = 356,
      Colour = 3,
      Display = 2,
      Scale =  0.8
    }
  },
  Impounds = {
    air = {
      Sprite = 359,
      Colour = 51,
      Display = 2,
      Scale = 0.8
    },
    car = {
      Sprite = 477,
      Colour = 51,
      Display = 2,
      Scale = 0.7
    },
    boat = {
      Sprite = 356,
      Colour = 51,
      Display = 2,
      Scale =  0.8
    }
  }
}