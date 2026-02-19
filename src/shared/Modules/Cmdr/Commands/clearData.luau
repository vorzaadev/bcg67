return {
	Name = "clearData",
	Aliases = {"cd"},
	Description = "Clears all currencies of a selected user. ",
	Group = "Admin",
	Args = {
		{
			Type = "player",
			Name = "Player",
			Description = "The player whose currency you want to change.",
		}	
	}
}