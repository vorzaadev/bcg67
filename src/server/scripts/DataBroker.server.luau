debug.setmemorycategory("DataBroker")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local remotesFolder = ReplicatedStorage.Shared.Remotes
local serverFolder = ServerStorage.Server

local remoteDataFunction = remotesFolder.RetrieveData
local dataUpdateBindable = serverFolder.BindableEvents.DataUpdateBindable
local dataUpdateEvent = remotesFolder.DataUpdateEvent

local dataManager = require(serverFolder.Modules.DataManager)

dataUpdateBindable.Event:Connect(function(data, player, updatedCurrency, type)
    dataUpdateEvent:FireClient(player, data, updatedCurrency, type)
end)

remoteDataFunction.OnServerInvoke = function(player, dataType, key)
    print(`[DataBroker]: Data requested by {player}, type {dataType}, key {key}`)
    if key ~= nil then
        if dataType == "Upgrade" then
            return dataManager:GetUpgrade(player, key)
        else
            return dataManager:RetrieveAmount(player, dataType)
        end
    else
        return dataManager:RetrieveAmount(player, dataType)
    end
end