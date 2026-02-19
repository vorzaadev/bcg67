debug.setmemorycategory("DataHandler")

-- Services
local PlayersService = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local modulesFolder = ServerStorage.Server.Modules
local sharedModulesFolder = ReplicatedStorage.Shared.Modules

local remotesFolder = ReplicatedStorage.Shared.Remotes
local bindableEventsFolder = ServerStorage.Server.BindableEvents

local profileStore = require(modulesFolder.ProfileStore)
local profileTemplate = require(modulesFolder.SaveTemplate)
local dataManager = require(modulesFolder.DataManager)
local debounceManager = require(modulesFolder.DebounceManager)

local gammaNum = require(sharedModulesFolder.GammaNum)
local utils = require(sharedModulesFolder.Utils)

local dataInitEvent = remotesFolder.DataInitEvent
local dataInitBindable = bindableEventsFolder.DataInitBindable

local function formatNum(value)
    if not value then return "0" end
    local s, l, e = gammaNum.totuple(value)
    -- small numbers
    if l == 0 and e < 1000 then
        return tostring(math.floor(s * e))
    end
    -- big numbers >1k
    local oldDigits = gammaNum.DefaultDigits
    gammaNum.DefaultDigits = 2 
    local result = gammaNum.toSuffix(value)
    -- cleanup to 2 decimal places
    result = string.gsub(result, "(%d+%.%d%d)%d+", "%1")
    
    gammaNum.DefaultDigits = oldDigits
    return result
end


local function GetStoreName()
	return RunService:IsStudio() and "Test" or "PlayerStore"
end

local function SetandCreateLeaderstat(leaderstatName : string, dataProfile, leaderstatsFolder: Folder)
	if not dataProfile.Data[leaderstatName] then return end
	local value = dataProfile.Data[leaderstatName]

	if typeof(value) == "buffer" or (typeof(value) == "table" and value.toSuffix) then
		local leaderstat = Instance.new("StringValue")
		leaderstat.Name = leaderstatName
		leaderstat.Value = formatNum(value)
		leaderstat.Parent = leaderstatsFolder
	else
		local leaderstat = Instance.new("NumberValue")
		leaderstat.Name =  leaderstatName
		leaderstat.Value = value
		leaderstat.Parent = leaderstatsFolder
	end
end

local playerStore = profileStore.New(GetStoreName(), profileTemplate)

-- Make and set leaderstats
local function Initalise(player: Player, profile: typeof(playerStore:StartSessionAsync()))
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	task.wait(1)
	SetandCreateLeaderstat("Rebirths", profile, leaderstats)
	SetandCreateLeaderstat("Level", profile, leaderstats)
	SetandCreateLeaderstat("Clicks", profile, leaderstats)
	leaderstats.Parent = player
end

local function PlayerAdded(player: Player)
	-- Start session for player data
	local profile = playerStore:StartSessionAsync(`{player.UserId}`, {
		Cancel = function()
			return player.Parent ~= PlayersService
		end,
	})
	
	-- Sanity check
	if profile ~= nil then
		profile:AddUserId(player.UserId) 
		profile:Reconcile()
		
		profile.OnSessionEnd:Connect(function()
			if dataManager.Profiles[player] then
				dataManager.Profiles[player] = nil
				player:Kick("Error loading data profile. Please rejoin.")
			end
		end)
		
		if player.Parent == PlayersService then
			dataManager.Profiles[player] = profile
			Initalise(player, profile)
			print(`[DataHandler]: {utils:MakePossessive(player.Name)} ({player.UserId}) data loaded successfully!`)
			dataInitEvent:FireClient(player, profile.Data)
			dataInitBindable:Fire(player)
			
		else
			profile:EndSession()
		end
	else
		-- Server shutdown while player is joining
		player:Kick("Error loading data profile. Please rejoin.")
	end
end

-- Players already in the game when the script runs
for _, player in PlayersService:GetPlayers() do
	task.spawn(PlayerAdded, player)
end

PlayersService.PlayerAdded:Connect(PlayerAdded)

PlayersService.PlayerRemoving:Connect(function(player)
	local profile = dataManager.Profiles[player]
	if not profile then return end
	profile:EndSession()
	dataManager.Profiles[player] = nil
	debounceManager:RemovePlayerDebounce(player.UserId)
end)