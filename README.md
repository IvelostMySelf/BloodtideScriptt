local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabButtons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local AimbotButton = Instance.new("TextButton")
local VisualsButton = Instance.new("TextButton")
local VisualSettingsButton = Instance.new("TextButton")
local TabFrames = Instance.new("Frame")
local AimbotTab = Instance.new("Frame")
local VisualsTab = Instance.new("Frame")
local VisualSettingsTab = Instance.new("Frame")

-- GUI Setup
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.ClipsDescendants = true

-- Add rounded corners to all sides
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 8)

-- Create bottom frame to remove bottom rounded corners
local BottomFrame = Instance.new("Frame")
BottomFrame.Name = "BottomFrame"
BottomFrame.Parent = MainFrame
BottomFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BottomFrame.BorderSizePixel = 0
BottomFrame.Position = UDim2.new(0, 0, 0.5, 0)
BottomFrame.Size = UDim2.new(1, 0, 0.5, 0)

-- Create Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBar.Size = UDim2.new(1, 0, 0, 30)

-- Add rounded corners to title bar
local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.Parent = TitleBar
TitleBarCorner.CornerRadius = UDim.new(0, 8)

-- Make only top corners rounded
local TitleBarFix = Instance.new("Frame")
TitleBarFix.Parent = TitleBar
TitleBarFix.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleBarFix.Size = UDim2.new(1, 0, 0.5, 0)

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 14

-- Add rounded corners to close button
local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.Parent = CloseButton
CloseButtonCorner.CornerRadius = UDim.new(0, 4)

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinimizeButton.Position = UDim2.new(1, -50, 0, 5)
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 14

-- Add rounded corners to minimize button
local MinimizeButtonCorner = Instance.new("UICorner")
MinimizeButtonCorner.Parent = MinimizeButton
MinimizeButtonCorner.CornerRadius = UDim.new(0, 4)

-- Make GUI draggable
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.1), {
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    }):Play()
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        updateDrag(input)
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize button functionality
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MainFrame:TweenSize(UDim2.new(0, 400, 0, 30), "Out", "Quad", 0.3, true)
    else
        MainFrame:TweenSize(UDim2.new(0, 400, 0, 300), "Out", "Quad", 0.3, true)
    end
end)

-- Tab Buttons Setup
TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabButtons.Position = UDim2.new(0, 0, 0, 30)
TabButtons.Size = UDim2.new(1, 0, 0, 30)

UIListLayout.Parent = TabButtons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Create Tab Buttons
local function CreateTabButton(name)
    local button = Instance.new("TextButton")
    button.Name = name.."Button"
    button.Parent = TabButtons
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Size = UDim2.new(0, 133, 1, 0)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    return button
end

AimbotButton = CreateTabButton("Aimbot")
VisualsButton = CreateTabButton("Visuals")
VisualSettingsButton = CreateTabButton("Visual Settings")

-- Tab Frames Setup
TabFrames.Name = "TabFrames"
TabFrames.Parent = MainFrame
TabFrames.BackgroundTransparency = 1
TabFrames.Position = UDim2.new(0, 0, 0, 60)
TabFrames.Size = UDim2.new(1, 0, 1, -60)

-- Create Tab Frames
local function CreateTabFrame(name)
    local frame = Instance.new("Frame")
    frame.Name = name.."Tab"
    frame.Parent = TabFrames
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Visible = false
    return frame
end

AimbotTab = CreateTabFrame("Aimbot")
VisualsTab = CreateTabFrame("Visuals")
VisualSettingsTab = CreateTabFrame("VisualSettings")

-- Show first tab by default
AimbotTab.Visible = true

-- Tab Switching Logic
local function SwitchTab(selectedTab)
    AimbotTab.Visible = false
    VisualsTab.Visible = false
    VisualSettingsTab.Visible = false
    selectedTab.Visible = true
end

AimbotButton.MouseButton1Click:Connect(function()
    SwitchTab(AimbotTab)
end)

VisualsButton.MouseButton1Click:Connect(function()
    SwitchTab(VisualsTab)
end)

VisualSettingsButton.MouseButton1Click:Connect(function()
    SwitchTab(VisualSettingsTab)
end)
