function onTouched(part) 
local h = part.Parent:findFirstChild("NPC") 
if h~=nil then 
h.Health = h.Health -100 


end 
end 

script.Parent.Touched:connect(onTouched)
