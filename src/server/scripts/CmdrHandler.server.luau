local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Cmdr = require(ReplicatedStorage.Packages._Index["evaera_cmdr@1.12.0"].cmdr)
local cmdrFolder = ReplicatedStorage.Shared.Modules.Cmdr

Cmdr:RegisterDefaultCommands()
Cmdr:RegisterHooksIn(cmdrFolder.Hooks)
Cmdr:RegisterCommandsIn(cmdrFolder.Commands)
Cmdr:RegisterTypesIn(cmdrFolder.Types)