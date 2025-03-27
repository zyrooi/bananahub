repeat task.wait(5) until game:IsLoaded();
getgenv().Image = "rbxthumb://type=Asset&id=115223276329152&w=420&h=420"; -- put a asset id in here to make it work
getgenv().ToggleUI = "E" -- This where you can Toggle the Fluent ui library

task.spawn(function()
    if not getgenv().LoadedMobileUI == true then getgenv().LoadedMobileUI = true
        local OpenUI = Instance.new("ScreenGui");
        local ImageButton = Instance.new("ImageButton");
        local UICorner = Instance.new("UICorner");
        OpenUI.Name = "OpenUI";
        OpenUI.Parent = game:GetService("CoreGui");
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        ImageButton.Parent = OpenUI;
        ImageButton.BackgroundColor3 = Color3.fromRGB(105,105,105);
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0,30,0,10);
        ImageButton.Size = UDim2.new(0,55,0,55);
        ImageButton.Image = getgenv().Image;
        ImageButton.Draggable = true;
        ImageButton.Transparency = 1;
        UICorner.CornerRadius = UDim.new(0,200);
        UICorner.Parent = ImageButton;
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true,getgenv().ToggleUI,false,game);
        end)
    end
end)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Banana Hub [Premium]",
    SubTitle = "By: oibaka",
    TabWidth = 160,
    Size = UDim2.fromOffset(480, 350),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.E -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Tabs General", Icon = "" }),
    Tele = Window:AddTab({ Title = "Tabs Teleport", Icon = "" }), 
    Pro = Window:AddTab({ Title = "Tabs Localplayer", Icon = "" }), 
    
}

Tabs.Tele:AddButton({
Title = "Teleport 80Km",
        Description = "",
        Callback = function()
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Tọa độ mới mà mày muốn dịch chuyển đến
local newPosition = CFrame.new(-346, -69, -49060)

if character then
    character:PivotTo(newPosition)  -- Dịch chuyển nhân vật đến tọa độ mới
else
    warn("Không tìm thấy nhân vật!")
end
        end
    })


Tabs.Tele:AddButton({
Title = "Teleport 70Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 60Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 50Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 40Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 30Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 20Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
Tabs.Tele:AddButton({
Title = "Teleport 10Km",
        Description = "",
        Callback = function()

game.Players.LocalPlayer:Kick("Update Please Wait :))")
        end
    })
   

local ToggleMirageIsland = Tabs.Main and Tabs.Main:AddToggle("ToggleMirageIsland", {Title = "Esp Box", Default = false })

if ToggleMirageIsland then
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
end

if Options and Options.ToggleMirageIsland then
    Options.ToggleMirageIsland:SetValue(false)
end

spawn(function()
    while wait() do
        if _G.FindMirageIsland then
            -- Preview: https://cdn.discordapp.com/attachments/796378086446333984/818089455897542687/unknown.png
-- Made by Blissful#4992
local Settings = {
    Box_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Color = Color3.fromRGB(255, 0, 0),
    Tracer_Thickness = 1,
    Box_Thickness = 1,
    Tracer_Origin = "Bottom", -- Middle or Bottom if FollowMouse is on this won't matter...
    Tracer_FollowMouse = false,
    Tracers = true
}
local Team_Check = {
    TeamCheck = false, -- if TeamColor is on this won't matter...
    Green = Color3.fromRGB(0, 255, 0),
    Red = Color3.fromRGB(255, 0, 0)
}
local TeamColor = true

--// SEPARATION
local player = game:GetService("Players").LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()

local function NewQuad(thickness, color)
    local quad = Drawing.new("Quad")
    quad.Visible = false
    quad.PointA = Vector2.new(0,0)
    quad.PointB = Vector2.new(0,0)
    quad.PointC = Vector2.new(0,0)
    quad.PointD = Vector2.new(0,0)
    quad.Color = color
    quad.Filled = false
    quad.Thickness = thickness
    quad.Transparency = 1
    return quad
end

local function NewLine(thickness, color)
    local line = Drawing.new("Line")
    line.Visible = false
    line.From = Vector2.new(0, 0)
    line.To = Vector2.new(0, 0)
    line.Color = color 
    line.Thickness = thickness
    line.Transparency = 1
    return line
end

local function Visibility(state, lib)
    for u, x in pairs(lib) do
        x.Visible = state
    end
end

local function ToColor3(col) --Function to convert, just cuz c;
    local r = col.r --Red value
    local g = col.g --Green value
    local b = col.b --Blue value
    return Color3.new(r,g,b); --Color3 datatype, made of the RGB inputs
end

local black = Color3.fromRGB(0, 0 ,0)
local function ESP(plr)
    local library = {
        --//Tracer and Black Tracer(black border)
        blacktracer = NewLine(Settings.Tracer_Thickness*2, black),
        tracer = NewLine(Settings.Tracer_Thickness, Settings.Tracer_Color),
        --//Box and Black Box(black border)
        black = NewQuad(Settings.Box_Thickness*2, black),
        box = NewQuad(Settings.Box_Thickness, Settings.Box_Color),
        --//Bar and Green Health Bar (part that moves up/down)
        healthbar = NewLine(3, black),
        greenhealth = NewLine(1.5, black)
    }

    local function Colorize(color)
        for u, x in pairs(library) do
            if x ~= library.healthbar and x ~= library.greenhealth and x ~= library.blacktracer and x ~= library.black then
                x.Color = color
            end
        end
    end

    local function Updater()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                local HumPos, OnScreen = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local head = camera:WorldToViewportPoint(plr.Character.Head.Position)
                    local DistanceY = math.clamp((Vector2.new(head.X, head.Y) - Vector2.new(HumPos.X, HumPos.Y)).magnitude, 2, math.huge)
                    
                    local function Size(item)
                        item.PointA = Vector2.new(HumPos.X + DistanceY, HumPos.Y - DistanceY*2)
                        item.PointB = Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2)
                        item.PointC = Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)
                        item.PointD = Vector2.new(HumPos.X + DistanceY, HumPos.Y + DistanceY*2)
                    end
                    Size(library.box)
                    Size(library.black)

                    --//Tracer 
                    if Settings.Tracers then
                        if Settings.Tracer_Origin == "Middle" then
                            library.tracer.From = camera.ViewportSize*0.5
                            library.blacktracer.From = camera.ViewportSize*0.5
                        elseif Settings.Tracer_Origin == "Bottom" then
                            library.tracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y) 
                            library.blacktracer.From = Vector2.new(camera.ViewportSize.X*0.5, camera.ViewportSize.Y)
                        end
                        if Settings.Tracer_FollowMouse then
                            library.tracer.From = Vector2.new(mouse.X, mouse.Y+36)
                            library.blacktracer.From = Vector2.new(mouse.X, mouse.Y+36)
                        end
                        library.tracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                        library.blacktracer.To = Vector2.new(HumPos.X, HumPos.Y + DistanceY*2)
                    else 
                        library.tracer.From = Vector2.new(0, 0)
                        library.blacktracer.From = Vector2.new(0, 0)
                        library.tracer.To = Vector2.new(0, 0)
                        library.blacktracer.To = Vector2.new(0, 02)
                    end

                    --// Health Bar
                    local d = (Vector2.new(HumPos.X - DistanceY, HumPos.Y - DistanceY*2) - Vector2.new(HumPos.X - DistanceY, HumPos.Y + DistanceY*2)).magnitude 
                    local healthoffset = plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth * d

                    library.greenhealth.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.greenhealth.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2 - healthoffset)

                    library.healthbar.From = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y + DistanceY*2)
                    library.healthbar.To = Vector2.new(HumPos.X - DistanceY - 4, HumPos.Y - DistanceY*2)

                    local green = Color3.fromRGB(0, 255, 0)
                    local red = Color3.fromRGB(255, 0, 0)

                    library.greenhealth.Color = red:lerp(green, plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth);

                    if Team_Check.TeamCheck then
                        if plr.TeamColor == player.TeamColor then
                            Colorize(Team_Check.Green)
                        else 
                            Colorize(Team_Check.Red)
                        end
                    else 
                        library.tracer.Color = Settings.Tracer_Color
                        library.box.Color = Settings.Box_Color
                    end
                    if TeamColor == true then
                        Colorize(plr.TeamColor.Color)
                    end
                    Visibility(true, library)
                else 
                    Visibility(false, library)
                end
            else 
                Visibility(false, library)
                if game.Players:FindFirstChild(plr.Name) == nil then
                    connection:Disconnect()
                end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= player.Name then
        coroutine.wrap(ESP)(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= player.Name then
        coroutine.wrap(ESP)(newplr)
    end
end)
        end
    end
end)
local boss = Tabs.Main:AddSection("Antiban")
local Toggle1 = Tabs.Main and Tabs.Main:AddToggle("Toggle1", {Title = "Anti Teleport [ Premium ]", Default = false })

if Toggle1 then
    Toggle1:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
end

if Options and Options.Toggle1 then
    Options.Toggle1:SetValue(false)
end

spawn(function()
    while wait() do
        if _G.FindMirageIsland then
     
        end
    end
end)
local ToggleMirageIsland = Tabs.Main and Tabs.Main:AddToggle("ToggleMirageIsland", {Title = "Antiban [ Premium  ]", Default = false })

if ToggleMirageIsland then
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
end

if Options and Options.ToggleMirageIsland then
    Options.ToggleMirageIsland:SetValue(false)
end

spawn(function()
    while wait() do
        if _G.FindMirageIsland then
           
        end
    end
end)
local bosbs = Tabs.Main:AddSection("Comlect")
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"Auto Get Pond"},
        Multi = false,
        Default = 1,
    })
local ToggleMirageIsland = Tabs.Main and Tabs.Main:AddToggle("ToggleMirageIsland", {Title = "Auto Comlect", Default = false })

if ToggleMirageIsland then
    ToggleMirageIsland:OnChanged(function(Value)
        _G.FindMirageIsland = Value
    end)
end

if Options and Options.ToggleMirageIsland then
    Options.ToggleMirageIsland:SetValue(false)
end

spawn(function()
    while wait() do
        if _G.FindMirageIsland then
         
        end
    end
end)

local Slider = Tabs.Pro:AddSlider("Slider", {
        Title = "SpeedMultiplier",
        Description = "",
        Default = 2,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
    game.Players.LocalPlayer.Character:SetAttribute("SpeedMultiplier", Value)
        end
    })
local Slider = Tabs.Pro:AddSlider("Slider", {
        Title = "DashLength",
        Description = "",
        Default = 2,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
      game.Players.LocalPlayer.Character:SetAttribute("DashLength", Value)
        end
    })

