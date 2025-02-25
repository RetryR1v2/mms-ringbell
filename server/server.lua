local VORPcore = exports.vorp_core:GetCore()
local JobOnline = 0
local GroupOnline = 0

RegisterServerEvent('mms-ringbell:server:RingBell',function(CurrentBell)
    local src = source
    local SourceCharacter = VORPcore.getUser(src).getUsedCharacter
    local SourceSteamID = SourceCharacter.identifier
    local SourceName = SourceCharacter.firstname .. ' ' .. SourceCharacter.lastname
    local SourceCharID = SourceCharacter.charIdentifier
    if CurrentBell.BellType == 1 then
        if CurrentBell.VorpDutySystem then
            for _, player in ipairs(GetPlayers()) do
                if #GetPlayers() ~= nil then
                    local Character = VORPcore.getUser(player).getUsedCharacter
                    local Job = Character.job
                    for h,v in ipairs(CurrentBell.JobsToAlert) do
                        if v.Job == Job then
                            local DutyStatus = Player(player).state.isPoliceDuty
                            if DutyStatus ~= nil then
                                VORPcore.NotifyCenter(player, CurrentBell.AlertText, 5000)
                                JobOnline = JobOnline + 1
                            end
                        end
                    end
                end
            end
            if JobOnline > 0 then
                VORPcore.NotifyTip(src,_U('SomeoneWasCalled'),5000)
                if Config.UseWebhook then
                    VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                end
                JobOnline = 0
            else
                if CurrentBell.SayNoOneThere then
                    if Config.UseWebhook then
                        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name .. _U('WHNoOneOnline'), Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                    end
                    VORPcore.NotifyTip(src,_U('SeemsLikeNoOneisThere'),5000)
                end
            end
        else
            for _, player in ipairs(GetPlayers()) do
                if #GetPlayers() ~= nil then
                    local Character = VORPcore.getUser(player).getUsedCharacter
                    local Job = Character.job
                    for h,v in ipairs(CurrentBell.JobsToAlert) do
                        if v.Job == Job then
                            JobOnline = JobOnline + 1
                            VORPcore.NotifyCenter(player, CurrentBell.AlertText, 5000)
                        end
                    end
                end
            end
            if JobOnline > 0 then
                VORPcore.NotifyTip(src,_U('SomeoneWasCalled'),5000)
                if Config.UseWebhook then
                    VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                end
                JobOnline = 0
            else
                if CurrentBell.SayNoOneThere then
                    if Config.UseWebhook then
                        VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name .. _U('WHNoOneOnline'), Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                    end
                    VORPcore.NotifyTip(src,_U('SeemsLikeNoOneisThere'),5000)
                end
            end
        end
    elseif CurrentBell.BellType == 2 then
        for _, player in ipairs(GetPlayers()) do
            if #GetPlayers() ~= nil then
                local Character = VORPcore.getUser(player).getUsedCharacter
                local Group = Character.group
                for h,v in ipairs(CurrentBell.GroupsToAlert) do
                    if v.Group == Group then
                        GroupOnline = GroupOnline + 1
                        VORPcore.NotifyCenter(player, CurrentBell.AlertText, 5000)
                    end
                end
            end
        end
        if GroupOnline > 0 then
            VORPcore.NotifyTip(src,_U('SomeoneWasCalledGroup'),5000)
            if Config.UseWebhook then
                VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name, Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
            end
            GroupOnline = 0
        else
            if CurrentBell.SayNoOneThere then
                if Config.UseWebhook then
                    VORPcore.AddWebhook(Config.WHTitle, Config.WHLink,_U('WHPlayer') .. SourceName .. _U('WHSteam') .. SourceSteamID .. _U('WHCharID') .. SourceCharID .. _U('WHRingsBy') .. CurrentBell.Name .. _U('WHNoOneOnline'), Config.WHColor, Config.WHName, Config.WHLogo, Config.WHFooterLogo, Config.WHAvatar)
                end
                VORPcore.NotifyTip(src,_U('SeemsLikeNoOneisThereGroup'),5000)
            end
        end
    end
end)