-- Fireball Training Hub
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Status dos scripts (false = inativo)
local toggles = {
    ["Infinite Spins"] = false,
    ["OP Get Power"] = false,
    ["x5 Boost"] = false,
    ["Op Auto Clicker"] = false
}

-- Criar GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Autofarm"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 350) -- Aumentei altura
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(0, 0.7, 0)
mainFrame.Parent = screenGui

-- deixar arrastável
mainFrame.Active = true
mainFrame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0, 0.5, 0)
title.Text = "🔥 Fireball Training Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Botão X para fechar tudo
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Botões de Toggle
local yPos = 60
for scriptName, _ in pairs(toggles) do
    local btn = Instance.new("TextButton")
    btn.Name = scriptName
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    btn.Text = scriptName .. " [INATIVO ❌]"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = mainFrame
    
    btn.MouseButton1Click:Connect(function()
        toggles[scriptName] = not toggles[scriptName]
        btn.Text = scriptName .. " [" .. (toggles[scriptName] and "ATIVO ✅" or "INATIVO ❌") .. "]"
        btn.BackgroundColor3 = toggles[scriptName] and Color3.new(0, 0.7, 0) or Color3.new(0.3, 0.3, 0.3)
    end)
    yPos = yPos + 55
end

-- Botão Claim All Daily Rewards (AGORA 21/21 - executa 21 vezes)
local claimBtn = Instance.new("TextButton")
claimBtn.Name = "ClaimAllDaily"
claimBtn.Size = UDim2.new(0.9, 0, 0, 45)
claimBtn.Position = UDim2.new(0.05, 0, 0, yPos)
claimBtn.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
claimBtn.Text = "Claim All Daily Rewards (21/21) 🎁"
claimBtn.TextColor3 = Color3.new(1,1,1)
claimBtn.TextScaled = true
claimBtn.Font = Enum.Font.GothamBold
claimBtn.Parent = mainFrame

claimBtn.MouseButton1Click:Connect(function()
    pcall(function()
        claimBtn.Text = "Claiming... (21/21)"
        claimBtn.BackgroundColor3 = Color3.new(0.6, 0.6, 0)
        
        -- Executa 21 vezes com pequenos delays
        for i = 1, 21 do
            game:GetService("ReplicatedStorage"):WaitForChild("DailyEvents"):WaitForChild("ClaimDaily"):FireServer()
            claimBtn.Text = string.format("Claiming... (%d/21)", i)
            task.wait(0.05)
        end
        
        claimBtn.Text = "Claimed All! ✅"
        claimBtn.BackgroundColor3 = Color3.new(0, 0.8, 0)
        task.wait(0.2)
        claimBtn.Text = "Claim All Daily Rewards (21/21) 🎁"
        claimBtn.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
    end)
end)

-- Loop Principal
spawn(function()
    while screenGui.Parent do
        -- Infinite Spins
        if toggles["Infinite Spins"] then
            pcall(function()
                local args = {"Spins", 1}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddWheelSpinValue"):FireServer(unpack(args))
            end)
        end
        
        -- OP Get Power
        if toggles["OP Get Power"] then
            pcall(function()
                local args = {
                    "Power",
                    10000000000  -- 10 bilhões
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddWheelSpinValue"):FireServer(unpack(args))
            end)
        end

        -- x5 BOOST (NOVO!)
        if toggles["x5 Boost"] then
            pcall(function()
                local args = {
                    "x5 Power",
                    30  -- 30 minutos de boost
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddWheelSpinValue"):FireServer(unpack(args))
            end)
        end
        
        -- Train Auto Clicker
        if toggles["Op Auto Clicker"] then
            pcall(function()
                local character = Players.LocalPlayer.Character
                if character and character:FindFirstChild("Train") and character.Train:FindFirstChild("Event") then
                    character.Train.Event:FireServer()
                end
            end)
        end
        
        task.wait(0.1)  -- Delay um pouco maior para não crashar
    end
end)

print("🔥 Fireball Training Hub - x5 Boost ADICIONADO!")
