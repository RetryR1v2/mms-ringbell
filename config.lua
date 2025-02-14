Config = {}

Config.defaultlang = "de_lang"

-- Script Settings

Config.Bells = {
    {
        Name = 'Blackwater Office Klingel',
        Location = vector3(-756.44, -1270.84, 44.15),
        ShowBlip = true,
        BlipSprite = 'blip_radar_edge_pointer',
        Show3DText = true,
        Text3D = 'Blackwater Office Klingel',
        JobsToAlert = { -- All This Jobs Get the Notification ( All Online Users )
            { Job = 'Marshall' },
            { Job = 'Police' },
            { Job = 'Sheriff' },
        },
        ResetBelltime = 15, -- Time in Seconds
        AlertText = 'Jemand Klingelt: Blackwater Office',
    },
    {
        Name = 'Blackwater Port Klingel',
        Location = vector3(-741.57, -1272.35, 43.72),
        ShowBlip = true,
        BlipSprite = 'blip_radar_edge_pointer',
        Show3DText = true,
        Text3D = 'Blackwater Port Klingel',
        JobsToAlert = { -- All This Jobs Get the Notification ( All Online Users )
            { Job = 'schmied1' },
            { Job = 'Police' },
            { Job = 'Sheriff' },
        },
        ResetBelltime = 15, -- Time in Seconds
        AlertText = 'Jemand Klingelt: Blackwater Port',
    },
}