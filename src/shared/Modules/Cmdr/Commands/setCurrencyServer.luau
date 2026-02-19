local ServerStorage = game:GetService("ServerStorage")

local dataManager = require(ServerStorage.Server.Modules.DataManager)
local state
return function (context, player: Player, currency: string, amount: number)
	local target = if player then player else context.Executor

	dataManager:SetCurrency(target, currency, amount)
	state = dataManager:RetrieveAmount(target, currency)

	if not state then return "Currency does not exist." end
	return `{target.Name}'s {currency} balance has been set to {state}.`
end

