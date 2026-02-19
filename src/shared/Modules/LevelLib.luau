local LevelLib = {}

local baseCost = 10
local scaleFactor = 1000000

function LevelLib.GetCost(level)
    if level == 0 then return baseCost end

    local exponent = 1.25 + (level / scaleFactor)
    local cost = baseCost * (level ^ exponent)

    return math.floor(cost)
end

return LevelLib
