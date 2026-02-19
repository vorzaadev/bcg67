local ServerStorage = game:GetService("ServerStorage")

local dataManager = require(ServerStorage.Server.Modules.DataManager)
local state
return function (context, player: Player, upgrades: string, amount: number)
	local target = if player then player else context.Executor

	dataManager:SetUpgrade(target, upgrades, amount)
	state = dataManager:GetUpgrade(target, upgrades)

	if not state then return "Upgrade does not exist." end
	return `{target.Name}'s {upgrades} balance has been set to {state}.`
end

