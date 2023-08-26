ESX = exports["es_extended"]:getSharedObject()

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'nightclub', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'nightclub', _U('nightclub_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'nightclub', 'Nightclub', 'society_nightclub', 'society_nightclub', 'society_nightclub', {type = 'private'})