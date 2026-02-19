return {
	Name = "setCurrency",
	Aliases = {"sc"},
	Description = "Sets a user's currency to a specified amount (or none, clearing the data).",
	Group = "Admin",
	Args = {
		{
			Type = "player",
			Name = "Player",
			Description = "The player whose currency you want to change.",
		},
		{
			Type = "currency",
			Name = "Currency",
			Description = "The currency you want to change."
		},
		{
			Type = "number",
			Name = "Amount",
			Description = "The amount related to the operation."
		},
		
	}
}