local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gammaNum = require(ReplicatedStorage.Shared.Modules.GammaNum)

return {
    Clicks = gammaNum.fromNumber(10),
    Level = 1,
    Rebirths = 0,
    Upgrades = {
        AutoClicker = 0,
        ClickUpgrades = 0,
        DoubleClicks = 0,
        TripleClicks = 0,
        QuadrupleClicks = 0,
        QuintupleClicks = 0,
        TimePlayed = 0,
        ReduceLevelCost = 0,
    },
    Settings = {
        BGMusic = true,
        SFX = false,
    },
    Statistics = {
        TotalTime = 0,
    }
} 