local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gammaNum = require(ReplicatedStorage.Shared.Modules.GammaNum)
local baseCost = gammaNum.fromNumber(10)

return function (level)
    local exponent = gammaNum.add(1.5, gammaNum.div(gammaNum.log10(level), 10)) 
    local cost = gammaNum.mul(baseCost, gammaNum.pow(level, exponent))
    return gammaNum.floor(cost)
end