local ServerUptime = {}

function ServerUptime:Get()
    local totalSeconds = time()
    local seconds = math.floor(totalSeconds % 60)
    local mins = math.floor((totalSeconds / 60) % 60) 
    local hours = math.floor((totalSeconds / 3600) % 24)
    local days = math.floor(totalSeconds / 86400)
    return string.format("%d:%02d:%02d:%02d", days, hours, mins, seconds)
end

return ServerUptime