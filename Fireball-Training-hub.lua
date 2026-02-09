local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fireball Training Hub",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   KeySystem = true,
   KeySettings = {
      Title = "Fireball Training Hub",
      Subtitle = "Key System",
      Note = "67",
      FileName = "FireballKey",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {"feldlena"}
   },
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "FireballHub"
   }
})

local Tab = Window:CreateTab("Autofarm", nil)

local Section = Tab:CreateSection("Features")

local toggles = {
   ["Infinite Spins"] = false,
   ["OP Get Power"] = false,
   ["Get Daily and 5x Boost"] = false
}

for name, _ in pairs(toggles) do
   Tab:CreateToggle({
      Name = name,
      CurrentValue = false,
      Flag = name,
      Callback = function(Value)
         toggles[name] = Value
      end,
   })
end

print("🔥 Fireball Training Hub")

spawn(function()
   while task.wait(0.000000000000000000000001) do
      if toggles["Infinite Spins"] then
         pcall(function()
            local args = {"Spins", 10}
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddWheelSpinValue"):FireServer(unpack(args))
         end)
      end
      
      if toggles["OP Get Power"] then
         pcall(function()
            local args = {"Power", 10000000000}
            game:GetService("ReplicatedStorage").Remotes["AddWheelSpinValue"]:FireServer(unpack(args))
         end)
      end
      
      if toggles["Get Daily and 5x Boost"] then
         pcall(function()
            local args = {"x5 Power", 30}
            game:GetService("ReplicatedStorage").Remotes["AddWheelSpinValue"]:FireServer(unpack(args))
         end)
         
         pcall(function()
            game:GetService("ReplicatedStorage").DailyEvents.ClaimDaily:FireServer()
         end)
      end
   end
end)
