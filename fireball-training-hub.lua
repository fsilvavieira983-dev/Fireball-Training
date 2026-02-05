local v2=Players.LocalPlayer:WaitForChild("PlayerGui")
local v3=Instance.new("ScreenGui")
v3.Name="Autofarm"
v3.Parent=v1
v3.ResetOnSpawn=false
local v4=Instance.new("Frame")
v4.Size=UDim2.new(0,350,0,350)
v4.Position=UDim2.new(0.5,-175,0.5,-175)
v4.BackgroundColor3=Color3.new(0.1,0.1,0.1)
v4.BorderSizePixel=2
v4.BorderColor3=Color3.new(0.7,0,0)
v4.Parent=v3
v4.Active=true
v4.Draggable=true
local v5=Instance.new("TextLabel")
v5.Size=UDim2.new(1,0,0,40)
v5.Position=UDim2.new(0,0,0,0)
v5.BackgroundColor3=Color3.new(0.5,0,0)
v5.Text="Fireball Training"
v5.TextColor3=Color3.new(1,1,1)
v5.TextScaled=true
v5.Font=Enum.Font.GothamBold
v5.Parent=v4
v6.Size=UDim2.new(0,30,0,30)
v6.Position=UDim2.new(1,-35,0,5)
v6.BackgroundColor3=Color3.new(0.5,0,0)
v6.Text="X"
v6.TextColor3=Color3.new(1,1,1)
v6.TextScaled=true
v6.Font=Enum.Font.GothamBold
local v7=v6.MouseButton1Click:Connect(function()
	local v18=v3:Destroy()
end)
v8.Name="x5 Boost"
v8.Position=UDim2.new(0.05,0,0,60)
v8.Text="x5 Boost [INATIVO \xe2\x9d\x8c]"
v8.TextColor3=Color3.new(1,1,1)
v8.TextScaled=true
v8.Font=Enum.Font.Gotham
local v9=v8.MouseButton1Click:Connect(function()
	-- callback had no traced operations
end)
v10.Name="OP Get Power"
v10.Position=UDim2.new(0.05,0,0,115)
v10.Font=Enum.Font.Gotham
local v11=v10.MouseButton1Click:Connect(function()
	-- callback had no traced operations
end)
v16.Font=Enum.Font.GothamBold
spawn(function()
	local v128=v126:FireServer("Spins",1)
	local v133=v131:FireServer("Power",10000000000)
	local v140=Players.LocalPlayer.Character:FindFirstChild("Train")
	local v142=Players.LocalPlayer.Character.Train:FindFirstChild("Event")
	local v143=Players.LocalPlayer.Character.Train.Event:FireServer()
	task.wait(1e-24)
	local v160=Players.LocalPlayer.Character:FindFirstChild("Train")
	local v162=Players.LocalPlayer.Character.Train:FindFirstChild("Event")
	local v163=Players.LocalPlayer.Character.Train.Event:FireServer()
	task.wait(1e-24)
	-- execution limit reached
	-- callback timeout
end)
print("\xf0\x9f\x94\xa5 Fireball Training Hub")
