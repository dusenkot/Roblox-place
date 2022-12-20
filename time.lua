local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("TimeStats")

game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder")
	Leaderstats.Name = "leaderstats"
	Leaderstats.Parent = Player
	local Minutes = Instance.new("IntValue")
	Minutes.Name = "Minutes"
	Minutes.Value = 0
	Minutes.Parent = Leaderstats

	local Data = DataStore:GetAsync(Player.UserId)
	if Data then
		Minutes.Value = Data
	end

	coroutine.resume(coroutine.create(function()
		while true do
			wait(60)
			Minutes.Value = Minutes.Value + 1
		end
	end))
end)

game.Players.PlayerRemoving:Connect(function(Player)
	DataStore:SetAsync(Player.UserId, Player.leaderstats.Minutes.Value)
end)