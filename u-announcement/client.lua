QBCore = exports['qb-core']:GetCoreObject()


    -- QB
    if Config.UseQBCoreMenu then
        RegisterCommand('announce', function()
            exports['qb-menu']:openMenu({
                {
                    header = 'Notification to all!',
                    txt = 'Click for more information.',
                    icon = 'fas fa-envelope',
                    params = {
                        event = 'menu:client:AnnounceMentMenu',
                        args = {}
                    }
                }
            })
        end)
    
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
                        args = {}
                    }
                },
                {
                    header = 'GO BACK!',
                    icon = 'fas fa-arrow-left',
                    params = {
                        event = 'menu:client:AnnouncementCloseMenu',
                        args = {}
                    }
                }
            })
        end)
    
        RegisterNetEvent('menu:client:AnnouncementCloseMenu', function()
            ExecuteCommand('announce')
        end)
    end
    
    -- OX
    if not Config.UseQBCoreMenu then
        lib.registerContext({
            id = 'some_menu',
            title = 'Message',
            options = {
                {
                    title = 'Notification to all!',
                    description = 'Click for more information.',
                    icon = 'user',
                    event = 'ox-menu:client:AnnounceMentMenu',
                    arrow = true,
                    args = {}
                }
            }
        })
    
        RegisterCommand('announce', function()
            lib.showContext('some_menu')
        end)
    
        RegisterNetEvent('ox-menu:client:AnnounceMentMenu', function(args)
            lib.registerContext({
                id = 'event_menu',
                title = 'Message',
                menu = 'some_menu',
                options = {
                    {
                        title = 'Notification to all!',
                        description = 'If you want to send out a message, press here.',
                        icon = 'envelope',
                        event = 'menu:client:AnnounceMent',
                        arrow = true, 
                        args = {}
                    }
                }
            })
    
            lib.showContext('event_menu')
        end)
    end
