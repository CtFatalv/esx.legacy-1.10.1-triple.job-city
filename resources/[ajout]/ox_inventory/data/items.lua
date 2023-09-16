return {
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

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['medikit'] = {
		label = 'Medikit',
		stack = true,
		weight = 10,
	},

	['black_money'] = {
		label = 'Argent sale',
	},

	['burger'] = {
		label = 'Hamburger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Déchet',
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone_crypter'] = {
		label = 'Téléphone Crypté',
		weight = 190,
	},

	['phone'] = {
		label = 'Téléphone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Moutarde',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Bouteille d\'eau',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

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

	['pochon_coke'] = {
		label = 'Pochon de Cocaïne',
		stack = true,
		weight = 10,
	},

	['thermal_charge'] = {
		label = 'Charge Thermique',
		stack = true,
		weight = 10,
	},

	['cash_wad'] = {
		label = 'Liasse de billet',
		stack = true,
		weight = 10,
	},

	['gold_bar'] = {
		label = 'Lingot d\'or',
		stack = true,
		weight = 10,
	},

	['diamant_box'] = {
		label = 'Boite de diamants',
		stack = true,
		weight = 10,
	},

	['card_id'] = {
		label = 'Carte ID',
		stack = true,
		weight = 10,
	},

	['card_id2'] = {
		label = 'Carte ID 2',
		stack = true,
		weight = 10,
	},

	['rasperry'] = {
		label = 'Rasberry PI',
		stack = true,
		weight = 10,
	},

	['jewels'] = {
		label = 'Bijoux',
		stack = true,
		weight = 10,
	},
    -- Mecano
   	['gazbottle'] = {
		label = 'Bouteille de Gaz',
		weight = 160,
	},
    
   	['fixtool'] = {
		label = 'Outil de réparation',
		weight = 160,
	},
    
   	['fixkit'] = {
		label = 'Kit de Réparation',
		weight = 160,
	},
    
   	['blowpipe'] = {
		label = 'Chalumeau',
		weight = 160,
	},
    
	['chalumeau'] = {
		label = 'Chalumeau',
		weight = 450,
		stack = false,
		close = false,
	},

	['petitcoffre'] = {
		label = 'Petit coffre rempli d\'or',
		weight = 450,
		stack = true,
		close = false,
	},

	['piecedor'] = {
		label = 'piece en or',
		weight = 450,
		stack = true,
		close = false,
	},

	['rhumancien'] = {
		label = 'Vielle bouteille de rhum',
		weight = 450,
		stack = true,
		close = false,
	},

	['statuette'] = {
		label = 'Statuette en bronze',
		weight = 450,
		stack = true,
		close = false,
	},

	['collierperle'] = {
		label = 'Collier de perle',
		weight = 450,
		stack = true,
		close = false,
	},

	['tenue_plongee'] = {
		label = 'Combinaison de plongée',
		weight = 450,
		stack = false,
		close = false,
	},

	['bouteilleplongee'] = {
		label = 'Bouteille de Plongée',
		weight = 16000,
		stack = false,
		close = false,
	},

	['bouteilleplongeevide'] = {
		label = 'Bouteille de Plongée vide',
		weight = 16000,
		stack = false,
		close = false,
	},

	['compresseur'] = {
		label = 'Compresseur',
		weight = 450,
		stack = false,
		close = false,
	},

	['fertilisant'] = {
		label = 'Fertilisant',
		stack = true,
		weight = 10,
	},

    ['secateur'] = {
		label = 'Sécateur',
		stack = false,
		weight = 10,
	},

    ['grapperaisin'] = {
		label = 'Grappe de raisin',
		stack = true,
		weight = 10,
	},

    ['pomme'] = {
		label = 'Pomme',
		stack = true,
		weight = 10,
	},

    ['orange'] = {
		label = 'Orange',
		stack = true,
		weight = 10,
	},

    ['jusorange'] = {
		label = 'Jus d\'orange',
		stack = true,
		weight = 10,
	},

    ['jusraisin'] = {
		label = 'Jus de raisin',
		stack = true,
		weight = 10,
	},

    ['juspomme'] = {
		label = 'Jus de pomme',
		stack = true,
		weight = 10,
	},

    ['jusfruit'] = {
		label = 'Jus de fruits',
		stack = true,
		weight = 10,
	},

    ['vin'] = {
		label = 'Vin',
		stack = true,
		weight = 10,
	},

    ['champagne'] = {
		label = 'Champagne',
		stack = true,
		weight = 10,
	},

	['gobelet'] = {
		label = 'Gobelet',
		stack = true,
		weight = 10,
	},

    ['bouteillevide'] = {
		label = 'Bouteille vide',
		stack = true,
		weight = 10,
	},

	['poulet'] = {
		label = 'Poulet',
		stack = true,
		weight = 10,
	},

	['filetdepoulet'] = {
		label = 'Filet de poulet',
		stack = true,
		weight = 10,
	},

	['bucketvide'] = {
		label = 'Bucket vide',
		stack = true,
		weight = 10,
	},

	['chickenbucket'] = {
		label = 'Chicken Bucket',
		stack = true,
		weight = 10,
	},

	['m_charbon'] = {
		label = 'Minerai de charbon',
		weight = 450,
		stack = true,
		close = false,
	},

   	['pochecharbon'] = {
		label = 'Poudre de charbon',
		weight = 450,
		stack = true,
		close = false,
	},

   	['poudrecharbon'] = {
		label = 'Poche de charbon',
		weight = 450,
		stack = true,
		close = false,
	},

   	['m_cuivre'] = {
		label = 'Minerai de cuivre',
		weight = 450,
		stack = true,
		close = false,
	},

	['m_fer'] = {
		label = 'Minerai de Fer',
		weight = 450,
		stack = true,
		close = false,
	},

	['m_titane'] = {
		label = 'Minerai de titane',
		weight = 450,
		stack = true,
		close = false,
	},

	['m_pepiteor'] = {
		label = 'Pépite d\'or',
		weight = 450,
		stack = true,
		close = false,
	},

	['m_pepdiam'] = {
		label = 'Pépite de diamant',
		weight = 450,
		stack = true,
		close = false,
	},

	['m_lithium'] = {
		label = 'Minerai de Lithium',
		weight = 450,
		stack = true,
		close = false,
	},

	['marteaup'] = {
		label = 'Marteau piqueur',
		weight = 450,
		stack = false,
		close = false,
	},

	['meche_casse'] = {
		label = 'Mêche cassé',
		weight = 450,
		stack = true,
		close = false,
	},

	['meche_titane_casser'] = {
		label = 'Mêche cassé en titane',
		weight = 450,
		stack = true,
		close = false,
	},

	['meche_fer'] = {
		label = 'Mêche en fer',
		weight = 450,
		stack = true,
		close = false,
	},

	['meche_titane'] = {
		label = 'Mêche en titane',
		weight = 450,
		stack = true,
		close = false,
	},

	['lingotcuivre'] = {
		label = 'Lingot en cuivre',
		weight = 450,
		stack = true,
		close = false,
	},

	['lingotfer'] = {
		label = 'Lingot en fer',
		weight = 450,
		stack = true,
		close = false,
	},

	['lingottitane'] = {
		label = 'Lingot en titane',
		weight = 450,
		stack = true,
		close = false,
	},

	['lingotlithium'] = {
		label = 'Lingot en lithium',
		weight = 450,
		stack = true,
		close = false,
	},

	['lingotor'] = {
		label = 'Lingot en or',
		weight = 450,
		stack = true,
		close = false,
	},

	['diamant'] = {
		label = 'Diamant',
		weight = 450,
		stack = true,
		close = false,
	},

	['oeuf'] = {
		label = 'Oeuf',
		weight = 450,
		stack = true,
		close = false,
	},

	['lait'] = {
		label = 'Lait',
		weight = 450,
		stack = true,
		close = false,
	},

	['ble'] = {
		label = 'Epi de blé',
		weight = 450,
		stack = true,
		close = false,
	},

	['cacao'] = {
		label = 'Fève de cacao',
		weight = 450,
		stack = true,
		close = false,
	},

	['poudrecacao'] = {
		label = 'Poudre de cacao',
		weight = 450,
		stack = true,
		close = false,
	},

	['farine'] = {
		label = 'Farine',
		weight = 450,
		stack = true,
		close = false,
	},

	['pate'] = {
		label = 'Pâte',
		weight = 450,
		stack = true,
		close = false,
	},

	['baguette'] = {
		label = 'Baguette',
		weight = 450,
		stack = true,
		close = false,
	},

	['croissant'] = {
		label = 'Croissant',
		weight = 450,
		stack = true,
		close = false,
	},

	['painchoc'] = {
		label = 'Pain aux chocolatines',
		weight = 450,
		stack = true,
		close = false,
	},

	['painraisin'] = {
		label = 'Pain aux raisins',
		weight = 450,
		stack = true,
		close = false,
	},

	['tartepomme'] = {
		label = 'Tarte aux pommes',
		weight = 450,
		stack = true,
		close = false,
	},

	['beer'] = {
		label = 'Bière',
		stack = true,
		weight = 10,
	},

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
    -- SHOP PLAYER
    ['shop01'] = {
      label = 'Epicerie N°1',
		stack = false,
		weight = 0,
    },
    
    ['shop02'] = {
      label = 'Epicerie N°2',
		stack = false,
		weight = 0,
    },
    
    ['shop03'] = {
      label = 'Epicerie N°3',
		stack = false,
		weight = 0,
    },
    
    ['shop04'] = {
      label = 'Epicerie N°4',
		stack = false,
		weight = 0,
    },
    
    ['shop05'] = {
      label = 'Epicerie N°5',
		stack = false,
		weight = 0,
    },
    
    ['shop06'] = {
      label = 'Epicerie N°6',
		stack = false,
		weight = 0,
    },
    
    ['shop07'] = {
      label = 'Epicerie N°7',
		stack = false,
		weight = 0,
    },
    
    ['shop08'] = {
      label = 'Epicerie N°8',
		stack = false,
		weight = 0,
    },
    
    ['shop09'] = {
      label = 'Epicerie N°9',
		stack = false,
		weight = 0,
    },
    
    ['shop10'] = {
      label = 'Epicerie N°10',
		stack = false,
		weight = 0,
    },
    
    ['shop11'] = {
      label = 'Epicerie N°11',
		stack = false,
		weight = 0,
    },
    
    ['shop12'] = {
      label = 'Epicerie N°12',
		stack = false,
		weight = 0,
    },
    
    ['shop13'] = {
      label = 'Epicerie N°13',
		stack = false,
		weight = 0,
    },
    
    ['shop14'] = {
      label = 'Epicerie N°14',
		stack = false,
		weight = 0,
    },
    
    ['shop15'] = {
      label = 'Epicerie N°15',
		stack = false,
		weight = 0,
    },
    
    ['shop16'] = {
      label = 'Epicerie N°16',
		stack = false,
		weight = 0,
    },
    
    ['shop17'] = {
      label = 'Epicerie N°17',
		stack = false,
		weight = 0,
    },
    
    ['shop18'] = {
      label = 'Epicerie N°18',
		stack = false,
		weight = 0,
    },
    
    ['shop19'] = {
      label = 'Epicerie N°19',
		stack = false,
		weight = 0,
    },
    
    ['shop20'] = {
      label = 'Epicerie N°20',
		stack = false,
		weight = 0,
    },
}