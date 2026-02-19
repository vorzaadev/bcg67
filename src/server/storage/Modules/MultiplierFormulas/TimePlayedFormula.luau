local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gammaNum = require(ReplicatedStorage.Shared.Modules.GammaNum)

local exponent = gammaNum.fromNumber(0.5)
local divisor = gammaNum.fromNumber(30)
local base = gammaNum.fromNumber(1)

return function (time)
    local timePlayed = gammaNum.fromNumber(time)
    local powerFactor = gammaNum.pow(timePlayed, exponent)
    local dividedFactor = gammaNum.div(powerFactor, divisor)
    return gammaNum.add(dividedFactor, base)
end