local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local mainUI = script.Parent.MainUI
local mainFrame = mainUI.MainFrame
local coverFrame = mainFrame.CoverFrame
local versionFrame = mainFrame.VersionFrame
local betaFrame = mainFrame.BetaFrame
local betaFrameTitle, betaFrameDescription, betaFrameTimer = betaFrame.Title, betaFrame.Description, betaFrame.Timer
local buttonsFolder = mainFrame.ButtonFrame.Buttons
local menusFolder = mainFrame.Menus
local versionButton = mainFrame.VersionLabel
local clickButton, autoClickButton = mainUI.ClickButton, mainUI.AutoClickButton

local buildLabel = versionFrame.BuildLabel
local uptimeLabel = versionFrame.UptimeLabel
local versionLabel = versionFrame.VersionLabel

local gameVersion = require(ReplicatedStorage.Shared.Modules.GameVersion)
local serverUptime = require(ReplicatedStorage.Shared.Modules.ServerUptime)
local menuManager = require(ReplicatedStorage.Shared.Modules.MenuManager)

local dataInitEvent = ReplicatedStorage.Shared.Remotes.DataInitEvent

local dataInitialised = false
local isOpen = false
local debounce = false

betaFrame.Visible = false

local function tween(obj, goal, duration, delay: number?)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, delay or 0)
    local newTween = TweenService:Create(obj, tweenInfo, goal)
    newTween:Play()
    newTween.Completed:Connect(function()
        newTween:Destroy()
    end)
return newTween end

local function tweenText(parent, value)
    for _, child in pairs(parent:GetDescendants()) do
        if child:IsA("TextLabel") then
            tween(child, {TextTransparency = value}, 0.3)
        end
    end
end

local function toggleFrame()
    if not debounce then
        if dataInitialised == true then
            debounce = true
            if isOpen then
                autoClickButton.Interactable = true
                clickButton.Interactable = true
                menuManager:EnableAllButtons(buttonsFolder)
                local mainTween = tween(versionFrame, {BackgroundTransparency = 1}, 0.3)
                tween(clickButton, {BackgroundTransparency = 0, ImageTransparency = 0}, 0.3)
                tween(autoClickButton, {BackgroundTransparency = 0, TextTransparency = 0}, 0.3)
                tween(coverFrame, {BackgroundTransparency = 1}, 0.3)
                tweenText(versionFrame, 1)
                mainTween.Completed:Connect(function()
                    versionFrame.Visible = false
                    coverFrame.Visible = false
                end)
            else
                autoClickButton.Interactable = false
                clickButton.Interactable = false
                menuManager:DisableAllButtons(buttonsFolder)
                menuManager:CloseAllMenus(menusFolder)
                versionFrame.Visible = true
                coverFrame.Visible = true
                tweenText(versionFrame, 0)
                tween(versionFrame, {BackgroundTransparency = 0}, 0.3)
                tween(clickButton, {BackgroundTransparency = 1, ImageTransparency = 1}, 0.3)
                tween(autoClickButton, {BackgroundTransparency = 1, TextTransparency = 1}, 0.3)
                tween(coverFrame, {BackgroundTransparency = 0.1}, 0.3)
            end
            isOpen = not isOpen
            task.wait(0.5)
            debounce = false
        else
            print("[VersionInfoHandler]: Player has not loaded yet") 
            return
        end
    end
end

dataInitEvent.OnClientEvent:Connect(function()
    tweenText(versionFrame, 1)
    coverFrame.BackgroundTransparency = 1
    versionFrame.BackgroundTransparency = 1
    versionFrame.Visible = false
    coverFrame.Visible = false
    buildLabel.Text = "Build " .. game.PlaceVersion
    versionLabel.Text = "BCG (basic clicking game) - " .. gameVersion.FullName
    betaFrameTimer.TextTransparency = 1
    betaFrameTitle.TextTransparency = 1
    betaFrameDescription.TextTransparency = 1
    betaFrame.BackgroundTransparency = 1
    task.wait(5)
    dataInitialised = true
    betaFrame.Visible = true
    task.wait(0.5)
    tween(betaFrame, {BackgroundTransparency = 0}, 1)
    tween(betaFrameTimer, {TextTransparency = 0}, 1)
    tween(betaFrameTitle, {TextTransparency = 0}, 1)
    tween(betaFrameDescription, {TextTransparency = 0}, 1)
    for i = 4, 1, -1 do
        if i == 1 then
            betaFrameTimer.Text = "This menu will automatically disappear in 1 second"
        else
            betaFrameTimer.Text = "This menu will automatically disappear in " .. i .. " seconds"
        end
        task.wait(1)
    end
    tween(betaFrame, {BackgroundTransparency = 1}, 1)
    tween(betaFrameTimer, {TextTransparency = 1}, 1)
    tween(betaFrameTitle, {TextTransparency = 1}, 1)
    tween(betaFrameDescription, {TextTransparency = 1}, 1)
    task.wait(1)
    betaFrame:Destroy()
end)

coverFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if isOpen then
            toggleFrame()
        end
    end
end)

versionButton.MouseButton1Click:Connect(toggleFrame)

while task.wait(1) do
    if dataInitialised == true then
        local uptime = serverUptime:Get()
        uptimeLabel.Text = "Server uptime: "  .. uptime
    end
end


