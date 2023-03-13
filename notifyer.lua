local entitiesFolder = game.Workspace.Entities
local existingParts = {}

-- Iterate through each child part of the entities folder and add it to the existingParts table
for _, part in ipairs(entitiesFolder:GetChildren()) do
    existingParts[part] = true
end

-- Connect a function to the ChildAdded event of the entities folder
entitiesFolder.ChildAdded:Connect(function(part)
    if not existingParts[part] then
        game.StarterGui:SetCore("SendNotification", {
            Title = part.Name .. " has spawned!",
            Text = "Hide!",
            Duration = 5
        })
        print("Entity Spawned: " .. part.Name)
        existingParts[part] = true
    end
end)

-- Connect a function to the ChildRemoved event of the entities folder
entitiesFolder.ChildRemoved:Connect(function(part)
    if existingParts[part] then
        game.StarterGui:SetCore("SendNotification", {
            Title = part.Name .. " has despawned!",
            Text = "Safe",
            Duration = 5
        })
        print("Entity Despawned: " .. part.Name)
        existingParts[part] = nil
    end
end)
