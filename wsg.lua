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
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
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

-- Settings Button
local SettingsButton = Instance.new("TextButton")
SettingsButton.Name = "SettingsButton"
SettingsButton.Parent = TitleBar
SettingsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SettingsButton.Position = UDim2.new(1, -75, 0, 5)
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Text = "⚙"
SettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsButton.Font = Enum.Font.SourceSansBold
SettingsButton.TextSize = 14

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.Parent = SettingsButton
SettingsCorner.CornerRadius = UDim.new(0, 4)

-- Settings Menu
local SettingsMenu = Instance.new("Frame")
SettingsMenu.Name = "SettingsMenu"
SettingsMenu.Parent = MainFrame
SettingsMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SettingsMenu.Position = UDim2.new(0, 0, 0, 30)
SettingsMenu.Size = UDim2.new(1, 0, 1, -30)
SettingsMenu.Visible = false
SettingsMenu.ZIndex = 3

local SettingsMenuCorner = Instance.new("UICorner")
SettingsMenuCorner.Parent = SettingsMenu
SettingsMenuCorner.CornerRadius = UDim.new(0, 8)

-- Settings Title
local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Parent = SettingsMenu
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Position = UDim2.new(0, 10, 0, 5)
SettingsTitle.Size = UDim2.new(1, -20, 0, 20)
SettingsTitle.Font = Enum.Font.SourceSansBold
SettingsTitle.Text = "Settings"
SettingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsTitle.TextSize = 16

-- Color schemes
local colorSchemes = {
    Aqua = {
        main = Color3.fromRGB(0, 170, 255),
        secondary = Color3.fromRGB(0, 140, 210),
        background = Color3.fromRGB(0, 170, 255),
        button = Color3.fromRGB(40, 40, 40),
        text = Color3.fromRGB(255, 255, 255)
    },
    Amethyst = {
        main = Color3.fromRGB(130, 0, 255),
        secondary = Color3.fromRGB(110, 0, 220),
        background = Color3.fromRGB(130, 0, 255),
        button = Color3.fromRGB(40, 40, 40),
        text = Color3.fromRGB(255, 255, 255)
    },
    Dark = {
        main = Color3.fromRGB(40, 40, 40),
        secondary = Color3.fromRGB(30, 30, 30),
        background = Color3.fromRGB(25, 25, 25),
        button = Color3.fromRGB(35, 35, 35),
        text = Color3.fromRGB(255, 255, 255)
    },
    Darker = {
        main = Color3.fromRGB(30, 30, 30),
        secondary = Color3.fromRGB(25, 25, 25),
        background = Color3.fromRGB(20, 20, 20),
        button = Color3.fromRGB(30, 30, 30),
        text = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        main = Color3.fromRGB(200, 200, 200),
        secondary = Color3.fromRGB(180, 180, 180),
        background = Color3.fromRGB(160, 160, 160),
        button = Color3.fromRGB(170, 170, 170),
        text = Color3.fromRGB(0, 0, 0)
    }
}

local function updateColors(colorName)
    if colorName == "Rainbow" then
        -- Rainbow color logic
        if rainbowConnection then
            rainbowConnection:Disconnect()
        end
        
        local hue = 0
        rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function()
            hue = (hue + 1) % 360
            local rainbowColor = Color3.fromHSV(hue/360, 1, 1)
            local darkerRainbow = Color3.fromHSV(hue/360, 1, 0.8)
            
            -- Ana frame ve tablar için rainbow rengi
            MainFrame.BackgroundColor3 = rainbowColor
            TitleBar.BackgroundColor3 = darkerRainbow
            SettingsMenu.BackgroundColor3 = rainbowColor
            AimbotTab.BackgroundColor3 = rainbowColor
            VisualsTab.BackgroundColor3 = rainbowColor
            VisualSettingsTab.BackgroundColor3 = rainbowColor
            
            -- Butonlar için koyu renk
            for _, button in ipairs(TabButtons:GetChildren()) do
                if button:IsA("TextButton") then
                    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                end
            end
            
            -- Diğer butonlar için rainbow rengi
            for _, obj in ipairs(MainFrame:GetDescendants()) do
                if obj:IsA("TextButton") then
                    if obj.Text ~= "X" and obj.Text ~= "-" and obj.Text ~= "ON" and obj.Text ~= "OFF" then
                        obj.BackgroundColor3 = rainbowColor
                    end
                end
            end
        end)
    else
        if rainbowConnection then
            rainbowConnection:Disconnect()
            rainbowConnection = nil
        end
        
        local scheme = colorSchemes[colorName]
        if scheme then
            -- Ana frame ve tablar
            MainFrame.BackgroundColor3 = scheme.background
            TitleBar.BackgroundColor3 = scheme.secondary
            SettingsMenu.BackgroundColor3 = scheme.background
            AimbotTab.BackgroundColor3 = scheme.background
            VisualsTab.BackgroundColor3 = scheme.background
            VisualSettingsTab.BackgroundColor3 = scheme.background
            
            -- Tab butonları
            for _, button in ipairs(TabButtons:GetChildren()) do
                if button:IsA("TextButton") then
                    button.BackgroundColor3 = scheme.button
                end
            end
            
            -- Diğer butonlar
            for _, obj in ipairs(MainFrame:GetDescendants()) do
                if obj:IsA("TextButton") then
                    if obj.Text ~= "X" and obj.Text ~= "-" and obj.Text ~= "ON" and obj.Text ~= "OFF" then
                        obj.BackgroundColor3 = scheme.main
                    end
                elseif obj:IsA("Frame") then
                    if obj.Name:match("Toggle$") or obj.Name:match("Slider$") or obj.Name:match("Dropdown$") then
                        obj.BackgroundColor3 = scheme.button
                    end
                end
            end
        end
    end
end

-- GUI Notifications Toggle
local notificationsToggle = Instance.new("Frame")
notificationsToggle.Name = "NotificationsToggle"
notificationsToggle.Parent = SettingsMenu
notificationsToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
notificationsToggle.Position = UDim2.new(0, 10, 0, 35)
notificationsToggle.Size = UDim2.new(1, -20, 0, 30)

local notificationsToggleCorner = Instance.new("UICorner")
notificationsToggleCorner.Parent = notificationsToggle
notificationsToggleCorner.CornerRadius = UDim.new(0, 6)

local notificationsToggleText = Instance.new("TextLabel")
notificationsToggleText.Parent = notificationsToggle
notificationsToggleText.BackgroundTransparency = 1
notificationsToggleText.Position = UDim2.new(0, 10, 0, 0)
notificationsToggleText.Size = UDim2.new(0, 120, 1, 0)
notificationsToggleText.Font = Enum.Font.SourceSansBold
notificationsToggleText.Text = "GUI Notifications"
notificationsToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationsToggleText.TextSize = 14
notificationsToggleText.TextXAlignment = Enum.TextXAlignment.Left

local notificationsToggleButton = Instance.new("TextButton")
notificationsToggleButton.Parent = notificationsToggle
notificationsToggleButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
notificationsToggleButton.Position = UDim2.new(1, -50, 0.5, -10)
notificationsToggleButton.Size = UDim2.new(0, 40, 0, 20)
notificationsToggleButton.Text = "OFF"
notificationsToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationsToggleButton.Font = Enum.Font.SourceSansBold
notificationsToggleButton.TextSize = 12

local notificationsToggleButtonCorner = Instance.new("UICorner")
notificationsToggleButtonCorner.Parent = notificationsToggleButton
notificationsToggleButtonCorner.CornerRadius = UDim.new(0, 4)

local notificationsToggled = false
notificationsToggleButton.MouseButton1Click:Connect(function()
    notificationsToggled = not notificationsToggled
    notificationsToggleButton.Text = notificationsToggled and "ON" or "OFF"
    notificationsToggleButton.BackgroundColor3 = notificationsToggled and Color3.fromRGB(70, 255, 70) or Color3.fromRGB(255, 70, 70)
end)

-- Başlangıçta açık olarak ayarla
notificationsToggleButton.Text = "ON"
notificationsToggleButton.BackgroundColor3 = Color3.fromRGB(70, 255, 70)

-- GUI Key Bind Button
local keyBindFrame = Instance.new("Frame")
keyBindFrame.Name = "KeyBindFrame"
keyBindFrame.Parent = SettingsMenu
keyBindFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBindFrame.Position = UDim2.new(0, 10, 0, 75)
keyBindFrame.Size = UDim2.new(1, -20, 0, 30)

local keyBindCorner = Instance.new("UICorner")
keyBindCorner.Parent = keyBindFrame
keyBindCorner.CornerRadius = UDim.new(0, 6)

local keyBindText = Instance.new("TextLabel")
keyBindText.Parent = keyBindFrame
keyBindText.BackgroundTransparency = 1
keyBindText.Position = UDim2.new(0, 10, 0, 0)
keyBindText.Size = UDim2.new(0, 100, 1, 0)
keyBindText.Font = Enum.Font.SourceSansBold
keyBindText.Text = "GUI Key"
keyBindText.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBindText.TextSize = 14
keyBindText.TextXAlignment = Enum.TextXAlignment.Left

local keyBindButton = Instance.new("TextButton")
keyBindButton.Parent = keyBindFrame
keyBindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyBindButton.Position = UDim2.new(1, -70, 0.5, -10)
keyBindButton.Size = UDim2.new(0, 60, 0, 20)
keyBindButton.Text = "RightShift"
keyBindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBindButton.Font = Enum.Font.SourceSansBold
keyBindButton.TextSize = 12

local keyBindButtonCorner = Instance.new("UICorner")
keyBindButtonCorner.Parent = keyBindButton
keyBindButtonCorner.CornerRadius = UDim.new(0, 4)

local listening = false
local guiVisible = true
local selectedKey = Enum.KeyCode.RightShift

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == selectedKey then
        guiVisible = not guiVisible
        MainFrame.Visible = guiVisible
    end
end)

keyBindButton.MouseButton1Click:Connect(function()
    if not listening then
        listening = true
        keyBindButton.Text = "..."
        
        local connection
        connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                selectedKey = input.KeyCode
                keyBindButton.Text = input.KeyCode.Name
                listening = false
                connection:Disconnect()
            end
        end)
    end
end)

-- GUI Color Dropdown
local guiColorDropdown = Instance.new("Frame")
guiColorDropdown.Name = "GuiColorDropdown"
guiColorDropdown.Parent = SettingsMenu
guiColorDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
guiColorDropdown.Position = UDim2.new(0, 10, 0, 115)
guiColorDropdown.Size = UDim2.new(1, -20, 0, 30)

local guiColorDropdownCorner = Instance.new("UICorner")
guiColorDropdownCorner.Parent = guiColorDropdown
guiColorDropdownCorner.CornerRadius = UDim.new(0, 6)

local guiColorDropdownText = Instance.new("TextLabel")
guiColorDropdownText.Parent = guiColorDropdown
guiColorDropdownText.BackgroundTransparency = 1
guiColorDropdownText.Position = UDim2.new(0, 10, 0, 0)
guiColorDropdownText.Size = UDim2.new(0, 120, 1, 0)
guiColorDropdownText.Font = Enum.Font.SourceSansBold
guiColorDropdownText.Text = "GUI Color"
guiColorDropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
guiColorDropdownText.TextSize = 14
guiColorDropdownText.TextXAlignment = Enum.TextXAlignment.Left

local guiColorDropdownButton = Instance.new("TextButton")
guiColorDropdownButton.Parent = guiColorDropdown
guiColorDropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
guiColorDropdownButton.Position = UDim2.new(1, -70, 0.5, -10)
guiColorDropdownButton.Size = UDim2.new(0, 60, 0, 20)
guiColorDropdownButton.Text = "Dark"
guiColorDropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
guiColorDropdownButton.Font = Enum.Font.SourceSansBold
guiColorDropdownButton.TextSize = 12

local guiColorDropdownButtonCorner = Instance.new("UICorner")
guiColorDropdownButtonCorner.Parent = guiColorDropdownButton
guiColorDropdownButtonCorner.CornerRadius = UDim.new(0, 4)

local guiColorDropdownMenu = Instance.new("Frame")
guiColorDropdownMenu.Parent = guiColorDropdown
guiColorDropdownMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
guiColorDropdownMenu.Position = UDim2.new(1, -70, 1, 5)
guiColorDropdownMenu.Size = UDim2.new(0, 60, 0, #{"Aqua", "Amethyst", "Dark", "Darker", "Light", "Rainbow"} * 25)
guiColorDropdownMenu.Visible = false
guiColorDropdownMenu.ZIndex = 2

local guiColorDropdownMenuCorner = Instance.new("UICorner")
guiColorDropdownMenuCorner.Parent = guiColorDropdownMenu
guiColorDropdownMenuCorner.CornerRadius = UDim.new(0, 4)

-- GUI Color Dropdown Options
local guiColorOptions = {"Aqua", "Amethyst", "Dark", "Darker", "Light", "Rainbow"}
for i, option in ipairs(guiColorOptions) do
    local optionButton = Instance.new("TextButton")
    optionButton.Name = option .. "Option"
    optionButton.Parent = guiColorDropdownMenu
    optionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 25)
    optionButton.Size = UDim2.new(1, 0, 0, 25)
    optionButton.Font = Enum.Font.SourceSans
    optionButton.Text = option
    optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionButton.TextSize = 14
    optionButton.ZIndex = 11

    local optionCorner = Instance.new("UICorner")
    optionCorner.Parent = optionButton
    optionCorner.CornerRadius = UDim.new(0, 6)

    optionButton.MouseButton1Click:Connect(function()
        guiColorDropdownButton.Text = option
        guiColorDropdownMenu.Visible = false
        updateColors(option)
    end)
end

-- Başlangıçta Dark rengini ayarla
updateColors("Dark")

guiColorDropdownButton.MouseButton1Click:Connect(function()
    guiColorDropdownMenu.Visible = not guiColorDropdownMenu.Visible
end)

-- Rainbow fonksiyonu
local isRainbow = false
local rainbowConnection

-- Settings button functionality
SettingsButton.MouseButton1Click:Connect(function()
    SettingsMenu.Visible = not SettingsMenu.Visible
    AimbotTab.Visible = not SettingsMenu.Visible
    VisualsTab.Visible = false
    VisualSettingsTab.Visible = false
end)

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
        MainFrame:TweenSize(UDim2.new(0, 600, 0, 30), "Out", "Quad", 0.3, true)
    else
        MainFrame:TweenSize(UDim2.new(0, 600, 0, 400), "Out", "Quad", 0.3, true)
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
    button.Size = UDim2.new(0, 200, 1, 0)
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
    
    -- Add rounded corners to tab frames
    local TabCorner = Instance.new("UICorner")
    TabCorner.Parent = frame
    TabCorner.CornerRadius = UDim.new(0, 8)
    
    return frame
end

AimbotTab = CreateTabFrame("Aimbot")
VisualsTab = CreateTabFrame("Visuals")
VisualSettingsTab = CreateTabFrame("VisualSettings")

-- Create Aimbot Tab Elements
local function createToggle(parent, text, position)
    local toggle = Instance.new("Frame")
    toggle.Name = text.."Toggle"
    toggle.Parent = parent
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggle.Position = position
    toggle.Size = UDim2.new(0, 180, 0, 30)
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.Parent = toggle
    toggleCorner.CornerRadius = UDim.new(0, 6)
    
    local toggleText = Instance.new("TextLabel")
    toggleText.Parent = toggle
    toggleText.BackgroundTransparency = 1
    toggleText.Position = UDim2.new(0, 10, 0, 0)
    toggleText.Size = UDim2.new(0, 120, 1, 0)
    toggleText.Font = Enum.Font.SourceSansBold
    toggleText.Text = text
    toggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.TextSize = 14
    toggleText.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = toggle
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    toggleButton.Position = UDim2.new(1, -50, 0.5, -10)
    toggleButton.Size = UDim2.new(0, 40, 0, 20)
    toggleButton.Text = "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextSize = 12
    
    local toggleButtonCorner = Instance.new("UICorner")
    toggleButtonCorner.Parent = toggleButton
    toggleButtonCorner.CornerRadius = UDim.new(0, 4)
    
    local toggled = false
    toggleButton.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggleButton.Text = toggled and "ON" or "OFF"
        toggleButton.BackgroundColor3 = toggled and Color3.fromRGB(70, 255, 70) or Color3.fromRGB(255, 70, 70)
    end)
    
    return toggle
end

local function createSlider(parent, text, position, min, max, default)
    local slider = Instance.new("Frame")
    slider.Name = text.."Slider"
    slider.Parent = parent
    slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    slider.Position = position
    slider.Size = UDim2.new(0, 180, 0, 50)
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.Parent = slider
    sliderCorner.CornerRadius = UDim.new(0, 6)
    
    local sliderText = Instance.new("TextLabel")
    sliderText.Parent = slider
    sliderText.BackgroundTransparency = 1
    sliderText.Position = UDim2.new(0, 10, 0, 5)
    sliderText.Size = UDim2.new(1, -20, 0, 20)
    sliderText.Font = Enum.Font.SourceSansBold
    sliderText.Text = text..": "..default
    sliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    sliderText.TextSize = 14
    sliderText.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBar = Instance.new("TextButton")
    sliderBar.Parent = slider
    sliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sliderBar.Position = UDim2.new(0, 10, 0, 30)
    sliderBar.Size = UDim2.new(1, -20, 0, 5)
    sliderBar.Text = ""
    sliderBar.AutoButtonColor = false
    
    local sliderBarCorner = Instance.new("UICorner")
    sliderBarCorner.Parent = sliderBar
    sliderBarCorner.CornerRadius = UDim.new(0, 2)
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderBar
    sliderFill.BackgroundColor3 = Color3.fromRGB(70, 255, 70)
    sliderFill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    
    local sliderFillCorner = Instance.new("UICorner")
    sliderFillCorner.Parent = sliderFill
    sliderFillCorner.CornerRadius = UDim.new(0, 2)
    
    local value = default
    local dragging = false
    
    sliderBar.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = game:GetService("UserInputService"):GetMouseLocation()
            local relativePos = mousePos.X - sliderBar.AbsolutePosition.X
            local percentage = math.clamp(relativePos / sliderBar.AbsoluteSize.X, 0, 1)
            value = min + (max - min) * percentage
            sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            sliderText.Text = text..": "..math.floor(value)
        end
    end)
    
    return slider
end

local function createDropdown(parent, text, position, options)
    local dropdown = Instance.new("Frame")
    dropdown.Name = text.."Dropdown"
    dropdown.Parent = parent
    dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    dropdown.Position = position
    dropdown.Size = UDim2.new(0, 180, 0, 30)
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.Parent = dropdown
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    
    local dropdownText = Instance.new("TextLabel")
    dropdownText.Parent = dropdown
    dropdownText.BackgroundTransparency = 1
    dropdownText.Position = UDim2.new(0, 10, 0, 0)
    dropdownText.Size = UDim2.new(0, 120, 1, 0)
    dropdownText.Font = Enum.Font.SourceSansBold
    dropdownText.Text = text
    dropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownText.TextSize = 14
    dropdownText.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdownButton = Instance.new("TextButton")
    dropdownButton.Parent = dropdown
    dropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dropdownButton.Position = UDim2.new(1, -70, 0.5, -10)
    dropdownButton.Size = UDim2.new(0, 60, 0, 20)
    dropdownButton.Text = options[1]
    dropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdownButton.Font = Enum.Font.SourceSansBold
    dropdownButton.TextSize = 12
    
    local dropdownButtonCorner = Instance.new("UICorner")
    dropdownButtonCorner.Parent = dropdownButton
    dropdownButtonCorner.CornerRadius = UDim.new(0, 4)
    
    local dropdownMenu = Instance.new("Frame")
    dropdownMenu.Parent = dropdown
    dropdownMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dropdownMenu.Position = UDim2.new(1, -70, 1, 5)
    dropdownMenu.Size = UDim2.new(0, 60, 0, #options * 25)
    dropdownMenu.Visible = false
    dropdownMenu.ZIndex = 2
    
    local dropdownMenuCorner = Instance.new("UICorner")
    dropdownMenuCorner.Parent = dropdownMenu
    dropdownMenuCorner.CornerRadius = UDim.new(0, 4)
    
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Parent = dropdownMenu
        optionButton.BackgroundTransparency = 1
        optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 25)
        optionButton.Size = UDim2.new(1, 0, 0, 25)
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionButton.Font = Enum.Font.SourceSansBold
        optionButton.TextSize = 12
        optionButton.ZIndex = 2
        
        optionButton.MouseButton1Click:Connect(function()
            dropdownButton.Text = option
            dropdownMenu.Visible = false
        end)
    end
    
    dropdownButton.MouseButton1Click:Connect(function()
        dropdownMenu.Visible = not dropdownMenu.Visible
    end)
    
    return dropdown
end

-- Visuals Tab Elements
local function createVisualsElements()
    -- Box ESP Toggle
    local boxEspToggle = createToggle(VisualsTab, "Box ESP", UDim2.new(0, 10, 0, 10))
    boxEspToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Highlight Toggle
    local highlightToggle = createToggle(VisualsTab, "Highlight", UDim2.new(0, 10, 0, 50))
    highlightToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Skeleton ESP Toggle
    local skeletonEspToggle = createToggle(VisualsTab, "Skeleton ESP", UDim2.new(0, 10, 0, 90))
    skeletonEspToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Tracers Toggle
    local tracersToggle = createToggle(VisualsTab, "Tracers", UDim2.new(0, 10, 0, 130))
    tracersToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Name ESP Toggle
    local nameEspToggle = createToggle(VisualsTab, "Name ESP", UDim2.new(0, 10, 0, 170))
    nameEspToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Team Check Toggle
    local teamCheckToggle = createToggle(VisualsTab, "Team Check", UDim2.new(0, 10, 0, 210))
    teamCheckToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Team Color Toggle
    local teamColorToggle = createToggle(VisualsTab, "Team Color", UDim2.new(0, 10, 0, 250))
    teamColorToggle.Size = UDim2.new(1, -20, 0, 30)

    -- Health ESP Toggle
    local healthEspToggle = createToggle(VisualsTab, "Health ESP", UDim2.new(0, 10, 0, 290))
    healthEspToggle.Size = UDim2.new(1, -20, 0, 30)
end

-- Create Visuals Elements
createVisualsElements()

-- Add elements to Aimbot tab
local fovToggle = createToggle(AimbotTab, "FOV", UDim2.new(0, 20, 0, 20))
local aimbotToggle = createToggle(AimbotTab, "Aimbot", UDim2.new(0, 20, 0, 70))
local aimbotSmooth = createSlider(AimbotTab, "Aimbot Smooth", UDim2.new(0, 20, 0, 120), 1, 10, 5)
local aimbotTarget = createDropdown(AimbotTab, "Aimbot Target", UDim2.new(0, 20, 0, 190), {"Head", "Torso"})

-- Show first tab by default
AimbotTab.Visible = true

-- Tab Switching Logic
local function SwitchTab(selectedTab)
    AimbotTab.Visible = false
    VisualsTab.Visible = false
    VisualSettingsTab.Visible = false
    SettingsMenu.Visible = false
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

-- Key binding functionality
local guiVisible = true
local selectedKey = Enum.KeyCode.RightShift

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == selectedKey then
        guiVisible = not guiVisible
        MainFrame.Visible = guiVisible
    end
end)

keyBindButton.MouseButton1Click:Connect(function()
    if not listening then
        listening = true
        keyBindButton.Text = "..."
        
        local connection
        connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                selectedKey = input.KeyCode
                keyBindButton.Text = input.KeyCode.Name
                listening = false
                connection:Disconnect()
            end
        end)
    end
end)
