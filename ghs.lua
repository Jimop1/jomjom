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
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(1, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(2, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(3, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(4, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(5, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(6, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(7, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(8, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(9, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(10, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(11, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(12, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(13, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(14, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(15, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(16, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(17, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(18, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(19, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(20, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(21, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(22, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(23, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(24, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(25, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(26, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(27, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(28, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(29, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(30, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(31, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(32, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(33, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(34, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(35, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(36, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(37, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(38, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(39, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(40, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(41, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(42, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(43, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(44, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(45, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(46, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(47, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(48, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(49, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(50, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(51, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(52, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(53, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(54, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(55, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(56, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(57, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(58, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(59, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(60, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(61, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(62, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(63, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(64, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(65, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(66, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(67, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(68, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(69, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(70, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(71, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(72, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(73, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(74, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(75, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(76, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(77, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(78, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(79, "DNA", "Islands")
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestPurchase:InvokeServer(80, "DNA", "Islands")

            wait(buyDnaInterval)
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
            doAFK()
        end
    end
})

function doAFK()
    spawn(function()
        while doAutoAfk == true do
            wait(0.5)
            local bb = game:service "VirtualUser"
            game:service "Players".LocalPlayer.Idled:connect(function()
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
                wait(2)
            end)
            wait(2)
        end
    end)
end

-- Destroy UI
local Section = MiscTab:CreateSection("Destroy UI")

local Button = MiscTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})

-- Supermarket

local SupermarketTab = Window:CreateTab("Supermarket")
local Section = SupermarketTab:CreateSection("Auto Buy")

-- Auto Buy SM

getgenv().autoBuySM = false
local buyIntervalSM

local Slider = SupermarketTab:CreateSlider({
    Name = "Auto Buy Weights Interval",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoBuyWeightsSM",
    Callback = function(Value)
        buyIntervalSM = Value
    end
})

local Toggle = SupermarketTab:CreateToggle({
    Name = "Toggle Auto Buy Weights",
    CurrentValue = false,
    Flag = "AutoBuySM",
    Callback = function(Value)
        getgenv().autoBuySM = Value
        if Value then
            doAutoBuySM()
        end
    end
})

function doAutoBuySM()
    spawn(function()
        while autoBuySM == true do
            local args = {
                [1] = "Weight",
                [2] = "Supermarket"
            }
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
            wait(buyIntervalSM)
        end
    end)
end

local Section = SupermarketTab:CreateSection("Auto Sell")

-- Auto Sell SM

getgenv().autoSellSM = false
local SellIntervalSM

local Slider = SupermarketTab:CreateSlider({
    Name = "Auto Sell Interval",
    Range = {1, 60},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 10,
    Flag = "AutoSellSM",
    Callback = function(Value)
        SellIntervalSM = Value
    end
})

local Toggle = SupermarketTab:CreateToggle({
    Name = "Toggle Auto Sell ",
    CurrentValue = false,
    Flag = "AutoSellToggleSM",
    Callback = function(Value)
        getgenv().autoSellSM = Value
        if Value then
            doAutoSellSM()
        end
    end
})

function doAutoSellSM()
    spawn(function()
        while autoSellSM == true do
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Shops.Server.SupermarketSell.CFrame)
            wait(SellIntervalSM)
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Spawns.SpawnLocation.CFrame)
            wait(SellIntervalSM)
        end
    end)
end
