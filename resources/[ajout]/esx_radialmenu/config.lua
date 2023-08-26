Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        --title = 'Citizen',
		title = 'Activitées',
        icon = 'user',
        items = {
            -- {
            --     id = 'givenum',
            --     title = 'Give Contact Details',
            --     icon = 'address-book',
            --     type = 'client',
            --     event = 'qb-phone:client:GiveContactDetails',
            --     shouldClose = true
            -- },
            {
                id = 'handsup',
          --      title = 'Hands Up',
		title = 'Plongé sous-marine',
                id = 'escort554',
                title = 'plongee',
                icon = 'child',
                type = 'client',
                event = 'esxoceansalvage:startplongee',
                shouldClose = true
            },
          --[[  {
                id = 'handsup',
          --      title = 'Hands Up',
		title = 'A venir',
                icon = 'hand',
                type = 'cmd',
                event = 'hu',
                shouldClose = true
            },
            {
                id = 'getintrunk',
                --title = 'Get In Trunk',
		title = 'A venir',
                icon = 'car',
                type = 'client',
                event = 'cmds:getInTrunk',
                shouldClose = true
            },
            -- {
            --     id = 'cornerselling',
            --     title = 'Corner Selling',
            --     icon = 'cannabis',
            --     type = 'client',
            --     event = 'qb-drugs:client:cornerselling',
            --     shouldClose = true
            -- },
            -- {
            --     id = 'togglehotdogsell',
            --     title = 'Hotdog Selling',
            --     icon = 'hotdog',
            --     type = 'client',
            --     event = 'qb-hotdogjob:client:ToggleSell',
            --     shouldClose = true
            -- },
            {
                id = 'interactions',
               -- title = 'Interaction',
		title = 'A venir',
                icon = 'exclamation-triangle',
                items = {
                    {
                        id = 'stealplayer',
                        title = 'Rob',
                        icon = 'mask',
                        type = 'cmd',
                        event = 'steal',
                        shouldClose = true
                    }, {
                        id = 'escort',
                        title = 'Carry',
                        icon = 'user-friends',
                        type = 'cmd',
                        event = 'carry',
                        shouldClose = true
                    }, {
                        id = 'escort554',
                        title = 'plongee',
                        icon = 'child',
                        type = 'client',
                        event = 'carry',
                        shouldClose = true
                    }
                }
            }]]
        }
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = 'list-alt',
        items = {
            -- {
            --     id = 'house',
            --     title = 'House Interaction',
            --     icon = 'home',
            --     items = {
            --         {
            --             id = 'givehousekey',
            --             title = 'Give House Keys',
            --             icon = 'key',
            --             type = 'client',
            --             event = 'qb-houses:client:giveHouseKey',
            --             shouldClose = true,
            --             items = {}
            --         }, {
            --             id = 'removehousekey',
            --             title = 'Remove House Keys',
            --             icon = 'key',
            --             type = 'client',
            --             event = 'qb-houses:client:removeHouseKey',
            --             shouldClose = true,
            --             items = {}
            --         }, {
            --             id = 'togglelock',
            --             title = 'Toggle Doorlock',
            --             icon = 'door-closed',
            --             type = 'client',
            --             event = 'qb-houses:client:toggleDoorlock',
            --             shouldClose = true
            --         }, {
            --             id = 'decoratehouse',
            --             title = 'Decorate House',
            --             icon = 'boxes',
            --             type = 'client',
            --             event = 'qb-houses:client:decorate',
            --             shouldClose = true
            --         }, {
            --             id = 'houseLocations',
            --             title = 'Interaction Locations',
            --             icon = 'home',
            --             items = {
            --                 {
            --                     id = 'setstash',
            --                     title = 'Set Stash',
            --                     icon = 'box-open',
            --                     type = 'client',
            --                     event = 'qb-houses:client:setLocation',
            --                     shouldClose = true
            --                 }, {
            --                     id = 'setoutift',
            --                     title = 'Set Wardrobe',
            --                     icon = 'tshirt',
            --                     type = 'client',
            --                     event = 'qb-houses:client:setLocation',
            --                     shouldClose = true
            --                 }, {
            --                     id = 'setlogout',
            --                     title = 'Set Logout',
            --                     icon = 'door-open',
            --                     type = 'client',
            --                     event = 'qb-houses:client:setLocation',
            --                     shouldClose = true
            --                 }
            --             }
            --         }
            --     }
            -- },
			{
                id = 'voirmagasin',
                title = 'Voir les magasins',
                icon = 'home',
                type = 'client',
                event = 'ox_shops:voirmagasin',
                shouldClose = true,
                items = {}
            },
            {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'tshirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Hair',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Ear Piece',
                        icon = 'deaf',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Neck',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Top',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Shirt',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Pants',
                        icon = 'user',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Shoes',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'qb-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Hat',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Glasses',
                                icon = 'glasses',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Visor',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'Mask',
                                icon = 'theater-masks',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Vest',
                                icon = 'vest',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Bag',
                                icon = 'shopping-bag',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Bracelet',
                                icon = 'user',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Watch',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Gloves',
                                icon = 'mitten',
                                type = 'client',
                                event = 'qb-radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            }
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {
            {
                id = 'vehicledoors',
                title = 'Porte véhicule',
                icon = 'car-side',
                items = {
                    {
                        id = 'door0',
                        title = 'Porte Chauffeur',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door4',
                        title = 'Capot',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door1',
                        title = 'Porte Passager',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door3',
                        title = 'Porte arrière droite',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door5',
                        title = 'Coffre',
                        icon = 'car',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }, {
                        id = 'door2',
                        title = 'Porte arrière gauche',
                        icon = 'car-side',
                        type = 'client',
                        event = 'qb-radialmenu:client:openDoor',
                        shouldClose = false
                    }
                }
            },
            -- {
            --     id = 'vehicleextras',
            --     title = 'Vehicle Extras',
            --     icon = 'plus',
            --     items = {
            --         {
            --             id = 'extra1',
            --             title = 'Extra 1',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra2',
            --             title = 'Extra 2',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra3',
            --             title = 'Extra 3',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra4',
            --             title = 'Extra 4',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra5',
            --             title = 'Extra 5',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra6',
            --             title = 'Extra 6',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra7',
            --             title = 'Extra 7',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra8',
            --             title = 'Extra 8',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra9',
            --             title = 'Extra 9',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra10',
            --             title = 'Extra 10',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra11',
            --             title = 'Extra 11',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra12',
            --             title = 'Extra 12',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }, {
            --             id = 'extra13',
            --             title = 'Extra 13',
            --             icon = 'box-open',
            --             type = 'client',
            --             event = 'qb-radialmenu:client:setExtra',
            --             shouldClose = false
            --         }
            --     }
            -- },
            {
                id = 'vehicleseats',
                title = 'Vehicle Seats',
                icon = 'chair',
                items = {
                    {
                        id = 'door0',
                        title = 'Driver',
                        icon = 'chair',
                        type = 'client',
                        event = 'qb-radialmenu:client:ChangeSeat',
                        shouldClose = false
                    }
                }
            },
            {
                id = 'vehicle',
                title = 'Gestion des clés',
                icon = 'car',
                type = 'client',
                event = 'Alf-Carkeys:OpenKeysMenu',
                shouldClose = true
            },
            {
                id = 'vehiclesend',
                title = 'Donner véhicule',
                icon = 'car',
                type = 'client',
                event = 'esx_givecarkeys:keys',
                shouldClose = true
            },
            {
                id = 'vehicleancre',
                title = 'Ancré le Bateau',
                icon = 'anchor',
                type = 'client',
                event = 'Alf:ancre',
                shouldClose = true
            }
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
}

Config.JobInteractions = {
    ["police"] = {
        {
            id = 'policeinteraction',
            title = 'Vérifier une plaque',
            icon = 'tasks',
            type = 'client',
            event = 'esx_policejob:vehicleinfoplate',
            shouldClose = true
        }
        },
    ["mechanic"] = {
        {
            id = 'mechanicvehiculeinteraction',
            title = 'Custom',
            icon = 'car',
            type = 'client',
            event = 'esx_mechanicjob:vehicleinteraction',
            shouldClose = true
		},
        {
			id = 'mechanicjobinteraction',
            title = 'Job dépannage',
            icon = 'exclamation-triangle',
            type = 'client',
            event = 'esx_mechanicjob:Jobinteraction',
            shouldClose = true
		},
        },
    ["taxi"] = {
        {
            id = 'taxiinteraction',
            title = 'Job Moldu',
            icon = 'car',
            type = 'client',
            event = 'esx_taxijob:jobmoldutaxi',
            shouldClose = true
        } ,
        },
    ["ambulance"] = {
        {
            id = 'emsrecherchecorp',
            title = 'Chercher le patient',
            icon = 'child',
            type = 'client',
            event = 'ambulance:cherche',
            shouldClose = true
		   },
        },
    -- ["hotdog"] = {
    --     {
    --         id = 'togglesell',
    --         title = 'Toggle sell',
    --         icon = 'hotdog',
    --         type = 'client',
    --         event = 'qb-hotdogjob:client:ToggleSell',
    --         shouldClose = true
    --     }
    -- }
    -- ["jobname"] = {

    

    
    
    
    
    -- },
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans  
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs  
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle  
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics  
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports  
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super  
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles  
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road  
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial  
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility  
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans  
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles  
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats  
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters  
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes  
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service  
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency  
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military  
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial  
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains  
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local Bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["resetclothes"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nothing To Reset', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Revert everything back to normal",
        Name = "resetclothes",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if Bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if Bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Take your bag off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}