Config = {}

Config.targetType = 'ox_target' -- qtarget , bt-target , fivem-target
Config.WeatherSync = 'vsync' -- [easytime] == Codesign Easytime / [vsync] == vSync

Config.TPZones = {
    ['ems_1'] = {
        label = "Pillbox Ground Floor",
        icon = 'fas fa-helicopter',
        pos = vector4(355.64, -596.18, 28.77, 160.710),
        destination = 'ems_2',
        ShellWeatherSync = false,
    },
    ['ems_2'] = {
        label = "Pillbox Roof Helipad",
        icon = 'fas fa-hospital',
        pos = vector4(338.567, -583.7258, 74.16563, 70.43237),
        destination = 'ems_1',
        ShellWeatherSync = false,
    },
    ['morgue_outside'] = {
        label = "Morgue Outside",
        icon = 'fas fa-procedures',
        pos = vector4(294.1169, -1449.003, 29.96638, 141.4044),
        destination = 'morgue_inside',
        ShellWeatherSync = false,
    },
    ['morgue_inside'] = {
        label = "Morgue",
        icon = 'fas fa-procedures',
        pos = vector4(275.8083, -1361.463, 24.5378, 230.4762),
        destination = 'morgue_outside',
        ShellWeatherSync = false,
    },
    ['fbi_1'] = {
        label = "FBI",
        icon = 'fas fa-square-caret-up',
        pos = vector4(139.44, -764.04, 45.76, 170.4),
        destination = 'fbi_2',
        ShellWeatherSync = false,
    },
    ['fbi_2'] = {
        label = "FBI",
        icon = 'fas fa-square-caret-down',
        pos = vector4(136.68, -763.04, 242.16, 172.4),
        destination = 'fbi_1',
        ShellWeatherSync = false,
    },
    ['lux_outside'] = {
        label = "Interieur Lux",
        icon = 'fas fa-square-caret-up',
        pos = vector4(-816.92, -692.64, 28.08, 267.8),
        destination = 'lux_inside',
        ShellWeatherSync = false,
    },
    ['lux_inside'] = {
        label = "Exterieur Lux",
        icon = 'fas fa-square-caret-down',
        pos = vector4(-814.92, -682.44, 123.4, 277.04),
        destination = 'lux_outside',
        ShellWeatherSync = false,
    },
    
}