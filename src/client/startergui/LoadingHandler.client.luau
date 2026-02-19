local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local PlayersService = game:GetService("Players")
local TestService = game:GetService("TestService")

local sharedFolder = ReplicatedStorage.Shared
local dataInitEvent = sharedFolder.Remotes.DataInitEvent
local sfxEvent = sharedFolder.Remotes.Parent.Bindables.SFXEvent

local gameVersion = require(sharedFolder.Modules.GameVersion)
local serverUptime = require(sharedFolder.Modules.ServerUptime)
local menuManager = require(sharedFolder.Modules.MenuManager)

local mainUI = script.Parent.MainUI
local loadingLabel = mainUI.MainFrame.LoadingLabel
local versionLabel = mainUI.MainFrame.VersionLabel
local gameLabel = mainUI.MainFrame.GameLabel
local clicksFrame = mainUI.MainFrame.ClicksFrame
local player = PlayersService.LocalPlayer

local dataInitialised = false
local joinTime = os.date("%Y-%m-%d %H:%M:%S")

local ASCII = [[

bbbbbbbb                                                    
b::::::b                                                    
b::::::b                                                    
b::::::b                                                    
 b:::::b                                                    
 b:::::bbbbbbbbb        cccccccccccccccc   ggggggggg   ggggg
 b::::::::::::::bb    cc:::::::::::::::c  g:::::::::ggg::::g
 b::::::::::::::::b  c:::::::::::::::::c g:::::::::::::::::g
 b:::::bbbbb:::::::bc:::::::cccccc:::::cg::::::ggggg::::::gg
 b:::::b    b::::::bc::::::c     cccccccg:::::g     g:::::g 
 b:::::b     b:::::bc:::::c             g:::::g     g:::::g 
 b:::::b     b:::::bc:::::c             g:::::g     g:::::g 
 b:::::b     b:::::bc::::::c     cccccccg::::::g    g:::::g 
 b:::::bbbbbb::::::bc:::::::cccccc:::::cg:::::::ggggg:::::g 
 b::::::::::::::::b  c:::::::::::::::::c g::::::::::::::::g 
 b:::::::::::::::b    cc:::::::::::::::c  gg::::::::::::::g 
 bbbbbbbbbbbbbbbb       cccccccccccccccc    gggggggg::::::g 
                                                    g:::::g 
                                        gggggg      g:::::g 
                                        g:::::gg   gg:::::g 
                                         g::::::ggg:::::::g 
                                          gg:::::::::::::g  
                                            ggg::::::ggg    
                                               gggggg       
]]

local function tween(obj, goal, duration, delay: number?)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, delay or 0)
    local newTween = TweenService:Create(obj, tweenInfo, goal)
    newTween:Play()
    newTween.Completed:Connect(function()
        newTween:Destroy()
    end)
end

local coreCall do
	local maxRetries = 100
	
	function coreCall(method, ...)
		local result = {}
		for i = 1, maxRetries do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			
			task.wait(1)
		end
		
		return unpack(result)
	end
end
TestService:Message(`Hi {player.Name}! Welcome to\n{ASCII}\n version {gameVersion.FullName}\n build {game.PlaceVersion}\n as at {joinTime}\n server uptime on join: {serverUptime:Get()}`)                          


assert(coreCall("SetCore", "ResetButtonCallback", false))
assert(coreCall("SetCoreGuiEnabled", "All", false))
menuManager:DisableAllButtons(script.Parent.MainUI.MainFrame.ButtonFrame.Buttons)
versionLabel.Text = gameVersion.FullName
mainUI.ClickButton.ImageTransparency = 1
mainUI.ClickButton.BackgroundTransparency = 1
mainUI.AutoClickButton.TextTransparency = 1
mainUI.AutoClickButton.BackgroundTransparency = 1
mainUI.ClickButton.Interactable = false
mainUI.AutoClickButton.Visible = false
mainUI.Enabled = true
loadingLabel.TextTransparency = 1
loadingLabel.Visible = true
versionLabel.TextTransparency = 1
versionLabel.Visible = true
gameLabel.TextTransparency = 1
gameLabel.Visible = true
clicksFrame.Visible = false
clicksFrame.Position = UDim2.fromScale(0.5,-0.15)
mainUI.MainFrame.Visible = true
tween(loadingLabel, {TextTransparency = 0}, 0.5, 0.5)
tween(versionLabel, {TextTransparency = 0}, 0.5, 0.5)

task.spawn(function()
    task.wait(10)
    if not dataInitialised then
        print("[LoadingHandler]: Data failed to initalise")
        loadingLabel.Text = "data failed to initalise :("
        task.wait(3.5)
        player:Kick("Your data failed to initalise in time. If this error persists, please contact the developers.")
    end
end)

dataInitEvent.OnClientEvent:Connect(function(data)
    sfxEvent:Fire(sharedFolder.Sounds.Interactive.LoadingSound, 0.25)
    dataInitialised = true
    print("------------------DATA INITIALISED------------------")
    print("[LoadingHandler]: Data initalised, waiting for SFX")
    task.wait(1.5)
    loadingLabel.Text = "data initalised!"
    task.wait(1)
    tween(loadingLabel, {TextTransparency = 1}, 0.5)
    task.wait(0.55)
    loadingLabel:Destroy()

    tween(gameLabel, {TextTransparency = 0}, 0.5)
    tween(versionLabel, {TextTransparency = 1}, 0.25, 0.25)
    task.wait(0.5)
    versionLabel.Size = UDim2.new(versionLabel.Size.X.Scale * 0.5, 0, versionLabel.Size.Y.Scale * 0.5, 0)
    tween(gameLabel, {TextTransparency = 1}, 0.8)
    tween(gameLabel.UIScale, {Scale = 67}, 1) 
    task.wait(0.5)
    tween(gameLabel, {TextTransparency = 1}, 1, 0.25)
    tween(versionLabel, {TextTransparency = 0}, 0.5, 0.25)
    task.wait(0.5)
    clicksFrame.Visible = true
    mainUI.ClickButton.Visible = true
    if data.Upgrades.AutoClicker >= 1 then 
        mainUI.AutoClickButton.Visible = true
        tween(mainUI.AutoClickButton, {BackgroundTransparency = 0}, 0.5)
        task.spawn(function()
            task.wait(0.5)
            tween(mainUI.AutoClickButton, {TextTransparency = 0}, 0.75)
            mainUI.AutoClickButton.Interactable = true
        end)
    else
        mainUI.AutoClickButton.Visible = false
        mainUI.AutoClickButton.Interactable = false
    end
    tween(clicksFrame, {Position = UDim2.fromScale(0.5,0)}, 0.5)
    tween(mainUI.ClickButton, {BackgroundTransparency = 0}, 0.5)
    task.wait(0.5)
    menuManager:EnableAllButtons(script.Parent.MainUI.MainFrame.ButtonFrame.Buttons)
    assert(coreCall("SetCoreGuiEnabled", "Chat", true))
    assert(coreCall("SetCoreGuiEnabled", "PlayerList", true))
    tween(mainUI.ClickButton, {ImageTransparency = 0}, 0.75)

    mainUI.ClickButton.Interactable = true
    loadingLabel:Destroy()
    gameLabel:Destroy()
    script:Destroy()
end)
