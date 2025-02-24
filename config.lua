Config = {}

Config.defaultlang = "de_lang"


-- Webhook Settings

Config.UseWebhook = true

Config.WHTitle = 'Klingel: '
Config.WHLink = ''  -- Discord WH link Here
Config.WHColor = 16711680 -- red
Config.WHName = 'Klingel: ' -- name
Config.WHLogo = 'https://i.postimg.cc/90CyL4K5/Bell.png' -- must be 30x30px
Config.WHFooterLogo = 'https://i.postimg.cc/90CyL4K5/Bell.png' -- must be 30x30px
Config.WHAvatar = 'https://i.postimg.cc/90CyL4K5/Bell.png' -- must be 30x30px


-- Script Settings
-------------------------------------------------------------------------------------------
-- SPAM PROTECTION SETTINGS
-- In that Case you can Ring 5 Times in 15 minutes Before you get Blocked for 5 Minutes.
-- To Disable Spam Protection Just Set the SpamProtect to 1000 oder Reset Counter to 1
-- 
Config.ResetBellCounter = 15 -- Time in Min To Auto Reset the Ring Counter                                                  
Config.SpamProtect = 5 -- Spam Protect After 5 Rings How Often you can Ring before Blocked
Config.ProtectionTime = 5 -- Time in Min the Bell get Blocked for Spamming
--
-------------------------------------------------------------------------------------------
Config.Bells = {
    {
        Name = 'Blackwater Office Klingel',
        Location = vector3(-756.44, -1270.84, 44.15),
        ShowBlip = true,
        BlipSprite = 'blip_radar_edge_pointer',
        Show3DText = true,
        Text3D = 'Blackwater Office Klingel',
        BellType = 1, -- 1 = JobAlert | 2 = Group Alert
        JobsToAlert = { -- All This Jobs Get the Notification ( All Online Users )
            { Job = 'Marshall' },
            { Job = 'Police' },
            { Job = 'BWPolice' },
        },
        GroupsToAlert = {
            { Group = 'admin' },
            { Group = 'moderator' },
            { Group = 'supporter' },
        },
        ResetBelltime = 15, -- Time in Seconds
        AlertText = 'Jemand Klingelt: Blackwater Office',
        VorpDutySystem = true, -- Now Supports Every Script that Uses VORPOnDuty Statebag System
    },
    {
        Name = 'Blackwater Port Klingel',
        Location = vector3(-741.57, -1272.35, 43.72),
        ShowBlip = true,
        BlipSprite = 'blip_radar_edge_pointer',
        Show3DText = true,
        Text3D = 'Blackwater Port Klingel',
        BellType = 1, -- 1 = JobAlert | 2 = Group Alert
        JobsToAlert = { -- All This Jobs Get the Notification ( All Online Users )
            { Job = 'Marshall' },
            { Job = 'Police' },
            { Job = 'Sheriff' },
        },
        GroupsToAlert = {
            { Group = 'admin' },
            { Group = 'moderator' },
            { Group = 'supporter' },
        },
        ResetBelltime = 15, -- Time in Seconds
        AlertText = 'Jemand Klingelt: Blackwater Port',
        VorpDutySystem = true, -- Now Supports Every Script that Uses VORPOnDuty Statebag System
    },
}