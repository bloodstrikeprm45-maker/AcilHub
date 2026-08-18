--[[
==================================================
                    ACIL HUB
==================================================
    Blox Fruits Only
    Free Version
    Created by Acil
==================================================
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local HUB_NAME = "Acil Hub"
local VERSION = "v1.0.0"
local CREATOR = "Acil"
local DISCORD = "discord.gg/yourserver"

-- GANTI DENGAN REPOSITORY GITHUB KAMU
local BLOXFRUITS_URL =
    "https://raw.githubusercontent.com/AcilOfficial/AcilHub/main/Games/BloxFruits.lua"

-- Blox Fruits Game ID
local BLOXFRUITS_GAME_ID = 2753915549

--==================================================
-- CHECK GAME
--==================================================

if game.GameId ~= BLOXFRUITS_GAME_ID then
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = HUB_NAME,
            Text = "Acil Hub hanya tersedia untuk Blox Fruits.",
            Duration = 5
        })
    end)

    return
end

--==================================================
-- FUNCTIONS
--==================================================

local function Tween(object, properties, duration)
    local tween = TweenService:Create(
        object,
        TweenInfo.new(
            duration or 0.25,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

local function Notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 4
        })
    end)
end

--==================================================
-- GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AcilHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

--==================================================
-- BACKDROP
--==================================================

local Backdrop = Instance.new("Frame")
Backdrop.Size = UDim2.fromScale(1, 1)
Backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Backdrop.BackgroundTransparency = 1
Backdrop.BorderSizePixel = 0
Backdrop.ZIndex = 1
Backdrop.Parent = ScreenGui

--==================================================
-- MAIN CARD
--==================================================

local Card = Instance.new("Frame")
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.Position = UDim2.fromScale(0.5, 0.5)
Card.Size = UDim2.fromOffset(420, 270)
Card.BackgroundColor3 = Color3.fromRGB(10, 7, 18)
Card.BorderSizePixel = 0
Card.ZIndex = 10
Card.Parent = ScreenGui

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 14)
CardCorner.Parent = Card

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(130, 70, 255)
CardStroke.Transparency = 0.35
CardStroke.Thickness = 1
CardStroke.Parent = Card

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 48)
Header.BackgroundColor3 = Color3.fromRGB(14, 9, 25)
Header.BorderSizePixel = 0
Header.ZIndex = 11
Header.Parent = Card

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 14)
HeaderCorner.Parent = Header

local HeaderFix = Instance.new("Frame")
HeaderFix.Position = UDim2.new(0, 0, 0.5, 0)
HeaderFix.Size = UDim2.new(1, 0, 0.5, 0)
HeaderFix.BackgroundColor3 = Header.BackgroundColor3
HeaderFix.BorderSizePixel = 0
HeaderFix.ZIndex = 11
HeaderFix.Parent = Header

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.fromOffset(16, 5)
Title.Size = UDim2.new(1, -100, 0, 22)
Title.Font = Enum.Font.GothamBold
Title.Text = HUB_NAME
Title.TextColor3 = Color3.fromRGB(220, 200, 255)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 12
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.fromOffset(17, 27)
Subtitle.Size = UDim2.new(1, -100, 0, 15)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "Blox Fruits • Free"
Subtitle.TextColor3 = Color3.fromRGB(130, 110, 160)
Subtitle.TextSize = 9
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 12
Subtitle.Parent = Header

--==================================================
-- VERSION BADGE
--==================================================

local Badge = Instance.new("Frame")
Badge.AnchorPoint = Vector2.new(1, 0.5)
Badge.Position = UDim2.new(1, -40, 0.5, 0)
Badge.Size = UDim2.fromOffset(60, 22)
Badge.BackgroundColor3 = Color3.fromRGB(35, 20, 70)
Badge.BorderSizePixel = 0
Badge.ZIndex = 12
Badge.Parent = Header

local BadgeCorner = Instance.new("UICorner")
BadgeCorner.CornerRadius = UDim.new(0, 6)
BadgeCorner.Parent = Badge

local BadgeText = Instance.new("TextLabel")
BadgeText.Size = UDim2.fromScale(1, 1)
BadgeText.BackgroundTransparency = 1
BadgeText.Font = Enum.Font.GothamBold
BadgeText.Text = "FREE"
BadgeText.TextColor3 = Color3.fromRGB(180, 140, 255)
BadgeText.TextSize = 9
BadgeText.ZIndex = 13
BadgeText.Parent = Badge

--==================================================
-- CLOSE BUTTON
--==================================================

local Close = Instance.new("TextButton")
Close.AnchorPoint = Vector2.new(1, 0.5)
Close.Position = UDim2.new(1, -8, 0.5, 0)
Close.Size = UDim2.fromOffset(24, 24)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.Font = Enum.Font.GothamBold
Close.TextColor3 = Color3.fromRGB(190, 100, 110)
Close.TextSize = 22
Close.AutoButtonColor = false
Close.ZIndex = 13
Close.Parent = Header

Close.MouseEnter:Connect(function()
    Tween(Close, {
        TextColor3 = Color3.fromRGB(255, 70, 80)
    }, 0.12)
end)

Close.MouseLeave:Connect(function()
    Tween(Close, {
        TextColor3 = Color3.fromRGB(190, 100, 110)
    }, 0.12)
end)

--==================================================
-- INFO BOX
--==================================================

local Info = Instance.new("Frame")
Info.Position = UDim2.fromOffset(14, 62)
Info.Size = UDim2.new(1, -28, 0, 105)
Info.BackgroundColor3 = Color3.fromRGB(14, 9, 25)
Info.BackgroundTransparency = 0.1
Info.BorderSizePixel = 0
Info.ZIndex = 11
Info.Parent = Card

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 9)
InfoCorner.Parent = Info

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromRGB(100, 60, 180)
InfoStroke.Transparency = 0.55
InfoStroke.Thickness = 1
InfoStroke.Parent = Info

local InfoTitle = Instance.new("TextLabel")
InfoTitle.Position = UDim2.fromOffset(12, 8)
InfoTitle.Size = UDim2.new(1, -24, 0, 17)
InfoTitle.BackgroundTransparency = 1
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.Text = "Information"
InfoTitle.TextColor3 = Color3.fromRGB(170, 130, 240)
InfoTitle.TextSize = 11
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.ZIndex = 12
InfoTitle.Parent = Info

local Divider = Instance.new("Frame")
Divider.Position = UDim2.fromOffset(12, 29)
Divider.Size = UDim2.new(1, -24, 0, 1)
Divider.BackgroundColor3 = Color3.fromRGB(100, 60, 180)
Divider.BackgroundTransparency = 0.6
Divider.BorderSizePixel = 0
Divider.ZIndex = 12
Divider.Parent = Info

local function MakeInfo(label, value, y)
    local L = Instance.new("TextLabel")
    L.Position = UDim2.fromOffset(12, y)
    L.Size = UDim2.fromOffset(75, 15)
    L.BackgroundTransparency = 1
    L.Font = Enum.Font.GothamBold
    L.Text = label
    L.TextColor3 = Color3.fromRGB(105, 85, 135)
    L.TextSize = 9
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.ZIndex = 12
    L.Parent = Info

    local V = Instance.new("TextLabel")
    V.Position = UDim2.fromOffset(82, y)
    V.Size = UDim2.new(1, -94, 15)
    V.BackgroundTransparency = 1
    V.Font = Enum.Font.Gotham
    V.Text = value
    V.TextColor3 = Color3.fromRGB(190, 170, 220)
    V.TextSize = 9
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.TextTruncate = Enum.TextTruncate.AtEnd
    V.ZIndex = 12
    V.Parent = Info
end

MakeInfo("Game", "Blox Fruits", 37)
MakeInfo("Version", VERSION, 54)
MakeInfo("Creator", CREATOR, 71)
MakeInfo("Discord", DISCORD, 88)

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")
Status.Position = UDim2.fromOffset(14, 176)
Status.Size = UDim2.new(1, -28, 0, 18)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.GothamBold
Status.Text = "Ready to launch"
Status.TextColor3 = Color3.fromRGB(120, 220, 150)
Status.TextSize = 10
Status.TextXAlignment = Enum.TextXAlignment.Center
Status.ZIndex = 12
Status.Parent = Card

--==================================================
-- EXECUTE BUTTON
--==================================================

local Execute = Instance.new("TextButton")
Execute.Position = UDim2.fromOffset(14, 202)
Execute.Size = UDim2.new(1, -28, 0, 42)
Execute.BackgroundColor3 = Color3.fromRGB(75, 35, 150)
Execute.BorderSizePixel = 0
Execute.AutoButtonColor = false
Execute.Text = "EXECUTE ACIL HUB"
Execute.Font = Enum.Font.GothamBold
Execute.TextColor3 = Color3.fromRGB(235, 220, 255)
Execute.TextSize = 12
Execute.ZIndex = 12
Execute.Parent = Card

local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 9)
ExecuteCorner.Parent = Execute

local ExecuteStroke = Instance.new("UIStroke")
ExecuteStroke.Color = Color3.fromRGB(150, 90, 255)
ExecuteStroke.Transparency = 0.35
ExecuteStroke.Parent = Execute

--==================================================
-- FOOTER
--==================================================

local Footer = Instance.new("TextLabel")
Footer.Position = UDim2.fromOffset(14, 249)
Footer.Size = UDim2.new(1, -28, 0, 15)
Footer.BackgroundTransparency = 1
Footer.Font = Enum.Font.Gotham
Footer.Text = "Acil Hub • Blox Fruits Only"
Footer.TextColor3 = Color3.fromRGB(90, 75, 110)
Footer.TextSize = 8
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.ZIndex = 12
Footer.Parent = Card

--==================================================
-- BUTTON EFFECT
--==================================================

Execute.MouseEnter:Connect(function()
    Tween(Execute, {
        BackgroundColor3 = Color3.fromRGB(100, 50, 190)
    }, 0.15)
end)

Execute.MouseLeave:Connect(function()
    Tween(Execute, {
        BackgroundColor3 = Color3.fromRGB(75, 35, 150)
    }, 0.15)
end)

--==================================================
-- CLOSE
--==================================================

local function CloseUI()
    Tween(Card, {
        Size = UDim2.fromOffset(380, 240)
    }, 0.2)

    Tween(Backdrop, {
        BackgroundTransparency = 1
    }, 0.2)

    task.wait(0.22)

    ScreenGui:Destroy()
end

Close.MouseButton1Click:Connect(CloseUI)

--==================================================
-- EXECUTE BLOX FRUITS
--==================================================

local executing = false

Execute.MouseButton1Click:Connect(function()
    if executing then
        return
    end

    executing = true

    Status.Text = "Loading BloxFruits.lua..."
    Status.TextColor3 = Color3.fromRGB(180, 150, 255)

    Execute.Text = "LOADING..."

    task.spawn(function()

        local success, result = pcall(function()

            local response = game:HttpGet(BLOXFRUITS_URL)

            if not response or response == "" then
                error("BloxFruits.lua kosong atau tidak ditemukan.")
            end

            local func, compileError = loadstring(response)

            if not func then
                error(compileError)
            end

            return func()

        end)

        if success then

            Status.Text = "BloxFruits.lua loaded successfully"
            Status.TextColor3 = Color3.fromRGB(90, 230, 140)

            Execute.Text = "LOADED"

            Notify(
                HUB_NAME,
                "BloxFruits.lua berhasil dijalankan."
            )

            task.wait(0.8)
            CloseUI()

        else

            Status.Text = "Failed to load script"
            Status.TextColor3 = Color3.fromRGB(255, 100, 110)

            Execute.Text = "TRY AGAIN"

            warn("[Acil Hub] " .. tostring(result))

            Notify(
                HUB_NAME,
                "Gagal menjalankan BloxFruits.lua."
            )

            executing = false

        end

    end)
end)

--==================================================
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragStart
local startPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Card.Position

        input.Changed:Connect(function()

            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end

        end)

    end

end)

UserInputService.InputChanged:Connect(function(input)

    if not dragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        Card.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )

    end

end)

--==================================================
-- OPEN ANIMATION
--==================================================

Card.Size = UDim2.fromOffset(350, 220)

Tween(Backdrop, {
    BackgroundTransparency = 0.5
}, 0.3)

Tween(Card, {
    Size = UDim2.fromOffset(420, 270)
}, 0.4)

Notify(
    HUB_NAME,
    "Acil Hub siap digunakan."
)
