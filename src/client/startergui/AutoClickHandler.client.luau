local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remotesFolder = ReplicatedStorage.Shared.Remotes
local autoClickEvent = remotesFolder.AutoClickEvent
local dataUpdateEvent = remotesFolder.DataUpdateEvent
local sfxEvent = remotesFolder.Parent.Bindables.SFXEvent
local autoClickButton = script.Parent.MainUI.AutoClickButton

local utils = require(ReplicatedStorage.Shared.Modules.Utils)

local debounce = false
local isEligible
local isActive = true
local autoClickSound = ReplicatedStorage.Shared.Sounds.Interactive.AutoClickSound
autoClickButton.Visible = false

dataUpdateEvent.OnClientEvent:Connect(function(data, updatedCurrency)
    if updatedCurrency == "AutoClicker" then
        if data.Upgrades.AutoClicker >= 1 then
            if not isEligible then
                if autoClickButton.Visible == false then
                    isEligible = true
                    autoClickButton.BackgroundTransparency = 1
                    autoClickButton.TextTransparency = 1
                    autoClickButton.Visible = true
                    autoClickButton.Interactable = true
                    
                    utils:Tween(autoClickButton, {BackgroundTransparency = 0, TextTransparency = 0}, 0.5)
                end
            end
        end
    end
end)

autoClickButton.MouseButton1Click:Connect(function()
    if debounce == false then
        debounce = true
        isActive = not isActive
        sfxEvent:Fire(autoClickSound, 2)
        if isActive then
            autoClickButton.Text = "AUTOCLICKER<br />off"
            autoClickEvent:FireServer("stop")
        else
            autoClickButton.Text = "AUTOCLICKER<br />on"
            autoClickEvent:FireServer("start")
        end
        task.wait(0.5)
        debounce = false
    end
end)