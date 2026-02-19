local ServerStorage = game:GetService("ServerStorage")

local dataManager = require(ServerStorage.Server.Modules.DataManager)


return function (context, player: Player)
	local target = player or nil
	
	if not target then return "No target player listed." end

	local dataTable = dataManager:RetrieveAmount(target)

	for key in pairs(dataTable) do
		dataManager:SetCurrency(target, key, 0)
	end

	if not dataTable then return "Currency does not exist." end
	return `{target.Name}'s data has been cleared.`
end

