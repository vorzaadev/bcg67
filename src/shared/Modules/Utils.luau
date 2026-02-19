local TweenService = game:GetService("TweenService")

local Utils = {}

function Utils:Tween(obj, goal, duration, delay: number?)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, delay or 0)
    local newTween = TweenService:Create(obj, tweenInfo, goal)
    newTween:Play()
    newTween.Completed:Connect(function()
        newTween:Destroy()
    end)
return newTween
end

function Utils:TweenUnsuccessful(obj, duration, delay: number?)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, true, delay or 0)
    local newTween = TweenService:Create(obj, tweenInfo, {BackgroundColor3 = Color3.fromRGB(209, 12, 12)})
    newTween:Play()
    newTween.Completed:Connect(function()
        newTween:Destroy()
    end)
    return newTween
end

function Utils:MakePossessive(username)
    if string.sub(username, -1) then
        return username .. "'"
    else
        return username .. "'s"
    end
end

return Utils