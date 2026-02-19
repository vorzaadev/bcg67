debug.setmemorycategory("AutoclickHandler")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayersService = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local serverModulesFolder = ServerStorage.Server.Modules

local autoClickManager = require(serverModulesFolder.AutoClickManager)
local dataManager = require(serverModulesFolder.DataManager)
local clickCalculationManager = require(serverModulesFolder.ClickCalculationManager)

local autoClickEvent = ReplicatedStorage.Shared.Remotes.AutoClickEvent
local clickFXEvent = ReplicatedStorage.Shared.Remotes.ClickFXEvent
local dataUpdateBindable = ServerStorage.Server.BindableEvents.DataUpdateBindable


local function runAutoClicker(player, level)
    local userId = player.UserId
    while autoClickManager:IsAutoClicking(userId) do
        local data = autoClickManager:GetAutoClickData(userId)
        if not data or data.level ~= level then break end

        if not player.Parent then break end
        local baseAmount = 1
        local amountToGive = clickCalculationManager:Calculate(player, baseAmount)
        dataManager:AddCurrency(player, "Clicks", amountToGive)
        clickFXEvent:FireClient(player)
        task.wait(1 / data.rate)
    end
end

autoClickEvent.OnServerEvent:Connect(function(player, action)
    local userId = player.UserId

    if action == "start" then
        if autoClickManager:IsAutoClicking(userId) then return end

        local level = dataManager:GetUpgrade(player, "AutoClicker")
        if level >= 1 then
            if autoClickManager:StartAutoClick(userId, level) then
                task.spawn(runAutoClicker, player, level)
            else
                warn("[AutoClickHandler]: Player requested to autoclick, but does not have it unlocked")
            end
        end
    elseif action == "stop" then
        autoClickManager:StopAutoClick(userId)
    end
end)

PlayersService.PlayerRemoving:Connect(function(player)
    autoClickManager:StopAutoClick(player.UserId)
end)

dataUpdateBindable.Event:Connect(function(data, player, updatedCurrency)
    if updatedCurrency == "AutoClicker" then
        if autoClickManager:IsAutoClicking(player.UserId) then
            autoClickManager:StopAutoClick(player.UserId)
            local level = data.Upgrades.AutoClicker
            if autoClickManager:StartAutoClick(player.UserId, level) then
                task.spawn(runAutoClicker, player, level)
            end
        end
    end
end)