local PlayersService = game:GetService("Players")

PlayersService.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        character.Humanoid.WalkSpeed = 0
        character.Humanoid.JumpHeight = 0
    end)
end)
