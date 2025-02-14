local VORPcore = exports.vorp_core:GetCore()
local BccUtils = exports['bcc-utils'].initiate()
local progressbar = exports.vorp_progressbar:initiate()


BellBlips = {}
Cooldown = 0

Citizen.CreateThread(function()
    local RingBellGroup = BccUtils.Prompts:SetupPromptGroup()
    local RingBell = RingBellGroup:RegisterPrompt(_U('RingBell'), 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = 'SHORT_TIMED_EVENT'}) -- KEY G

        for h,v in pairs(Config.Bells) do
            if v.ShowBlip then
                local BellBlip = BccUtils.Blips:SetBlip(v.Name, v.BlipSprite, 2.0, v.Location.x,v.Location.y,v.Location.z)
                BellBlips[#BellBlips + 1] = BellBlip
            end
        end


    while true do
        Wait(3)
        for h,v in pairs(Config.Bells) do
            local MyCoords = GetEntityCoords(PlayerPedId())
            local Distance = #( MyCoords - v.Location )
            if Distance < 2.5 then
                -- 3D text
                if v.Show3DText and Cooldown <= 0 then
                    BccUtils.Misc.DrawText3D(v.Location.x, v.Location.y, v.Location.z, v.Text3D)
                elseif v.Show3DText and Cooldown > 0 then
                    local Round = math.floor(Cooldown / 1000)
                    print(Round)
                    BccUtils.Misc.DrawText3D(v.Location.x, v.Location.y, v.Location.z, _U('PleaseWait') .. Round .. _U('Sec'))
                end

                -- Prompts
                RingBellGroup:ShowGroup(_U('RingBell'))

                if RingBell:HasCompleted() then
                    if Cooldown <= 0 then
                        TriggerServerEvent('mms-ringbell:server:RingBell',Config.Bells[h])
                        TriggerEvent('mms-ringbell:client:BellCooldown',v.ResetBelltime * 1000)
                    else
                        VORPcore.NotifyTip(_U('AlreadyRingedTheBell'),5000)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('mms-ringbell:client:BellCooldown')
AddEventHandler('mms-ringbell:client:BellCooldown',function(ResetTime)
    Cooldown = ResetTime
    while Cooldown > 0 do
        Citizen.Wait(1000)
        Cooldown = Cooldown - 1000
    end
end)


----------------- Utilities -----------------


------ Progressbar

function Progressbar(Time,Text)
    progressbar.start(Text, Time, function ()
    end, 'linear')
    Wait(Time)
    ClearPedTasks(PlayerPedId())
end

------ Animation

function CrouchAnim()
    local dict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TaskPlayAnim(ped, dict, "inspectfloor_player", 0.5, 8.0, -1, 1, 0, false, false, false)
end

---- CleanUp on Resource Restart 

RegisterNetEvent('onResourceStop',function(resource)
    if resource == GetCurrentResourceName() then
        for _, blip in ipairs(BellBlips) do
            blip:Remove()
        end
    end
end)