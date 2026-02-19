return {
	Name = "setUpgrade",
	Aliases = {"su"},
	Description = "Sets a user's upgrade value to a specified amount (or none, clearing the data).",
	Group = "Admin",
	Args = {
		{
			Type = "player",
			Name = "Player",
			Description = "The player whose currency you want to change.",
		},
		{
			Type = "upgrades",
			Name = "Upgrade",
			Description = "The upgrade you want to change."
		},
		{
			Type = "number",
			Name = "Amount",
			Description = "The amount related to the operation."
		},
		
	}
}