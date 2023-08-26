Config = {}

Config.Debug = false

Config.ClothingCost = 100
Config.BarberCost = 100
Config.TattooCost = 100
Config.SurgeonCost = 100

Config.ChargePerTattoo = true -- Charge players per tattoo. Config.TattooCost will become the cost of 1 tattoo. The cost can be overridden by adding `cost` key in shared/tattoos.lua for specific tattoos

-- Only set this to true if you're using rcore_tattoos
Config.RCoreTattoosCompatibility = false

Config.AsynchronousLoading = false -- Change this to false if you want the NUI data to load before displaying the appearance UI

Config.UseTarget = true

Config.TextUIOptions = {
    position = "left-center"
}

Config.NotifyOptions = {
    position = "top-right"
}

Config.OutfitCodeLength = 10

Config.UseRadialMenu = false
Config.UseOxRadial = false -- Set to true to use ox_lib radial menu, both this and UseRadialMenu must be true 

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "group.admin"

Config.EnableJobOutfitsCommand = false -- Enables /joboutfits and /gangoutfits commands

Config.ShowNearestShopOnly = false
Config.HideRadar = false -- Hides the minimap while the appearance menu is open
Config.NearestShopBlipUpdateDelay = 10000

Config.InvincibleDuringCustomization = true

Config.PreventTrackerRemoval = true -- Disables "Scarf and Chains" section if the player has tracker
Config.TrackerClothingOptions = {
    drawable = 13,
    texture = 0
}

Config.NewCharacterSections = {
    Ped = true,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = true -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

Config.AutomaticFade = false -- Enables automatic fading and hides the Fade section from Hair

-- ACE Permissions Config
Config.EnableACEPermissions = false
Config.ACEResetCooldown = 5000
Config.ACEListCooldown = 60 * 60 * 1000 -- 1 Hour

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Clothing Store",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    }
    --[[["surgeon"] = {
        Show = true,
        Sprite = 102,
        Color = 4,
        Scale = 0.7,
        Name = "Plastic Surgeon",
    }]]
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Clothing Store",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Barber Shop",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    --[[["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scalpel",
        label = "Open Surgeon",
        distance = 3
    },]]
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Job / Gang Clothes Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
-- Boutique 1
    {
        type = "clothing",
        coords = vector4(1693.2, 4828.11, 42.04, 188.66),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = true, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.06),
            vector3(1698.8566894531, 4831.4604492188, 42.06),
            vector3(1700.2448730469, 4817.7734375, 42.06),
            vector3(1688.3682861328, 4816.2954101562, 42.06)
        }
    },
-- Boutique 2
    {
        type = "clothing",
        coords = vector4(-714.69, -147.43, 37.42, 124.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-719.86212158203, -147.83151245117, 37.42),
            vector3(-709.10491943359, -141.53076171875, 37.42),
            vector3(-699.94342041016, -157.44494628906, 37.42),
            vector3(-710.68774414062, -163.64665222168, 37.42)
        }
    },
-- Boutique 3
    {
        type = "clothing",
        coords = vector4(-1186.82, -767.90, 17.33, 121.85),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1206.9552001953, -775.06304931641, 17.32),
            vector3(-1190.6080322266, -764.03198242188, 17.32),
            vector3(-1184.5672607422, -772.16949462891, 17.32),
            vector3(-1199.24609375, -783.07928466797, 17.32)
        }
    },
-- Boutique 4
    {
        type = "clothing",
        coords = vector4(425.91, -801.03, 29.49, 177.79),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(419.55020141602, -798.36547851562, 29.49),
            vector3(431.61773681641, -798.31909179688, 29.49),
            vector3(431.19784545898, -812.07122802734, 29.49),
            vector3(419.140625, -812.03594970703, 29.49)
        }
    },
-- Boutique 5
    {
        type = "clothing",
        coords = vector4(-164.89, -310.37, 39.73, 252.46),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-160.82145690918, -313.85919189453, 39.73),
            vector3(-172.56513977051, -309.82858276367, 39.73),
            vector3(-166.5775604248, -292.48077392578, 39.73),
            vector3(-154.84906005859, -296.51647949219, 39.73)
        }
    },
-- Boutique 6
    {
        type = "clothing",
        coords = vector4(75.39, -1398.28, 29.38, 6.73),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(81.406135559082, -1400.7791748047, 29.38),
            vector3(69.335029602051, -1400.8251953125, 29.38),
            vector3(69.754981994629, -1387.078125, 29.38),
            vector3(81.500122070312, -1387.3002929688, 29.38)
        }
    },
-- Boutique 7
    {
        type = "clothing",
        coords = vector4(-827.39, -1075.93, 11.33, 294.31),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-826.26251220703, -1082.6293945312, 11.33),
            vector3(-832.27856445312, -1072.2819824219, 11.33),
            vector3(-820.16442871094, -1065.7727050781, 11.33),
            vector3(-814.08953857422, -1076.1878662109, 11.33)
        }
    },
-- Boutique 8
    {
        type = "clothing",
        coords = vector4(-1445.86, -231.13, 49.81, 52.34),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1448.4829101562, -226.39401245117, 49.82),
            vector3(-1439.2475585938, -234.70428466797, 49.82),
            vector3(-1451.5389404297, -248.33193969727, 49.82),
            vector3(-1460.7554931641, -240.02815246582, 49.82)
        }
    },
-- Boutique 9
    {
        type = "clothing",
        coords = vector4(9.22, 6515.74, 31.88, 131.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(6.4955291748047, 6522.205078125, 31.88),
            vector3(14.737417221069, 6513.3872070312, 31.88),
            vector3(4.3691010475159, 6504.3452148438, 31.88),
            vector3(-3.5187695026398, 6513.1538085938, 31.88)
        }
    },
-- Boutique 10
    {
        type = "clothing",
        coords = vector4(617.62, 2768.44, 42.09, 187.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(612.58312988281, 2747.2814941406, 42.09),
            vector3(612.26214599609, 2767.0520019531, 42.09),
            vector3(622.37548828125, 2767.7614746094, 42.09),
            vector3(623.66833496094, 2749.5180664062, 42.09)
        }
    },
-- Boutique 11
    {
        type = "clothing",
        coords = vector4(1191.61, 2710.91, 38.22, 269.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1188.7923583984, 2704.2021484375, 38.22),
            vector3(1188.7498779297, 2716.2661132812, 38.22),
            vector3(1202.4979248047, 2715.8479003906, 38.22),
            vector3(1202.3558349609, 2703.9294433594, 38.22)
        }
    },
-- Boutique 12
    {
        type = "clothing",
        coords = vector4(-3176.18, 1040.29, 20.86, 328.10),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3162.0075683594, 1056.7303466797, 20.86),
            vector3(-3170.8247070312, 1039.0412597656, 20.86),
            vector3(-3180.0979003906, 1043.1201171875, 20.86),
            vector3(-3172.7292480469, 1059.8623046875, 20.86)
        }
    },
-- Boutique 13
    {
        type = "clothing",
        coords = vector4(-1105.52, 2707.79, 19.11, 317.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
-- Boutique 14
    {
        type = "clothing",
        coords = vector4(120.41, -227.60, 54.56, 335.14),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    {
        type = "barber",
        coords = vector4(-814.22, -183.7, 37.57, 116.91),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {
        type = "barber",
        coords = vector4(136.78, -1708.4, 29.29, 144.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(132.57008361816, -1710.5053710938, 29.29),
            vector3(138.77899169922, -1702.6778564453, 29.29),
            vector3(142.73052978516, -1705.6853027344, 29.29),
            vector3(135.49719238281, -1712.9750976562, 29.29)
        }
    },
    {
        type = "barber",
        coords = vector4(-1282.57, -1116.84, 6.99, 89.25),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1287.4735107422, -1115.4364013672, 6.99),
            vector3(-1277.5638427734, -1115.1229248047, 6.99),
            vector3(-1277.2469482422, -1120.1147460938, 6.99),
            vector3(-1287.4561767578, -1119.2506103516, 6.99)
        }
    },
    {
        type = "barber",
        coords = vector4(1931.41, 3729.73, 32.84, 212.08),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1932.4931640625, 3725.3374023438, 32.84),
            vector3(1927.2720947266, 3733.7663574219, 32.84),
            vector3(1931.4379882812, 3736.5327148438, 32.84),
            vector3(1936.0697021484, 3727.2839355469, 32.84)
        }
    },
    {
        type = "barber",
        coords = vector4(1213.31, -473.05, 66.21, 75.78),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1208.3327636719, -469.84338378906, 65.2),
            vector3(1217.9066162109, -472.40216064453, 65.2),
            vector3(1216.9870605469, -477.00939941406, 65.2),
            vector3(1206.1077880859, -473.83499145508, 65.2)
        }
    },
    {
        type = "barber",
        coords = vector4(-33.02, -152.81, 57.08, 346.63),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-29.730783462524, -148.67495727539, 56.1),
            vector3(-32.919719696045, -158.04254150391, 56.1),
            vector3(-37.612594604492, -156.62759399414, 56.1),
            vector3(-33.30192565918, -147.31649780273, 56.1)
        }
    },
    {
        type = "barber",
        coords = vector4(-277.62, 6228.15, 31.70, 53.84),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-280.29818725586, 6232.7265625, 30.7),
            vector3(-273.06427001953, 6225.9692382812, 30.7),
            vector3(-276.25280761719, 6222.4013671875, 30.7),
            vector3(-282.98211669922, 6230.015625, 30.7)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1321.15, -1653.23, 52.28, 312.55),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1323.9360351562, -1649.2370605469, 51.2),
            vector3(1328.0186767578, -1654.3087158203, 51.2),
            vector3(1322.5780029297, -1657.7045898438, 51.2),
            vector3(1319.2043457031, -1653.0885009766, 51.2)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-1156.09, -1426.55, 4.95, 300.42),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1152.7110595703, -1422.8382568359, 4.95),
            vector3(-1149.0043945312, -1428.1975097656, 4.95),
            vector3(-1154.6730957031, -1431.1898193359, 4.95),
            vector3(-1157.7064208984, -1426.3433837891, 4.95)
        }
    },
    {
        type = "tattoo",
        coords = vector4(324.44, 179.27, 103.59, 66.75),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(319.28741455078, 179.9383392334, 103.59),
            vector3(321.537109375, 186.04516601562, 103.59),
            vector3(327.24526977539, 183.12303161621, 103.59),
            vector3(325.01351928711, 177.8542175293, 103.59)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-3168.63, 1077.36, 20.83, 154.57),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3169.5861816406, 1072.3740234375, 20.83),
            vector3(-3175.4802246094, 1075.0703125, 20.83),
            vector3(-3172.2041015625, 1080.5860595703, 20.83),
            vector3(-3167.076171875, 1078.0391845703, 20.83)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1864.1, 3747.91, 33.03, 17.23),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1860.2752685547, 3750.1608886719, 33.03),
            vector3(1866.390625, 3752.8081054688, 33.03),
            vector3(1868.6164550781, 3747.3562011719, 33.03),
            vector3(1863.65234375, 3744.5034179688, 33.03)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-294.24, 6200.12, 31.49, 195.72),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-289.42239379883, 6198.68359375, 31.49),
            vector3(-294.69515991211, 6194.5366210938, 31.49),
            vector3(-298.23013305664, 6199.2451171875, 31.49),
            vector3(-294.1501159668, 6203.2700195312, 31.49)
        }
    }
    --[[{
        type = "surgeon",
        coords = vector4(298.78, -572.81, 43.26, 114.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(298.84417724609, -572.92205810547, 43.26),
            vector3(296.39556884766, -575.65942382812, 43.26),
            vector3(293.56317138672, -572.60675048828, 43.26),
            vector3(296.28656005859, -570.330078125, 43.26)
        }
    }]]
}


Config.ClothingRooms = {
    {
        job = "police",
        coords = vector4(454.91, -990.89, 30.69, 193.4),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(460.41918945312, -993.11444091797, 30.69),
            vector3(449.39508056641, -993.60614013672, 30.69),
            vector3(449.88696289062, -990.23779296875, 30.69),
            vector3(450.97882080078, -989.71411132812, 30.69),
            vector3(451.0325012207, -987.89904785156, 30.69),
            vector3(453.47863769531, -987.76928710938, 30.69),
            vector3(454.35513305664, -988.46459960938, 30.69),
            vector3(460.4231262207, -987.94573974609, 30.69)
        }
    },
	{
        job = "taxi",
        coords = vector4(897.44, -162.66, 81.60, 331.22),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(897.44, -162.66, 81.60)
        }
    },
    {
        job = "ambulance",
        coords = vector4(266.91, -1362.16, 24.54, 232.05),
        size = vector3(4, 4, 4),
        rotation = 232,
        usePoly = false,
        points = {
            vector3(266.91, -1362.16, 24.54)
        }
    },
    {
        job = "nightclub",
        coords = vector4(104.85, -1303.51, 28.77, 297.54),
        size = vector3(4, 4, 4),
        rotation = 300,
        usePoly = false,
        points = {
            vector3(104.85, -1303.51, 28.77)
        }
    }
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[    {
        job = "police",
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(284.83, -574.01, 43.16),
            vector3(286.33, -570.03, 43.16),
            vector3(290.33, -571.74, 43.16),
            vector3(289.0, -574.75, 43.16)
        },
        citizenIDs = {
            "BHH65156"
        }
    }]]--
}


Config.Outfits = {
    ["police"] = {
        ["Male"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 19, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 55, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 3}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 8}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 3}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 130, texture = 1}, -- Pants
                    ["arms"] = {item = 172, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T Shirt
                    ["vest"] = {item = 15, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 336, texture = 3}, -- Jacket
                    ["shoes"] = {item = 24, texture = 0}, -- Shoes
                    ["accessory"] = {item = 133, texture = 0}, -- Neck Accessory
                    ["hat"] = {item = 150, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 52, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 48, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 3}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 135, texture = 1}, -- Pants
                    ["arms"] = {item = 213, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 149, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 35, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        }
    },
    ["taxi"] = {
        ["Male"] = {
            {
                -- Outfits
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        }
    },
    ["ambulance"] = {
        ["Male"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 85, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 129, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 250, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 58, texture = 0}, -- Decals
                    ["accessory"] = {item = 127, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 90, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 249, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 57, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 93, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 32, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 31, texture = 7}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 28, texture = 0}, -- Pants
                    ["shoes"] = {item = 10, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 109, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 159, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 258, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 66, texture = 0}, -- Decals
                    ["accessory"] = {item = 97, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 13, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 257, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 65, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 39, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 7, texture = 1}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 34, texture = 0}, -- Pants
                    ["shoes"] = {item = 29, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        }
    },
    ["nightclub"] = {
        ["Male"] = {
            {
                -- Outfits
                name = "Barman",
                outfitData = {
                    ["pants"]       = { item = 28, texture = 2},  -- Pants
                    ["arms"]        = { item = 40, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 40, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 38, texture = 4},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_1",
                outfitData = {
                    ["pants"]       = { item = 61, texture = 9},  -- Pants
                    ["arms"]        = { item = 40, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 16, texture = 9},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_2",
                outfitData = {
                    ["pants"]       = { item = 4, texture = 0},  -- Pants
                    ["arms"]        = { item = 14, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 62, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 34, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_3",
                outfitData = {
                    ["pants"]       = { item = 4, texture = 0},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 34, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_4",
                outfitData = {
                    ["pants"]       = { item = 61, texture = 5},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 34, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_5",
                outfitData = {
                    ["pants"]       = { item = 15, texture = 0},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 34, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_6",
                outfitData = {
                    ["pants"]       = { item = 81, texture = 0},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 34, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_7",
                outfitData = {
                    ["pants"]       = { item = 61, texture = 9},  -- Pants
                    ["arms"]        = { item = 40, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 16, texture = 9},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 118, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            }
        },
        ["Female"] = {
            {
                name = "Barman",
                outfitData = {
                    ["pants"]       = { item = 44, texture = 4},  -- Pants
                    ["arms"]        = { item = 5, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 8, texture = 2},  -- Jacket
                    ["shoes"]       = { item = 0, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 2},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
			{
                name = "Danceur/se_1",
                outfitData = {
                    ["pants"]       = { item = 22, texture = 0},  -- Pants
                    ["arms"]        = { item = 4, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 22, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 18, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 61, texture = 1},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_2",
                outfitData = {
                    ["pants"]       = { item = 20, texture = 2},  -- Pants
                    ["arms"]        = { item = 4, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 22, texture = 2},  -- Jacket
                    ["shoes"]       = { item = 18, texture = 2},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_3",
                outfitData = {
                    ["pants"]       = { item = 19, texture = 1},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 2},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 22, texture = 1},  -- Jacket
                    ["shoes"]       = { item = 19, texture = 3},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_4",
                outfitData = {
                    ["pants"]       = { item = 63, texture = 11},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 82, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 41, texture = 11},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0,1,2,3},
            },
            {
                name = "Danceur/se_5",
                outfitData = {
                    ["pants"]       = { item = 63, texture = 2},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 15, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 41, texture = 2},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_6",
                outfitData = {
                    ["pants"]       = { item = 63, texture = 10},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 18, texture = 3},  -- Jacket
                    ["shoes"]       = { item = 41, texture = 10},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            },
            {
                name = "Danceur/se_7",
                outfitData = {
                    ["pants"]       = { item = 63, texture = 6},  -- Pants
                    ["arms"]        = { item = 15, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 111, texture = 6},  -- Jacket
                    ["shoes"]       = { item = 41, texture = 6},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    ["chain_1"]     = { item = 0, texture = 0},  -- Chain
                },
                grades = {0, 1, 2, 3},
            }
        }
    },
}

Config.InitialPlayerClothes = {
    Male = {
        Model = "mp_m_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    },
    Female = {
        Model = "mp_f_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    }
}
