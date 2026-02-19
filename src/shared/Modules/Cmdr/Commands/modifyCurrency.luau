return {
	Name = "modifyCurrency",
	Aliases = {"mc"},
	Description = "Applies a basic arithmetic function (add, subtract or multiply) to a user's currency. ",
	Group = "Admin",
	Args = {
		{
			Type = "player",
			Name = "Player",
			Description = "The player whose currency you want to change. Use * for all players.",
		},
		{
			Type = "currency",
			Name = "Currency",
			Description = "The currency you want to change."
		},
		{
			Type = "operations",
			Name = "Operation",
			Description = "The operation you want to apply to the currency."
		},
		{
			Type = "number",
			Name = "Amount",
			Description = "The amount related to the operation."
		},
		
	}
}