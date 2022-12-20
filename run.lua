local ContextActionService = game:GetService("ContextActionService")
local camera = game.Workspace.CurrentCamera
local TweeningService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Bar = script.Parent:WaitForChild('Border'):WaitForChild("Bar")
local player = game.Players.LocalPlayer 

local walk = 16
local run = 32

local power = 10
local sprinting = false

repeat wait() until game.Players.LocalPlayer.Character

local character = player.Character

local FOVChanges = {
	FieldOfView = 90
}

local TweenInformation = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local tween = TweeningService:Create(camera, TweenInformation, FOVChanges)

local FOVChanges2 = {
	FieldOfView = 70
}

local TweenInformation2 = TweenInfo.new(
	1,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local tween2 = TweeningService:Create(camera, TweenInformation2, FOVChanges)

UIS.InputBegan:Connect(function(key, gameProcessed)
	if key.KeyCode == Enum.KeyCode.LeftShift and gameProcessed == false then
		character.Humanoid.WalkSpeed = run
		sprinting = true
		while power > 0 and sprinting do
			power = power - .03
			Bar.Size = UDim2.new(power / 10, 0, 1, 0)
			tween:Play()
			wait()
			if power <= 0 then
				character.Humanoid.WalkSpeed = walk
			end
		end
	end
end)

UIS.InputEnded:Connect(function(key, gameProcessed)
	if key.KeyCode == Enum.KeyCode.LeftShift and gameProcessed == false then
		character.Humanoid.WalkSpeed = walk
		sprinting = false 
		while power < 10 and not sprinting do
			power = power + .015
			Bar.Size = UDim2.new(power / 10, 0, 1, 0)
			tween2:Play()
			wait()
			if power <= 0 then
				character.Humanoid.WalkSpeed = walk
			end
		end
	end
end)
local function handleAction(actionName, inputState, inputObject)
	if inputState == Enum.UserInputState.Begin then
		character.Humanoid.WalkSpeed = run
		sprinting = true 
		while power > 0 and sprinting do
				power = power - .03
				Bar.Size = UDim2.new(power / 10, 0, 1, 0)
				tween:Play()
				wait()
				if power <= 0 then
					character.Humanoid.WalkSpeed = walk
				end
		end
	end
	if inputState == Enum.UserInputState.End then
		character.Humanoid.WalkSpeed = walk
		sprinting = false 
		while power < 10 and not sprinting do
			power = power + .015
			Bar.Size = UDim2.new(power / 10, 0, 1, 0)
			tween2:Play()
			wait()
			if power <= 0 then
				character.Humanoid.WalkSpeed = walk
			end
		end
	end
end
ContextActionService:BindAction("Interact", handleAction, true, Enum.KeyCode.Home)
ContextActionService:SetPosition("Interact", UDim2.new(1, -70, 0, 10))
ContextActionService:SetImage("Interact", "rbxassetid://0123456789")
ContextActionService:SetTitle("Interact", "Sprint")