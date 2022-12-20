local camera = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character.Humanoid

-- camera settings
player.CameraMaxZoomDistance = 0.5 -- force first person
camera.FieldOfView = 100
humanoid.CameraOffset = Vector3.new(0, 0, -0.6)


-- set and keep every body part Transparency to its real transparency


local UserInputService = game:GetService("UserInputService")

UserInputService.MouseIconEnabled = false
