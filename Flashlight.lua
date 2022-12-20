local Character = script.Parent
local Light = Instance.new("PointLight", Character:WaitForChild("HumanoidRootPart"))
Light.Enabled = false
Light.Color = Color3.fromRGB(255, 255, 255)
Light.Brightness = 3
Light.Range = 8
Light.Shadows = true
local UserInputService = game:GetService("UserInputService")
local function onInputBegan(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.F then
			print("F")
			Light.Enabled = not Light.Enabled
		end
	end
end
UserInputService.InputBegan:Connect(onInputBegan)