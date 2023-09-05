return {
	{
		coords = vec3(452.3, -991.4, 30.7),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

	{
		coords = vec3(237.31, -1360.42, 39.54),
		target = {
			loc = vec3(237.31, -1360.42, 39.54),
			length = 7.0,
			width = 2.8,
			heading = 320,
            minZ=33.34,
            maxZ=41.74,
			label = 'Coffre Patron'
		},
		name = 'emspatronlocker',
		label = 'Coffre Patron',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 3}
	},

	{
		coords = vec3(270.84, -1363.89, 24.54),
		target = {
			loc = vec3(270.84, -1363.89, 24.54),
			length = 2.4,
			width = 1.2,
			heading = 320,
          minZ=23.54,
          maxZ=25.54,
			label = 'Coffre personnel'
		},
		name = 'emspersonnellocker',
		label = 'Coffre personnel',
		owner = true,
		slots = 30,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

	{
		coords = vec3(902.35, -153.59, 82.5),
		target = {
			loc = vec3(902.35, -153.59, 82.5),
			length = 3.2,
			width = 1.0,
			heading = 329,
            minZ=81.45,
            maxZ=82.45,
			label = 'Coffre Taxi'
		},
		name = 'taxilocker',
		label = 'Coffre Taxi',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['taxi'] = 4}
	},

	{
		coords = vec3(92.07, -1291.26, 28.27),
		target = {
			loc = vec3(92.07, -1291.26, 28.27),
			length = 0.8,
			width = 0.65,
			heading = 30,
            minZ=28.27,
            maxZ=29.82,
			label = 'Coffre Patron'
		},
		name = 'Nightclubpatronlocker',
		label = 'Coffre Patron',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['nightclub'] = 3}
	},

	{
		coords = vec3(106.19, -1298.87, 27.77),
		target = {
			loc = vec3(106.19, -1298.87, 27.77),
			length = 1.0,
			width = 2.6,
			heading = 30,
            minZ=27.77,
            maxZ=30.37,
			label = 'Coffre personnel'
		},
		name = 'nightclubpersonnellocker',
		label = 'Coffre personnel',
		owner = true,
		slots = 30,
		weight = 70000,
		groups = {['nightclub'] = 0}
	},

	{
		coords = vec3(127.86, -1281.91, 28.27),
		target = {
			loc = vec3(127.86, -1281.91, 28.27),
			length = 1.2,
			width = 0.85,
			heading = 300,
            minZ=28.27,
            maxZ=29.32,
			label = 'Réfrigirateur'
		},
		name = 'Nightclubfrigolocker',
		label = 'Réfrigirateur',
		owner = false,
		slots = 100,
		weight = 100000,
		groups = {['nightclub'] = 0}
	},

{
        coords = vec3(128.13, -1283.45, 28.47),
        target = {
            loc = vec3(128.13, -1283.45, 28.47),
            length = 0.6,
            width = 1.6,
            heading = 65,
            minZ=28.07,
            maxZ=29.47,
            label = 'Bar'
        },
        name = 'Nightclubbarlocker',
        label = 'Bar',
        owner = false,
        slots = 2,
        weight = 500
    },
}