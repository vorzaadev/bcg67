local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")

local dataManager = require(ServerStorage.Server.Modules.DataManager)
local profileStore = require(ServerStorage.Server.Modules.ProfileStore)
local profileTemplate = require(ServerStorage.Server.Modules.SaveTemplate)

local function GetStoreName()
	return RunService:IsStudio() and "Test" or "PlayerStore"
end

return function (context, target: Player)
	if not target then return "No target player listed." end

	local profile = dataManager.Profiles[target]
	if not profile then return `{target.Name} has no active profile.` end

	local store = DataStoreService:GetDataStore(GetStoreName())
	local success, err = pcall(function()
		store:RemoveAsync(tostring(target.UserId))
	end)

	if not success then
		return `Failed to clear {target.Name}'s data: {err}`
	end

	dataManager.Profiles[target] = nil
	profile:EndSession()

	target:Kick("Your data has been cleared. Please rejoin.")
	return `{target.Name}'s data has been cleared.`
end