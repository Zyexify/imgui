-- // GUI Dependencies (no external lib, fully custom black & white)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ExecutorGUI"

local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(0, 700, 0, 450)
mainFrame.Position = UDim2.new(0.5, -350, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0

local tabs = {"Aim", "Visuals", "World", "Settings"}
local currentTab = nil

local function createTabButton(tabName, index)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Size = UDim2.new(0, 175, 0, 30)
    btn.Position = UDim2.new(0, (index - 1) * 175, 0, 0)
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.BorderSizePixel = 0
    btn.MouseButton1Click:Connect(function()
        if currentTab then currentTab.Visible = false end
        currentTab = mainFrame:FindFirstChild(tabName)
        if currentTab then currentTab.Visible = true end
    end)
end

-- Create the tabs
for i, name in ipairs(tabs) do
    createTabButton(name, i)

    local tab = Instance.new("Frame", mainFrame)
    tab.Name = name
    tab.Size = UDim2.new(1, 0, 1, -30)
    tab.Position = UDim2.new(0, 0, 0, 30)
    tab.Visible = (i == 1)
    tab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    -- Sample content per tab
    if name == "Aim" then
        local checkbox = Instance.new("TextButton", tab)
        checkbox.Size = UDim2.new(0, 200, 0, 30)
        checkbox.Position = UDim2.new(0, 10, 0, 10)
        checkbox.Text = "[✓] Aimbot"
        checkbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        checkbox.TextColor3 = Color3.new(1,1,1)
    elseif name == "World" then
        local label = Instance.new("TextLabel", tab)
        label.Size = UDim2.new(0, 200, 0, 30)
        label.Position = UDim2.new(0, 10, 0, 10)
        label.Text = "Silent Aim: [ON]"
        label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        label.TextColor3 = Color3.new(1,1,1)
    end
end
