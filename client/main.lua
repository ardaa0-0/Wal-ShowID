if GetCurrentResourceName() ~= "wal-showid" then
    print("^1[Error] Script name must be 'wal-showid' to run!^7")
    return
end

local nearbyPlayers = {}
local playerCache = {}
local isKeyPressed = false
local isCommandActive = false
local isDisplayActive = false
local isNuiShowing = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('wal-showid:server:requestIdentity')
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    TriggerServerEvent('wal-showid:server:requestIdentity')
end)

local function TriggerPlayerScan()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local players = GetActivePlayers()
    local tempNearby = {}

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if DoesEntityExist(targetPed) then
            local isLocalPlayer = (targetPed == playerPed)
            if (isLocalPlayer and Config.ShowOwnID) or (not isLocalPlayer and IsEntityVisible(targetPed)) then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(playerCoords - targetCoords)

                if distance <= Config.CacheDistance then
                    table.insert(tempNearby, {
                        ped = targetPed,
                        serverId = GetPlayerServerId(player),
                        playerHandle = player,
                        distance = distance
                    })
                end
            end
        end
    end

    table.sort(tempNearby, function(a, b)
        return a.distance < b.distance
    end)

    if #tempNearby > Config.MaxDisplayedPlayers then
        local limitedNearby = {}
        for i = 1, Config.MaxDisplayedPlayers do
            table.insert(limitedNearby, tempNearby[i])
        end
        nearbyPlayers = limitedNearby
    else
        nearbyPlayers = tempNearby
    end
end

local function ToggleDisplay(state)
    if isDisplayActive == state then return end
    isDisplayActive = state
    if isDisplayActive then
        TriggerPlayerScan()
    else
        if isNuiShowing then
            SendNUIMessage({
                action = "hideAll"
            })
            isNuiShowing = false
        end
    end
end

RegisterCommand('+showid', function()
    isKeyPressed = true
    ToggleDisplay(true)
end, false)

RegisterCommand('-showid', function()
    isKeyPressed = false
    ToggleDisplay(isKeyPressed or isCommandActive)
end, false)

RegisterKeyMapping('+showid', 'Kafadaki Kimlikleri Goster (Hold)', 'keyboard', Config.DefaultKey)

RegisterCommand(Config.CommandName, function()
    if not isCommandActive then
        isCommandActive = true
        ToggleDisplay(true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.ToggleDuration)
            isCommandActive = false
            ToggleDisplay(isKeyPressed or isCommandActive)
        end)
    end
end, false)

Citizen.CreateThread(function()
    while true do
        if isDisplayActive then
            TriggerPlayerScan()
            
            local nowActiveIds = {}
            for _, p in ipairs(nearbyPlayers) do
                nowActiveIds[p.serverId] = true
            end
            for id, _ in pairs(playerCache) do
                if not nowActiveIds[id] then
                    playerCache[id] = nil
                end
            end
            
            Citizen.Wait(500)
        else
            nearbyPlayers = {}
            playerCache = {}
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if isDisplayActive then
            if #nearbyPlayers > 0 then
                local sendData = {}
                local now = GetGameTimer()

                for _, player in ipairs(nearbyPlayers) do
                    local targetPed = player.ped
                    if DoesEntityExist(targetPed) then
                        local dist = player.distance

                        if dist <= Config.DrawDistance then
                            local serverId = player.serverId

                            if not playerCache[serverId] then
                                playerCache[serverId] = {
                                    lastLosCheck = 0,
                                    hasLos = true,
                                    lastMaskCheck = 0,
                                    isMasked = false,
                                    lastStateCheck = 0,
                                    states = {},
                                    lastIdentityCheck = 0,
                                    name = "Civilian",
                                    job = "Civilian",
                                    jobGrade = "",
                                    jobName = "civilian",
                                    gang = "",
                                    gangName = "none",
                                    lastVoiceCheck = 0,
                                    voiceLevel = 2,
                                    lastTalkCheck = 0,
                                    isTalking = false,
                                    jobColor = "#dcdcdfff",
                                    jobGlow = "rgba(224, 224, 224, 0.2)",
                                    jobAlpha = "rgba(224, 224, 224, 0.05)",
                                    gangColor = "#dcdcdfff"
                                }
                            end
                            local cache = playerCache[serverId]

                            if now - cache.lastLosCheck > 250 then
                                local playerPed = PlayerPedId()
                                local isLocalPlayer = (targetPed == playerPed)
                                cache.hasLos = isLocalPlayer or HasEntityClearLosToEntity(playerPed, targetPed, 17)
                                cache.lastLosCheck = now
                            end

                            if cache.hasLos then
                                local headCoords = GetPedBoneCoords(targetPed, 31086, 0.0, 0.0, 0.0)
                                local aboveHeadCoords = headCoords + vector3(0.0, 0.0, 0.35)

                                local onScreen, screenX, screenY = World3dToScreen2d(aboveHeadCoords.x, aboveHeadCoords.y, aboveHeadCoords.z)

                                if onScreen then
                                    if now - cache.lastIdentityCheck > 1000 then
                                        local identity = Player(serverId).state.identityData
                                        local name = GetPlayerName(player.playerHandle) or "Civilian"
                                        local job = "Civilian"
                                        local jobGrade = "None"
                                        local jobName = "civilian"
                                        local gang = "None"
                                        local gangName = "none"

                                        if identity then
                                            name = identity.name or name
                                            job = identity.job or job
                                            jobGrade = identity.jobGrade or jobGrade
                                            jobName = identity.jobName or jobName
                                            gang = identity.gang or gang
                                            gangName = identity.gangName or gangName
                                        end

                                        cache.name = name
                                        cache.job = job
                                        cache.jobGrade = jobGrade
                                        cache.jobName = jobName
                                        cache.gang = gang
                                        cache.gangName = gangName

                                        local activeConfigName = "civilian"
                                        if Config.Jobs[jobName] and jobName ~= "civilian" then
                                            activeConfigName = jobName
                                        elseif Config.Jobs[gangName] and gangName ~= "none" then
                                            activeConfigName = gangName
                                        end

                                        local jobConfig = Config.Jobs[activeConfigName] or Config.Jobs["civilian"]
                                        cache.jobColor = jobConfig.color
                                        cache.jobGlow = jobConfig.glow
                                        cache.jobAlpha = jobConfig.glow and jobConfig.glow:gsub("0.4", "0.1") or "rgba(255, 255, 255, 0.05)"

                                        local gangConfig = Config.Jobs[gangName] or Config.Jobs["civilian"]
                                        cache.gangColor = gangConfig.color

                                        cache.lastIdentityCheck = now
                                    end

                                    if now - cache.lastMaskCheck > 1000 then
                                        cache.isMasked = Config.MaskCheck and (GetPedDrawableVariation(targetPed, 1) > 0)
                                        cache.lastMaskCheck = now
                                    end

                                    local displayName = cache.name
                                    local displayJob = cache.job
                                    local displayGrade = cache.jobGrade
                                    local displayJobColor = cache.jobColor
                                    local displayJobGlow = cache.jobGlow
                                    local displayJobAlpha = cache.jobAlpha
                                    local displayGang = cache.gang
                                    local displayGangColor = cache.gangColor

                                    if cache.isMasked then
                                        displayName = Config.MaskedName
                                        displayJob = Config.MaskedJob
                                        displayGrade = ""
                                        displayGang = ""
                                        
                                        local civConfig = Config.Jobs["civilian"]
                                        displayJobColor = civConfig.color
                                        displayJobGlow = civConfig.glow
                                        displayJobAlpha = civConfig.glow and civConfig.glow:gsub("0.4", "0.1") or "rgba(255, 255, 255, 0.05)"
                                        displayGangColor = civConfig.color
                                    end

                                    if now - cache.lastVoiceCheck > 500 then
                                        local voiceLevel = 2
                                        local proximity = Player(serverId).state.proximity
                                        if proximity then
                                            if type(proximity) == "table" then
                                                voiceLevel = proximity.index or voiceLevel
                                            elseif type(proximity) == "number" then
                                                if proximity <= Config.Voice.Levels[1].range then
                                                    voiceLevel = 1
                                                elseif proximity <= Config.Voice.Levels[2].range then
                                                    voiceLevel = 2
                                                else
                                                    voiceLevel = 3
                                                end
                                            end
                                        end
                                        cache.voiceLevel = voiceLevel
                                        cache.lastVoiceCheck = now
                                    end

                                    if now - cache.lastTalkCheck > 100 then
                                        cache.isTalking = MumbleIsPlayerTalking(player.playerHandle)
                                        cache.lastTalkCheck = now
                                    end

                                    if now - cache.lastStateCheck > 400 then
                                        local states = {}

                                        local isDead = IsPedDeadOrDying(targetPed, 1) or Player(serverId).state.isDead
                                        local health = GetEntityHealth(targetPed)

                                        if Config.States.Dead and Config.States.Dead.enable and isDead then
                                            table.insert(states, { name = "Dead", label = Config.States.Dead.label, icon = Config.States.Dead.icon, tooltip = Config.States.Dead.tooltip })
                                        elseif Config.States.Injured and Config.States.Injured.enable and health < 140 and not isDead then
                                            table.insert(states, { name = "Injured", label = Config.States.Injured.label, icon = Config.States.Injured.icon, tooltip = Config.States.Injured.tooltip })
                                        end

                                        local isCuffed = IsPedCuffed(targetPed) or Player(serverId).state.handcuffed or Player(serverId).state.isHandcuffed
                                        if Config.States.Handcuffed and Config.States.Handcuffed.enable and isCuffed then
                                            table.insert(states, { name = "Handcuffed", label = Config.States.Handcuffed.label, icon = Config.States.Handcuffed.icon, tooltip = Config.States.Handcuffed.tooltip })
                                        end

                                        cache.states = states
                                        cache.lastStateCheck = now
                                    end

                                    table.insert(sendData, {
                                        id = serverId,
                                        x = screenX,
                                        y = screenY,
                                        dist = dist,
                                        name = displayName,
                                        job = displayJob,
                                        jobGrade = displayGrade,
                                        jobColor = displayJobColor,
                                        jobGlow = displayJobGlow,
                                        jobAlpha = displayJobAlpha,
                                        gang = displayGang,
                                        gangColor = displayGangColor,
                                        voiceLevel = cache.voiceLevel,
                                        isTalking = cache.isTalking,
                                        states = cache.states
                                    })
                                end
                            end
                        end
                    end
                end

                if #sendData > 0 then
                    SendNUIMessage({
                        action = "update",
                        players = sendData
                    })
                    isNuiShowing = true
                else
                    if isNuiShowing then
                        SendNUIMessage({
                            action = "hideAll"
                        })
                        isNuiShowing = false
                    end
                end
            else
                if isNuiShowing then
                    SendNUIMessage({
                        action = "hideAll"
                    })
                    isNuiShowing = false
                end
            end

            Citizen.Wait(Config.UpdateInterval or 22)
        else
            if isNuiShowing then
                SendNUIMessage({
                    action = "hideAll"
                })
                isNuiShowing = false
            end
            Citizen.Wait(500)
        end
    end
end)