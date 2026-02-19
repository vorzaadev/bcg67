return {
	Name = "modifyCurrencyAll",
	Aliases = {"mca"},
	Description = "Applies a basic arithmetic function to all user's specified currencies in the server.",
	Group = "Admin",
	Args = {
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