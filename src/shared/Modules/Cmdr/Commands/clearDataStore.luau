return {
	Name = "clearDataStore",
	Aliases = {"cds"},
	Description = "Clears an entire data store of a selected user.",
	Group = "Admin",
	Args = {
		{
			Type = "player",
			Name = "Player",
			Description = "The player whose currency you want to change.",
		}	
	}
}