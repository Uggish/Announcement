QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('announce', function()
exports['qb-menu']:openMenu({
    {
        header = 'Notification to all!',
        txt = 'Click for more information.',
        icon = 'fas fa-envelope',
        params = {
            event = 'menu:client:AnnounceMentMenu',
            args = {
            }
        }
    }
    
})
end, "admin")

RegisterNetEvent('menu:client:AnnounceMent')
AddEventHandler('menu:client:AnnounceMent', function()
    TriggerEvent('chatMessage', '^2Admin-Team> ^0Server restarting soon!')
end)

RegisterNetEvent('menu:client:AnnounceMentMenu')
AddEventHandler('menu:client:AnnounceMentMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Notification to all!',
            txt = 'If you want to send out a message, press here.',
            icon = 'fas fa-envelope',
            params = {
                event = 'menu:client:AnnounceMent',
                args = {
                }
            }
        },
        {
            header = 'GO BACK!',
            icon = 'fas fa-arrow-left',
            params = {
                event = 'menu:client:AnnouncementCloseMenu',
                args = {
                }
            }
        }
    })
end)
    
RegisterNetEvent('menu:client:AnnouncementCloseMenu', function()
ExecuteCommand('announce')
end)

-- Uggish Resources!
-- Discord: https://discord.gg/BQr99Kh5TC (And if you want support? Sure, join discord and open ticket!)
-- Website: https://uggish-store.tebex.io/