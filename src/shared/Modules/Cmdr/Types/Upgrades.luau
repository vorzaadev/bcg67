local upgrades = {
    "AutoClicker",
    "DoubleClicks",
    "TripleClicks",
    "QuadrupleClicks",
    "QuintupleClicks",
    "TimePlayed",
    "ReduceLevelCost",
}
return function (registry)
    registry:RegisterType("upgrades", registry.Cmdr.Util.MakeEnumType("upgrades", upgrades))
end