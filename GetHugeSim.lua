local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Get Huge Simulator",
    HidePremium = false,
    IntroEnabled = false,
    SaveConfig = true,
    ConfigFolder = "GetHugeSimConfig"
})

-- Variablen

getgenv().autoLift = false
getgenv().autoHit = false
getgenv().autoStomp = false
getgenv().autoSell = false
getgenv().autoSellSM = false
getgenv().autoBuy = false
getgenv().autoBuySM = false
getgenv().buyIslandEgg = false
getgenv().buySmEgg = false
getgenv().equipBestSM = false
getgenv().CollectGems = false
getgenv().doAutoAfk = false
getgenv().autoBoss = false
getgenv().autoGain = false
getgenv().autoClaim = false
getgenv().autoLog = false


-- InfoTab
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
InfoTab:AddLabel("Last updated 25.4.2023")
InfoTab:AddParagraph("Changelogs", "- Easter Event tab")


-- IslandTab

local IslandTab = Window:MakeTab({
    Name = "Island",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
IslandTab:AddParagraph("Island functions", "Adding more soon")
IslandTab:AddToggle({
    Name = "Auto lift",
    Default = false,
    Save = true,
    Flag = "LiftToggle",
    Callback = function(Value)
        getgenv().autoLift = Value
        if Value then
            doLift()
        end
    end
})
IslandTab:AddToggle({
    Name = "Auto hit",
    Default = false,
    Callback = function(Value)
        getgenv().autoHit = Value
        if Value then
            doHit()
        end
    end
})
IslandTab:AddToggle({
    Name = "Auto sell",
    Default = false,
    Callback = function(Value)
        getgenv().autoSell = Value
        if Value then
            doAutoSell()
        end
    end
})
IslandTab:AddToggle({
    Name = "Auto buy",
    Default = false,
    Callback = function(Value)
        getgenv().autoBuy = Value
        if Value then
            doAutoBuy()
        end
    end
})
IslandTab:AddParagraph("Note", "By clicking the buttong u will get teleported to the selected place.")

local Struktur

IslandTab:AddDropdown({
    Name = "Island Structures",
    Default = "1",
    Options = { "KOTH", "TopSafeArea", "SpawnLocation", "T1", "T2", "T3", "T4", "T5" },
    Callback = function(Value)
        Struktur = Value
    end
})
IslandTab:AddButton({
    Name = "Teleport",
    Callback = function(Value)
        if Struktur == "KOTH" then
            teleportTO(game:GetService("Workspace").RingAreas.RangeSystem.Server.KOTHArea.CFrame)
        elseif Struktur == "TopSafeArea" then
            teleportTO(game:GetService("Workspace").RingAreas.RangeSystem.Server.TopSafeArea.CFrame)
        elseif Struktur == "SpawnLocation" then
            teleportTO(game:GetService('Workspace').Islands.Spawns.SpawnLocation.CFrame)
        elseif Struktur == "T1" then
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T1.CFrame)
        elseif Struktur == "T2" then
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T2.CFrame)
        elseif Struktur == "T3" then
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T3.CFrame)
        elseif Struktur == "T4" then
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T4.CFrame)
        elseif Struktur == "T5" then
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T5.CFrame)
        end
    end
})

-- Supermarket Tab

local SupermarketTab = Window:MakeTab({
    Name = "Supermarket",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SupermarketTab:AddParagraph("Supermarket functions", "Adding more soon")

SupermarketTab:AddToggle({
    Name = "Auto sell",
    Default = false,
    Callback = function(Value)
        getgenv().autoSellSM = Value
        if Value then
            doAutoSellSM()
        end
    end
})
SupermarketTab:AddToggle({
    Name = "Auto buy",
    Default = false,
    Callback = function(Value)
        getgenv().autoBuySM = Value
        if Value then
            doAutoBuySM()
        end
    end
})
SupermarketTab:AddToggle({
    Name = "Auto equip best dumbbell",
    Default = false,
    Callback = function(Value)
        getgenv().equipBestSM = Value
        if Value then
            doEquipBestSM()
        end
    end
})
SupermarketTab:AddParagraph("Note", "By clicking the buttong u will get teleported to the selected place.")

SupermarketTab:AddDropdown({
    Name = "Supermarket Structures",
    Default = "1",
    Options = { "T1", "T2", "T3" },
    Callback = function(Value)
        Struktur = Value
    end
})
SupermarketTab:AddButton({
    Name = "Teleport",
    Callback = function(Value)
        if Struktur == "T1" then
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T1.CFrame)
        elseif Struktur == "T2" then
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T2.CFrame)
        elseif Struktur == "T3" then
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T3.CFrame)
        end
    end
})
-- Pet Tab

local PetTab = Window:MakeTab({
    Name = "Pet",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
PetTab:AddParagraph("Important note!",
    "If you toggle auto buy and select an egg it will buy the egg until you run out of gems or inventory space")

PetTab:AddParagraph("Info", "Supermarket auto buy might be not working rn fixing soon")
local eggName;
local eggName2;
local eggNumber;
local eggNumber2;
PetTab:AddDropdown({
    Name = "Island Pets",
    Default = "1",
    Options = { "1.5k Egg", "7.5k Egg", "20k Egg", "50k Egg", "90k Egg" },
    Callback = function(Value)
        eggName = Value
    end
})
PetTab:AddToggle({
    Name = "Auto buy island pet",
    Default = false,
    Callback = function(Value)
        getgenv().buyIslandEgg = Value
        if Value then
            if eggName == "1.5k Egg" then
                eggNumber = 1
            elseif eggName == "7.5k Egg" then
                eggNumber = 2
            elseif eggName == "20k Egg" then
                eggNumber = 3
            elseif eggName == "50k Egg" then
                eggNumber = 4
            elseif eggName == "90k Egg" then
                eggNumber = 5
            end
            if eggName then
                doEgg(eggNumber)
            end
        end
    end
})
PetTab:AddDropdown({
    Name = "Supermarket Pets",
    Default = "1",
    Options = { "35k Egg", "70k Egg", "150k Egg", "250k Egg" },
    Callback = function(Value)
        eggName2 = Value
    end
})
PetTab:AddToggle({
    Name = "Auto buy supermarket pet",
    Default = false,
    Callback = function(Value)
        getgenv().buyIslandEgg = Value
        if eggName2 == "35k Egg" then
            eggNumber2 = 1
        elseif eggName2 == "70k Egg" then
            eggNumber2 = 2
        elseif eggName2 == "150k Egg" then
            eggNumber2 = 3
        elseif eggName2 == "250k Egg" then
            eggNumber2 = 4
        end
        if eggName2 then
            doEgg2(eggNumber2)
        end
    end
})

-- Misc Tab

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
MiscTab:AddParagraph("Note", "Adding more soon.")

MiscTab:AddToggle({
    Name = "Collect Gems",
    Default = false,
    Callback = function(Value)
        getgenv().CollectGems = Value
        if Value then
            doCollectGems()
        end
    end
})
MiscTab:AddToggle({
    Name = "Toggle Afk",
    Default = false,
    Save = true,
    Flag = "AfkToggle",
    Callback = function(Value)
        getgenv().doAutoAfk = Value
        if Value then
            doAFK()
        end
    end
})
MiscTab:AddButton({
    Name = "Rejoin",
    Callback = function(Value)
        doRejoin()
    end
})
MiscTab:AddButton({
    Name = "Log",
    Callback = function(Value)
        webhook()
    end
})
MiscTab:AddToggle({
    Name = "Autolog",
    Default = false,
    Callback = function(Value)
        getgenv().autoLog = Value
        if Value then
            webhook()
			wait(60)
        end
    end
})
-- Functions

function doLift()
    spawn(function()
        while autoLift == true do
            game:GetService("ReplicatedStorage").Remotes.LiftWeight:FireServer()
            wait()
        end
    end)
end

function doHit()
    spawn(function()
        while autoHit == true do
            local args = { [1] = "Punch",[2] = 1 }
            game:GetService("ReplicatedStorage").Remotes.PVP.AttackAttempt:FireServer(unpack(args))
            wait(0.5)
        end
    end)
end

function doAutoSell()
    spawn(function()
        while autoSell == true do
            teleportTO(game:GetService('Workspace').RingAreas.RangeSystem.Server.Sell.CFrame)
            wait(5)
            teleportTO(game:GetService('Workspace').Islands.Spawns.SpawnLocation.CFrame)
            wait(5)
        end
    end)
end

function doAutoBuy()
    spawn(function()
        while autoBuy == true do
            local args = { [1] = "Weight",[2] = "Islands" }
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
            wait(5)
        end
    end)
end

function teleportTO(placeCFrame)
    local playr = game.Players.LocalPlayer
    if playr.Character then
        playr.Character.Humanoid.RootPart.CFrame = placeCFrame
    end
end

function doAutoSellSM()
    spawn(function()
        while autoSellSM == true do
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Shops.Server.SupermarketSell.CFrame)
            wait(5)
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Spawns.SpawnLocation.CFrame)
            wait(5)
        end
    end)
end

function doAutoBuySM()
    spawn(function()
        while autoBuySM == true do
            local args = { [1] = "Weight",[2] = "Supermarket" }
            game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
            wait(5)
        end
    end)
end

function doEgg(number)
    spawn(function()
        while buyIslandEgg == true do
            game:GetService("ReplicatedStorage").Remotes.Pets.PurchaseEgg:InvokeServer(number, 1, "Islands")
            wait(2)
        end
    end)
end

function doEgg2(number)
    spawn(function()
        while buySmEgg == true do
            game:GetService("ReplicatedStorage").Remotes.Pets.PurchaseEgg:InvokeServer(number, 1, "Supermarket")
            wait(2)
        end
    end)
end

function doEquipBestSM()
    spawn(function()
        while equipBestSM == true do
            game:GetService("ReplicatedStorage").Remotes.Shop.EquipBest:FireServer()
            wait(60)
        end
    end)
end

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

function doAFK()
    spawn(function()
        while doAutoAfk == true do
            wait(0.5)
            local bb = game:service "VirtualUser"
            game:service "Players".LocalPlayer.Idled:connect(
                function()
                    bb:CaptureController()
                    bb:ClickButton2(Vector2.new())
                    wait(2)
                end
            )
            wait(2)
        end
    end)
end

function doRejoin()
    spawn(function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local Rejoin = coroutine.create(function()
            local Success, ErrorMessage = pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)

            if ErrorMessage and not Success then
                warn(ErrorMessage)
            end
        end)

        coroutine.resume(Rejoin)
        wait()
    end)
end

function formatTime(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - (days * 86400)
    local hours = math.floor(seconds / 3600)
    seconds = seconds - (hours * 3600)
    local minutes = math.floor(seconds / 60)
    seconds = seconds - (minutes * 60)
    local timeString = string.format("%d days, %02d hours, %02d minutes, %02d seconds", days, hours, minutes, seconds)
    return timeString
end

function webhook()
    while autoLog == true do
        local httpService = game:GetService('HttpService')
        local httpRequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or
            request

        local player = game.Players.LocalPlayer
        local gems = player.PlayerData.Gems.Value
        local killStreak = player.leaderstats.KillStreak.Value
        local body = player.leaderstats.Body.Value
        local reputation = player.PlayerData.PVP.Reputation.Value
        local totalKills = player.PlayerData.PVP.TotalKills.Value
        local playTime = formatTime(game:GetService("Players").LocalPlayer.PlayerData.Analytics.TotalTimePlayed.Value)

        local embed1 = {
            ["title"] = "Get Huge Simulator",
            ["description"] = player.Name .. "'s Stats",
            ["color"] = 65280,
            ["thumbnail"] = {
                ["url"] = "https://i.imgur.com/Q4Wyg4v.png"
            },
            ["fields"] = {
                {
                    ["name"] = "Body",
                    ["value"] = body,
                    ["inline"] = true
                },
                {
                    ["name"] = "Gems",
                    ["value"] = gems,
                    ["inline"] = false
                },
                {
                    ["name"] = "Killstreak",
                    ["value"] = killStreak,
                    ["inline"] = false
                },
                {
                    ["name"] = "Reputation",
                    ["value"] = reputation,
                    ["inline"] = false
                },
                {
                    ["name"] = "Time played",
                    ["value"] = playTime,
                    ["inline"] = false
                },
                {
                    ["name"] = "Total kills",
                    ["value"] = totalKills,
                    ["inline"] = false
                }
            }
        }
        local currentTime = os.date("%c")
        local success, response = pcall(httpRequest, {
            Url =
            "https://discord.com/api/webhooks/1095634339091468379/iGWsUSl8ykL0sndHsDcSI1bAu0eOZIZWa2Ts1YqafYDDRPD3CrYIjYzJx0F3p5-EHgUd",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = httpService:JSONEncode({
                content = currentTime,
                embeds = { embed1 }
            })
        })
        wait(60)
    end
end

OrionLib:Init()
