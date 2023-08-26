return {
	{
		items = {
			{
				name = 'gazbottle',
				ingredients = {
					lingotfer = 2,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'chalumeau',
				ingredients = {
                    gazbottle = 1,
					lingotfer = 1,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'fixtool',
				ingredients = {
					lingotfer = 2,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'fixkit',
				ingredients = {
					lingotfer = 2,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(-1147.083008, -2002.662109, 13.180260),
			vec3(-345.374969, -130.687088, 39.009613)
		},
		zones = {
			{
				coords = vec3(-1146.2, -2002.05, 13.2),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
			{
				coords = vec3(-346.1, -130.45, 39.0),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 70.0,
			},
		},
		blip = { id = 566, colour = 31, scale = 0.5 },
		groups = {['mechanic'] = 0},
	},
	{
		items = {
			{
				name = 'poudrecharbon',
				ingredients = {
					m_charbon = 1,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 5,
			},
			{
				name = 'pochecharbon',
				ingredients = {
					m_charbon = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingotcuivre',
				ingredients = {
					m_cuivre = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingotfer',
				ingredients = {
					m_fer = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingottitane',
				ingredients = {
					m_titane = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingotlithium',
				ingredients = {
					m_lithium = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingotor',
				ingredients = {
					m_pepiteor = 5,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'diamant',
				ingredients = {
					m_pepdiam = 1,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingotfer',
				ingredients = {
					meche_casse = 1,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'lingottitane',
				ingredients = {
					meche_titane_casser = 1,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'meche_fer',
				ingredients = {
					lingotfer = 2,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'meche_titane',
				ingredients = {
					lingottitane = 2,
					WEAPON_HAMMER = 0.05
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(1112.69, -2005.33, 35.24),
		},
		zones = {
			{
				coords = vec3(1112.69, -2005.33, 35.24),
				size = vec3(3.8, 1.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
		},
		blip = { id = 477, colour = 47, scale = 0.5 },
	},
	{
		items = {
			{
				name = 'jusorange',
				ingredients = {
                    gobelet = 1,
					orange = 4,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'jusraisin',
				ingredients = {
                    gobelet = 1,
					grapperaisin = 4,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'juspomme',
				ingredients = {
                    gobelet = 1,
					pomme = 4,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'vin',
				ingredients = {
					bouteillevide = 1,
					grapperaisin = 4,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'champagne',
				ingredients = {
					bouteillevide = 1,
					grapperaisin = 4,
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(375.26, -335.55, 48.56),
		},
		zones = {
			{
				coords = vec3(375.26, -335.55, 48.56),
				size = vec3(5.8, 3.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
		},
		blip = { id = 93, colour = 16, scale = 0.7 },
	},
    {
		items = {
			{
				name = 'filetdepoulet',
				ingredients = {
                    poulet = 1,
					WEAPON_KNIFE = 0.01
				},
				duration = 5000,
				count = 2,
			},
			{
				name = 'chickenbucket',
				ingredients = {
                    bucketvide = 1,
					filetdepoulet = 2,
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			 vec3(-102.77, 6208.98, 31.91),
		},
		zones = {
			{
				coords = vec3(-102.77, 6208.98, 30.91),
				size = vec3(5.8, 3.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
		},
		blip = { id = 267, colour = 16, scale = 0.5 },
	},
	{
		items = {
			{
				name = 'poudrecacao',
				ingredients = {
                    cacao = 1,
				},
				duration = 5000,
				count = 2,
			},
			{
				name = 'farine',
				ingredients = {
                    ble = 1,
				},
				duration = 5000,
				count = 2,
			},
			{
				name = 'pate',
				ingredients = {
                    water = 1,
					oeuf = 1,
					farine = 1,
				},
				duration = 5000,
				count = 2,
			},
			{
				name = 'baguette',
				ingredients = {
                    pate = 2,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'croissant',
				ingredients = {
                    pate = 1,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'painchoc',
				ingredients = {
                    pate = 1,
					poudrecacao = 1,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'painraisin',
				ingredients = {
                    pate = 1,
					grapperaisin = 1,
				},
				duration = 5000,
				count = 1,
			},
			{
				name = 'tartepomme',
				ingredients = {
                    pate = 1,
					pomme = 1,
				},
				duration = 5000,
				count = 1,
			},
		},
		points = {
			vec3(-1334.84, -230.04, 43.28),
		},
		zones = {
			{
				coords = vec3(-1334.84, -230.04, 43.28),
				size = vec3(5.8, 3.05, 0.15),
				distance = 1.5,
				rotation = 315.0,
			},
		},
		blip = { id = 269, colour = 16, scale = 0.5 },
	},
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
}