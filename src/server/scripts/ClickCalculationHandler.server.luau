debug.setmemorycategory("ClickCalculationHandler")

local ServerStorage = game:GetService("ServerStorage")
local PlayersService = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local serverFolder = ServerStorage.Server
local clickCalculationManager = require(serverFolder.Modules.ClickCalculationManager)
local multiplierConfig = require(serverFolder.Modules.MultiplierConfig)

local dataInitBindable = serverFolder.BindableEvents.DataInitBindable
local dataUpdateBindable = serverFolder.BindableEvents.DataUpdateBindable

dataInitBindable.Event:Connect(function(player)
    clickCalculationManager:InitialisePlayer(player)
end)

dataUpdateBindable.Event:Connect(function(data, player, updatedCurrency)
    for sourceName, config in pairs(multiplierConfig) do
        local shouldUpdate = false

        if config.Type == "Level" and updatedCurrency == "Level" then
            shouldUpdate = true
        elseif config.Type == "Currency" and updatedCurrency == config.RelatedStat then
            shouldUpdate = true
        elseif config.Type == "Upgrade" and updatedCurrency == config.RelatedStat then
            shouldUpdate = true
        elseif config.Type == "Statistic" and updatedCurrency == config.RelatedStat then
            shouldUpdate = true
        elseif config.Type == "Rebirth" and updatedCurrency == "Rebirths" then
            shouldUpdate = true
        end

        if shouldUpdate then
            clickCalculationManager:UpdateMultiplier(player)
            break
        end
    end
end)

PlayersService.PlayerRemoving:Connect(function(player)
    clickCalculationManager:RemovePlayer(player)
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, passId, wasPurchased)
    if wasPurchased then
        task.wait(1)
        clickCalculationManager:UpdateMultiplier(player)
    end
end)