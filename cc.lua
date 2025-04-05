local DarkraiX = loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrooi/bananahub/refs/heads/main/Darkrai%20Ui%20(1).txt", true))()

local Library = DarkraiX:Window("M-Banana","","",Enum.KeyCode.RightControl);

Tab1 = Library:Tab("General")
Tab2 = Library:Tab("Config")

Tab1:Seperator("Esp")

Tab1:Toggle("Esp Player",false,function(value)
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local head = player.Character.Head
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = head
        billboardGui.Parent = player.Character
        billboardGui.Size = UDim2.new(0, 200, 0, 50)  -- Cố định kích thước BillboardGui
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Điều chỉnh vị trí đúng
        billboardGui.AlwaysOnTop = true

        -- Khoảng cách giữa người chơi và người chạy script
        local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
        local distanceTag = Instance.new("TextLabel")
        distanceTag.Parent = billboardGui
        distanceTag.Text = string.format("%.2f studs", distance)
        distanceTag.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
        distanceTag.TextStrokeTransparency = 0.5  -- Giảm giá trị để viền chữ dày hơn
        distanceTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Viền đen
        distanceTag.BackgroundTransparency = 1
        distanceTag.Size = UDim2.new(1, 0, 0.3, 0)  -- Khoảng cách chiếm 30% chiều cao
        distanceTag.Position = UDim2.new(0, 0, 0, 0)  -- Đặt ở trên cùng
        distanceTag.TextScaled = false  -- Không tự động thay đổi kích thước chữ
        distanceTag.Font = Enum.Font.SourceSansBold
        distanceTag.TextSize = 22

        -- Tạo TextLabel cho tên người chơi
        local nameTag = Instance.new("TextLabel")
        nameTag.Parent = billboardGui
        nameTag.Text = player.Name
        nameTag.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
        nameTag.TextStrokeTransparency = 0.5  -- Giảm giá trị để viền chữ dày hơn
        nameTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Viền đen
        nameTag.BackgroundTransparency = 1
        nameTag.Size = UDim2.new(1, 0, 0.7, 0)  -- Chiếm 70% chiều cao
        nameTag.Position = UDim2.new(0, 0, 0.3, 0)  -- Đặt dưới khoảng cách
        nameTag.TextScaled = false  -- Không tự động thay đổi kích thước chữ
        nameTag.Font = Enum.Font.SourceSansBold
        nameTag.TextSize = 22

        -- Cập nhật vị trí liên tục khi người chơi di chuyển
        game:GetService("RunService").Heartbeat:Connect(function()
            if player.Character and player.Character:FindFirstChild("Head") then
                local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                distanceTag.Text = string.format("%.2f studs", distance)
                billboardGui.StudsOffset = Vector3.new(0, 3, 0)  -- Đảm bảo vị trí được cập nhật
            end
        end)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        createESP(player)
    end
end
    end)
Tab1:Toggle("Esp Mob",false,function(value)
local function createMobESP(mob)
    if mob:FindFirstChild("HumanoidRootPart") then
        local root = mob.HumanoidRootPart
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = root
        billboardGui.Parent = root
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true

        local distanceTag = Instance.new("TextLabel")
        distanceTag.Parent = billboardGui
        distanceTag.Text = "..."
        distanceTag.TextColor3 = Color3.fromRGB(255, 100, 100)
        distanceTag.TextStrokeTransparency = 0.5
        distanceTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distanceTag.BackgroundTransparency = 1
        distanceTag.Size = UDim2.new(1, 0, 0.3, 0)
        distanceTag.Position = UDim2.new(0, 0, 0, 0)
        distanceTag.TextScaled = false
        distanceTag.Font = Enum.Font.SourceSansBold
        distanceTag.TextSize = 22

        local nameTag = Instance.new("TextLabel")
        nameTag.Parent = billboardGui
        nameTag.Text = mob.Name
        nameTag.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameTag.TextStrokeTransparency = 0.5
        nameTag.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameTag.BackgroundTransparency = 1
        nameTag.Size = UDim2.new(1, 0, 0.7, 0)
        nameTag.Position = UDim2.new(0, 0, 0.3, 0)
        nameTag.TextScaled = false
        nameTag.Font = Enum.Font.SourceSansBold
        nameTag.TextSize = 22

        game:GetService("RunService").Heartbeat:Connect(function()
            if root and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (root.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                distanceTag.Text = string.format("%.2f studs", distance)
            end
        end)
    end
end

-- Quét mob hiện có
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
        createMobESP(obj)
    end
end

-- Theo dõi mob mới xuất hiện
workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
        wait(0.1)
        createMobESP(obj)
    end
end)
    end)
Tab1:Seperator("Teleport - Coming Soon")

Tab1:Button("Teleport 80km",function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local newPosition = Vector3.new(423.99859619140625, 31.4669189453125, -49041) -- Tọa độ đích

if character then
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Dịch chuyển ngay lập tức
    humanoidRootPart.CFrame = CFrame.new(newPosition)
end   
end)

Tab1:Button("Teleport 10km",function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local newPosition = Vector3.new(1358.5087890625, 369.697509765625, -49.35203552246094) -- Tọa độ đích

if character then
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Dịch chuyển ngay lập tức
    humanoidRootPart.CFrame = CFrame.new(newPosition)
end   
end)

Tab1:Seperator("Comlect")

Tab1:Slider("Range",1,1,0,function(value)
        
    end)
Tab1:Textbox("Enter Name Item","",true,function(value)

end)
Tab1:Toggle("Comlect Item",false,function(value)

    end)
Tab1:Seperator("Misc")
Tab1:Button("Noclip",function()
   local noclip = true
game:GetService("RunService").Stepped:Connect(function()
    if noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end) 
end)
Tab1:Line()
Tab2:Seperator("Config Antiban")

Tab2:Textbox("Enter API Key","",true,function(value)

end)
Tab2:Button("Config",function()
    
end)
Tab2:Button("Statue Antiban: 🔴",function()
    
end)
