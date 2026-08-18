--[[
==================================================
              ACIL HUB - BLOX FRUITS
==================================================
    Game     : Blox Fruits
    Version  : v1.0.0
    Creator  : Acil
==================================================
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local HUB_NAME = "Acil Hub"
local VERSION = "v1.0.0"

--==================================================
-- GAME CHECK
--==================================================

if game.GameId ~= 2753915549 then
    warn("[Acil Hub] Script ini hanya untuk Blox Fruits.")
    return
end

--==================================================
-- NOTIFICATION
--==================================================

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = HUB_NAME,
        Text = "Blox Fruits berhasil dimuat!",
        Duration = 4
    })
end)

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "AcilHub_BloxFruits"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

pcall(function()
    Gui.Parent = game:GetService("CoreGui")
end)

if not Gui.Parent then
    Gui.Parent = Player:WaitForChild("PlayerGui")
end

--==================================================
-- MAIN
--==================================================

local Main = Instance.new("Frame")
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.fromOffset(360, 230)
Main.BackgroundColor3 = Color3.fromRGB(10, 7, 18)
Main.BorderSizePixel = 0
Main.Parent = Gui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(130, 70, 255)
Stroke.Transparency = 0.3
Stroke.Thickness = 1
Stroke.Parent = Main

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(16, 10, 28)
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local HeaderFix = Instance.new("Frame")
HeaderFix.Position = UDim2.new(0, 0, 0.5, 0)
HeaderFix.Size = UDim2.new(1, 0, 0.5, 0)
HeaderFix.BackgroundColor3 = Header.BackgroundColor3
HeaderFix.BorderSizePixel = 0
HeaderFix.Parent = Header

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(15, 5)
Title.Size = UDim2.new(1, -70, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "Acil Hub"
Title.TextColor3 = Color3.fromRGB(225, 205, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.fromOffset(16, 25)
SubTitle.Size = UDim2.new(1, -70, 0, 14)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Blox Fruits • Free"
SubTitle.TextColor3 = Color3.fromRGB(130, 110, 160)
SubTitle.TextSize = 9
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = Header

--==================================================
-- CLOSE
--==================================================

local Close = Instance.new("TextButton")
Close.AnchorPoint = Vector2.new(1, 0.5)
Close.Position = UDim2.new(1, -10, 0.5, 0)
Close.Size = UDim2.fromOffset(24, 24)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.fromRGB(200, 90, 100)
Close.TextSize = 22
Close.AutoButtonColor = false
Close.Parent = Header

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

--==================================================
-- INFO
--==================================================

local Info = Instance.new("Frame")
Info.Position = UDim2.fromOffset(14, 58)
Info.Size = UDim2.new(1, -28, 0, 110)
Info.BackgroundColor3 = Color3.fromRGB(15, 10, 25)
Info.BorderSizePixel = 0
Info.Parent = Main

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 9)
InfoCorner.Parent = Info

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromRGB(100, 60, 180)
InfoStroke.Transparency = 0.55
InfoStroke.Parent = Info

local InfoTitle = Instance.new("TextLabel")
InfoTitle.BackgroundTransparency = 1
InfoTitle.Position = UDim2.fromOffset(12, 8)
InfoTitle.Size = UDim2.new(1, -24, 0, 18)
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.Text = "Blox Fruits Information"
InfoTitle.TextColor3 = Color3.fromRGB(170, 130, 240)
InfoTitle.TextSize = 11
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.Parent = Info

local function InfoRow(label, value, y)

    local L = Instance.new("TextLabel")
    L.BackgroundTransparency = 1
    L.Position = UDim2.fromOffset(12, y)
    L.Size = UDim2.fromOffset(75, 15)
    L.Font = Enum.Font.GothamBold
    L.Text = label
    L.TextColor3 = Color3.fromRGB(100, 80, 130)
    L.TextSize = 9
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = Info

    local V = Instance.new("TextLabel")
    V.BackgroundTransparency = 1
    V.Position = UDim2.fromOffset(82, y)
    V.Size = UDim2.new(1, -94, 0, 15)
    V.Font = Enum.Font.Gotham
    V.Text = value
    V.TextColor3 = Color3.fromRGB(195, 175, 220)
    V.TextSize = 9
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.Parent = Info

end

InfoRow("Player", Player.DisplayName, 32)
InfoRow("Username", "@" .. Player.Name, 49)
InfoRow("Game", "Blox Fruits", 66)
InfoRow("Version", VERSION, 83)

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")
Status.BackgroundTransparency = 1
Status.Position = UDim2.fromOffset(14, 174)
Status.Size = UDim2.new(1, -28, 0, 15)
Status.Font = Enum.Font.GothamBold
Status.Text = "Acil Hub aktif"
Status.TextColor3 = Color3.fromRGB(100, 220, 140)
Status.TextSize = 9
Status.TextXAlignment = Enum.TextXAlignment.Center
Status.Parent = Main

--==================================================
-- FOOTER
--==================================================

local Footer = Instance.new("TextLabel")
Footer.BackgroundTransparency = 1
Footer.Position = UDim2.fromOffset(14, 196)
Footer.Size = UDim2.new(1, -28, 0, 20)
Footer.Font = Enum.Font.Gotham
Footer.Text = "Acil Hub • Blox Fruits Only"
Footer.TextColor3 = Color3.fromRGB(90, 75, 110)
Footer.TextSize = 8
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.Parent = Main

--==================================================
-- ANIMATION
--==================================================

Main.Size = UDim2.fromOffset(300, 190)

TweenService:Create(
    Main,
    TweenInfo.new(
        0.35,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = UDim2.fromOffset(360, 230)
    }
):Play()

print("[Acil Hub] Blox Fruits module loaded.")
