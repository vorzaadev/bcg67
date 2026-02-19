local ReplicatedStorage = game:GetService("ReplicatedStorage")
local authorisedUsers = require(ReplicatedStorage.Shared.Modules.AuthorisedUsers)

return function (registry)
	registry:RegisterHook("BeforeRun", function(context)
		if context.Group == "Admin" and not authorisedUsers[context.Executor.UserId] then
			return "You don't have permission to run this command"
		end
	end)
end