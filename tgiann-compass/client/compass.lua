local compassOn = false
local lastCompassHeading = "0"

RegisterNUICallback("uiReady", function()
    while true do
        Wait(1000)
        if NetworkIsSessionStarted() then
            showCompas()
            return
        end
    end
end)

function showCompas()
    if compassOn then return end
    compassOn = true
    SendNUIMessage({action = "open"})
    while compassOn do
        local camRot = GetGameplayCamRot(0)
        local heading = string.format("%.0f", (360.0 - ((camRot.z + 360.0) % 360.0)))
        if heading == '360' then heading = '0' end
        if lastCompassHeading ~= heading then
            SendNUIMessage({action = "update", heading = heading})
        end
        lastCompassHeading = heading
        Wait(20) -- recommended values 10-30
    end
    SendNUIMessage({action = "close"})
end