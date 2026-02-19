local DebounceManager = {}

DebounceManager.Players = {}

function DebounceManager:AddPlayerDebounce(userId)
    self.Players[userId] = true
end

function DebounceManager:RemovePlayerDebounce(userId)
    self.Players[userId] = nil
end

function DebounceManager:IsDebounced(userId)
    local value = self.Players[userId]
    local result = value == true
    return result
end

return DebounceManager