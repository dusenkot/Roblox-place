local sound = Instance.new("Sound", script)
sound.Looped = true

local char = script.Parent
local hrp = char:WaitForChild("HumanoidRootPart")

local areasGroup = workspace:WaitForChild("Sounds")
local currentArea= nil

game:GetService("RunService").Heartbeat:Connect(function()
	local raycast = Ray.new(hrp.Position, hrp.CFrame.UpVector* -5)
	local part = workspace:FindPartOnRayWithWhitelist(raycast, {areasGroup})
		
	if part and part.Parent	== areasGroup then
		if part == currentArea then
			currentArea = part
			sound.SoundId = currentArea.Sound.SoundId
			sound:Play()
		end
	else
		currentArea=nil
		sound:Stop()
	end
end)
