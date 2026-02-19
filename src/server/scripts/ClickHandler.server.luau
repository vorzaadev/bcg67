debug.setmemorycategory("Click")

local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local modulesFolder = ServerStorage.Server.Modules
local clickEvent = ReplicatedStorage.Shared.Remotes.ClickEvent
local dataManager = require(modulesFolder.DataManager)
local debounceManager = require(modulesFolder.DebounceManager)
local clickCalculationManager = require(modulesFolder.ClickCalculationManager)

clickEvent.OnServerEvent:Connect(function(player)
    if not player or not player.Parent then return end
    local userId = player.UserId
    if debounceManager:IsDebounced(userId) then return end

    debounceManager:AddPlayerDebounce(userId)

    local baseAmount = 1
    local amountToGive = clickCalculationManager:Calculate(player, baseAmount)
    dataManager:AddCurrency(player, "Clicks", amountToGive)
    
    task.delay(0.1, function()
        debounceManager:RemovePlayerDebounce(userId)
    end)
end)