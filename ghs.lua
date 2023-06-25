local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Get Huge Simulator 💪",
    LoadingTitle = "Unknown Hub",
    LoadingSubtitle = "by Unknown",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Create a custom folder for your hub/game
        FileName = "GHS Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

function teleportTO(placeCFrame)
    local playr = game.Players.LocalPlayer
    if playr.Character then
        playr.Character.Humanoid.RootPart.CFrame = placeCFrame
    end
end

local MainTab = Window:CreateTab("Main")
local Section = MainTab:CreateSection("Auto Muscle")

-- Toggle Auto Muscle
getgenv().autoLift = false

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Muscle",
    CurrentValue = false,
    Flag = "AutoMuscle",
    Callback = function(Value)
        getgenv().autoLift = Value
        if Value then
            doLift()
        end
    end
})

function doLift()
    spawn(function()
        while autoLift == true do
            game:GetService("ReplicatedStorage").Remotes.LiftWeight:FireServer()
            wait()
        end
    end)
end

-- toggle collect 
getgenv().autoMoney = false
local MoneyInterval

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Money",
    CurrentValue = false,
    Flag = "AutoMoney",
    Callback = function(Value)
        getgenv().autoMoney = Value
        if Value then
            doMoney()
        end
    end
})

local Slider = MainTab:CreateSlider({
    Name = "Auto Money Interval",
    Range = {10, 1200},
    Increment = 5,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoMoney",
    Callback = function(Value)
        MoneyInterval = Value
    end
})

function doMoney()
    spawn(function()
        while autoMoney == true do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Tycoons"):WaitForChild(
                "CollectMoney"):InvokeServer()
            wait(MoneyInterval)
        end
    end)
end

-- toggle collect Reward
getgenv().autoReward = false

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Reward",
    CurrentValue = false,
    Flag = "AutoReward",
    Callback = function(Value)
        getgenv().autoReward = Value
        if Value then
            doReward()
        end
    end
})

function doReward()
    spawn(function()
        while autoReward == true do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Timers"):WaitForChild(
                "GetEventReward"):InvokeServer()
            wait(5)
        end
    end)
end
-- toggle auto gems
getgenv().autoGems = false

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto buy Gems",
    CurrentValue = false,
    Flag = "AutoGems",
    Callback = function(Value)
        getgenv().autoGems = Value
        if Value then
            doGems()
        end
    end
})

function doGems()
    spawn(function()
        while autoGems == true do
            local args = {
                [1] = "Item4"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild(
                "PurchaseEventItem"):InvokeServer(unpack(args))

            wait(60)
        end
    end)
end

local Section = MainTab:CreateSection("Auto Buy")

-- Auto Buy Weights

getgenv().autoBuy = false
local buyInterval

local Slider = MainTab:CreateSlider({
    Name = "Auto Buy Weights Interval",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoBuyWeights",
    Callback = function(Value)
        buyInterval = Value
    end
})

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Buy Weights",
    CurrentValue = false,
    Flag = "AutoBuy",
    Callback = function(Value)
        getgenv().autoBuy = Value
        if Value then
            doAutoBuy()
        end
    end
})

function doAutoBuy()
    spawn(function()
        while autoBuy == true do
            local args = {
                [1] = "Weight",
                [2] = "Islands"
            }
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
            wait(buyInterval)
        end
    end)
end

-- Auto Buy DNA

getgenv().autoBuyDna = false
local buyDnaInterval

local Slider = MainTab:CreateSlider({
    Name = "Auto Buy DNA Interval",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoBuyDNA",
    Callback = function(Value)
        buyDnaInterval = Value
    end
})

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Buy DNA",
    CurrentValue = false,
    Flag = "AutoBuyDNAToggle",
    Callback = function(Value)
        getgenv().autoBuyDna = Value
        if Value then
            doAutoBuyDna()
        end
    end
})

function doAutoBuyDna()
    spawn(function()
        local startAmount = 1
        local endAmount = 80
        while autoBuyDna == true do
            for i = startAmount, endAmount do
                game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(i, "DNA", "Islands")
                wait(buyDnaInterval)
            end
        end
    end)
end

-- Toggle Auto Buy Aura 
getgenv().autoBuyAura = false

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Buy Aura",
    CurrentValue = false,
    Flag = "AutoBuyAura",
    Callback = function(Value)
        getgenv().autoBuyAura = Value
        if Value then
            doAutoBuyAura()
        end
    end
})

function doAutoBuyAura()
    spawn(function()
        while autoBuyAura == true do
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer("Aura", "Islands")
            wait(5)
        end
    end)
end

local Section = MainTab:CreateSection("Auto Sell")

-- Auto Sell

getgenv().autoSell = false
local SellInterval

local Slider = MainTab:CreateSlider({
    Name = "Auto Sell Interval",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoSell",
    Callback = function(Value)
        SellInterval = Value
    end
})

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Sell ",
    CurrentValue = false,
    Flag = "AutoSellToggle",
    Callback = function(Value)
        getgenv().autoSell = Value
        if Value then
            doAutoSell()
        end
    end
})

function doAutoSell()
    spawn(function()
        while autoSell == true do
            teleportTO(game:GetService('Workspace').RingAreas.RangeSystem.Server.Sell.CFrame)
            wait(SellInterval)
            teleportTO(game:GetService('Workspace').Islands.Spawns.SpawnLocation.CFrame)
            wait(SellInterval)
        end
    end)
end

local Section = MainTab:CreateSection("Auto Collect")

-- Auto Collect Gems
getgenv().CollectGems = false

local Toggle = MainTab:CreateToggle({
    Name = "Toggle Auto Collect Gems ",
    CurrentValue = false,
    Flag = "AutoCollectGems",
    Callback = function(Value)
        getgenv().CollectGems = Value
        if Value then
            doCollectGems()
        end
    end
})

function doCollectGems()
    spawn(function()
        while CollectGems == true do
            local playr = game.Players.LocalPlayer
            wait(41)
            for _, part in game:GetService("Workspace").ConsumableSpawns:GetDescendants() do
                if part.Name == "GemModel" then
                    part.CFrame = playr.Character.Humanoid.RootPart.CFrame
                    wait()
                end
            end
        end
    end)
end

local MiscTab = Window:CreateTab("Misc")
local Section = MiscTab:CreateSection("Anti Afk")

-- Anti Afk
getgenv().doAutoAfk = false

local Toggle = MiscTab:CreateToggle({
    Name = "Toggle AntiAfk",
    CurrentValue = false,
    Flag = "AntiAfk",
    Callback = function(Value)
        getgenv().doAutoAfk = Value
        if Value then
            doAfk()
        end
    end
})

function doAFK()
    spawn(function()
        while doAutoAfk == true do
            wait(0.5)
            Players.LocalPlayer.Idled:Connect(function()
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
                wait(2)
            end)
            wait(2)
        end
    end)
end

