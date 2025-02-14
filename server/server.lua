local VORPcore = exports.vorp_core:GetCore()
local JobOnline = 0

RegisterServerEvent('mms-ringbell:server:RingBell',function(CurrentBell)
    local src = source

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
        JobOnline = 0
    else
        VORPcore.NotifyTip(src,_U('SeemsLikeNoOneisThere'),5000)
    end
end)