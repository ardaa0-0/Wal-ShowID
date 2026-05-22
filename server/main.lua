if GetCurrentResourceName() ~= "wal-showid" then
    print("^1[Error] Script name must be 'wal-showid' to run!^7")
    return
end

local Framework = nil
local QBCore = nil
local ESX = nil

Citizen.CreateThread(function()
    if Config.Framework == "auto" or Config.Framework == "qb" then
        if GetResourceState('qb-core') == 'started' then
            QBCore = exports['qb-core']:GetCoreObject()
            Framework = "qb"
            print("^2[wal-showid] QBCore otomatik olarak tespit edildi ve aktif edildi.^7")
        end
    end

    if not Framework and (Config.Framework == "auto" or Config.Framework == "esx") then
        if GetResourceState('es_extended') == 'started' then
            ESX = exports['es_extended']:getSharedObject()
            Framework = "esx"
            print("^2[wal-showid] ESX otomatik olarak tespit edildi ve aktif edildi.^7")
        end
    end

    if not Framework then
        Framework = "standalone"
        print("^3[wal-showid] Herhangi bir framework tespit edilemedi, Standalone modda calisiyor.^7")
    end
end)

local function updatePlayerIdentity(source)
    local identity = {
        name = GetPlayerName(source),
        job = "Civilian",
        jobGrade = "None",
        jobName = "civilian",
        gang = "None",
        gangName = "none"
    }

    if Framework == "qb" and QBCore then
        local player = QBCore.Functions.GetPlayer(source)
        if player then
            local charInfo = player.PlayerData.charinfo
            if charInfo then
                identity.name = charInfo.firstname .. " " .. charInfo.lastname
            end
            
            local job = player.PlayerData.job
            if job then
                identity.job = job.label or "Civilian"
                identity.jobGrade = (job.grade and job.grade.name) or "None"
                identity.jobName = job.name or "civilian"
            end

            local gang = player.PlayerData.gang
            if gang and gang.name ~= "none" then
                identity.gang = gang.label or "None"
                identity.gangName = gang.name or "none"
            end
        end
    elseif Framework == "esx" and ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            if xPlayer.getName then
                identity.name = xPlayer.getName()
            end
            
            local job = xPlayer.getJob() or xPlayer.job
            if job then
                identity.job = job.label or "Civilian"
                identity.jobGrade = job.grade_label or "None"
                identity.jobName = job.name or "civilian"
            end

            local secondaryJob = xPlayer.getSecondaryJob and xPlayer.getSecondaryJob()
            if secondaryJob and secondaryJob.name ~= "unemployed" then
                identity.gang = secondaryJob.label or "None"
                identity.gangName = secondaryJob.name or "none"
            end
        end
    end

    Player(source).state:set('identityData', identity, true)
end

RegisterNetEvent('QBCore:Server:PlayerLoaded', function(player)
    if player then
        updatePlayerIdentity(player.PlayerData.source)
    end
end)

RegisterNetEvent('QBCore:Server:OnJobUpdate', function(source, job)
    updatePlayerIdentity(source)
end)

RegisterNetEvent('QBCore:Server:OnGangUpdate', function(source, gang)
    updatePlayerIdentity(source)
end)

RegisterNetEvent('esx:playerLoaded', function(playerId, xPlayer)
    updatePlayerIdentity(playerId)
end)

RegisterNetEvent('esx:setJob', function(playerId, job)
    updatePlayerIdentity(playerId)
end)

RegisterNetEvent('wal-showid:server:requestIdentity', function()
    local src = source
    updatePlayerIdentity(src)
end)

AddEventHandler('playerConnecting', function()
    local src = source
    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        updatePlayerIdentity(src)
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    Citizen.Wait(1000)
    local players = GetPlayers()
    for _, playerId in ipairs(players) do
        updatePlayerIdentity(tonumber(playerId))
    end
end)