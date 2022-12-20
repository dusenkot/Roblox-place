game.Workspace.ChildAdded:connect(function(plr)
	
  local NamePlr = plr.Name

  local PlrInPlr = game.Players:FindFirstChild(plr.Name)
  local PlrVipTagOrNicknameGui = game.ReplicatedStorage.PlayerVipTagOrNicknameGui
	
plr:WaitForChild("Humanoid").DisplayDistanceType = "None"
	
if PlrInPlr ~= nil then		
   PlrInPlr.CanLoadCharacterAppearance = true

  local Clone = PlrVipTagOrNicknameGui:WaitForChild("PlayerNicknameGui"):Clone()
		
		Clone.Parent = plr.Head
		Clone.Adornee = plr.Head
		Clone:WaitForChild("PlayerName").Text = NamePlr
  end
end)
