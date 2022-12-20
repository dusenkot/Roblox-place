--Universal Respawn Script by iiMayk.

local Copy = script.Parent:Clone()
local NPC = script.Parent
local Humanoid
for i,v in pairs(NPC:GetChildren()) do 
	if v:IsA('Humanoid') then 
		Humanoid = v 
	end 
end

if Humanoid then
	Humanoid.Died:Connect(function()
		wait(5)
		Copy.Parent = NPC.Parent
		Copy:MakeJoints()
		NPC:Destroy()
	end)
else
	warn('Cannot find Humanoid in Respawn Script!')
end