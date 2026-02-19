local operations = {
    "add",
    "deduct",
    "multiply",
}
return function (registry)
    registry:RegisterType("operations", registry.Cmdr.Util.MakeEnumType("operations", operations))
end
