local TextChatService = game:GetService("TextChatService")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MessageInput = Instance.new("TextBox")
local DelayInput = Instance.new("TextBox")
local StartButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- GUI Setup
ScreenGui.Parent = CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseButton.Position = UDim2.new(1, -25, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.BorderSizePixel = 0

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Size = UDim2.new(1, -25, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Message Spammer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

MessageInput.Parent = MainFrame
MessageInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MessageInput.Position = UDim2.new(0.1, 0, 0.2, 0)
MessageInput.Size = UDim2.new(0.8, 0, 0, 30)
MessageInput.Font = Enum.Font.SourceSans
MessageInput.PlaceholderText = "Enter your message here..."
MessageInput.Text = ""
MessageInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageInput.TextSize = 14

DelayInput.Parent = MainFrame
DelayInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DelayInput.Position = UDim2.new(0.1, 0, 0.4, 0)
DelayInput.Size = UDim2.new(0.8, 0, 0, 30)
DelayInput.Font = Enum.Font.SourceSans
DelayInput.PlaceholderText = "Delay time (seconds)"
DelayInput.Text = ""
DelayInput.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayInput.TextSize = 14

StartButton.Parent = MainFrame
StartButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
StartButton.Position = UDim2.new(0.1, 0, 0.6, 0)
StartButton.Size = UDim2.new(0.35, 0, 0, 30)
StartButton.Font = Enum.Font.SourceSansBold
StartButton.Text = "Start"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.TextSize = 14

StopButton.Parent = MainFrame
StopButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
StopButton.Position = UDim2.new(0.55, 0, 0.6, 0)
StopButton.Size = UDim2.new(0.35, 0, 0, 30)
StopButton.Font = Enum.Font.SourceSansBold
StopButton.Text = "Stop"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.TextSize = 14

-- Spammer Logic
local isSpamming = false

local function startSpamming()
    if isSpamming then return end
    
    local message = MessageInput.Text
    local delay = tonumber(DelayInput.Text)
    
    if message == "" then
        return
    end
    
    if not delay or delay < 0.1 then
        delay = 0.1
    end
    
    isSpamming = true
    
    spawn(function()
        while isSpamming do
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
            wait(delay)
        end
    end)
end

local function stopSpamming()
    isSpamming = false
end

StartButton.MouseButton1Click:Connect(startSpamming)
StopButton.MouseButton1Click:Connect(stopSpamming)
CloseButton.MouseButton1Click:Connect(function()
    stopSpamming()
    ScreenGui:Destroy()
end)
