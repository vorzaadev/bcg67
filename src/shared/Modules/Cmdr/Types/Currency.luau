local currencies = {
    "Clicks",
    "Level",
    "Rebirths",
}

return function (registry)
    registry:RegisterType("currency", registry.Cmdr.Util.MakeEnumType("currency", currencies))
end
