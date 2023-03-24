if game.PlaceId == 4032944086 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({
        Name = "Get Huge Simulator",
        HidePremium = false,
        IntroEnabled = false,
        SaveConfig = true,
        ConfigFolder = "LowkeyConfig"
    })

    -- Variablen

    getgenv().autoLift = false
    getgenv().autoHit = false
    getgenv().autoStomp = false
    getgenv().autoSell = false
    getgenv().autoSellSM = false
    getgenv().autoBuy = false
    getgenv().autoBuySM = false
    getgenv().claimEvent = false
    getgenv().buyIslandEgg = false
    getgenv().buySmEgg = false
    getgenv().equipBestSM = false
    getgenv().doCollectSh = false
    getgenv().doCollectGe = false


    -- FarmTab

    local FarmTab = Window:MakeTab({
        Name = "Farm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    FarmTab:AddToggle({
        Name = "Auto lift",
        Default = false,
        Callback = function(Value)
            getgenv().autoLift = Value
            if Value then
                doLift()
            end
        end
    })
    FarmTab:AddToggle({
        Name = "Auto hit",
        Default = false,
        Callback = function(Value)
            getgenv().autoHit = Value
            if Value then
                doHit()
            end
        end
    })
    FarmTab:AddToggle({
        Name = "Auto sell",
        Default = false,
        Callback = function(Value)
            getgenv().autoSell = Value
            if Value then
                doAutoSell()
            end
        end
    })
    FarmTab:AddToggle({
        Name = "Auto buy",
        Default = false,
        Callback = function(Value)
            getgenv().autoBuy = Value
            if Value then
                doAutoBuy()
            end
        end
    })

    -- Supermarket Tab

    local SupermarketTab = Window:MakeTab({
        Name = "Supermarket",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

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

    -- Pet Tab

    local PetTab = Window:MakeTab({
        Name = "Pet",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
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

    -- Island Teleport

    local IslandTeleportTab = Window:MakeTab({
        Name = "Island TP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    IslandTeleportTab:AddButton({
        Name = "King of the hill",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.RangeSystem.Server.KOTHArea.CFrame)
        end
    })
    IslandTeleportTab:AddButton({
        Name = "Territory 1",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T1.CFrame)
        end
    })
    IslandTeleportTab:AddButton({
        Name = "Territory Hill",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T2.CFrame)
        end
    })
    IslandTeleportTab:AddButton({
        Name = "Territory Desert",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T4.CFrame)
        end
    })
    IslandTeleportTab:AddButton({
        Name = "Territory Lava",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T3.CFrame)
        end
    })
    IslandTeleportTab:AddButton({
        Name = "Territory Jungle",
        Callback = function()
            teleportTO(game:GetService("Workspace").RingAreas.Territories.T5.CFrame)
        end
    })

    -- Supermarket Teleport Teleport

    local SupermarketTeleportTab = Window:MakeTab({
        Name = "Supermarket TP",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    SupermarketTeleportTab:AddButton({
        Name = "Territory 1",
        Callback = function()
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T1.CFrame)
        end
    })
    SupermarketTeleportTab:AddButton({
        Name = "Territory 2",
        Callback = function()
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T2.CFrame)
        end
    })
    SupermarketTeleportTab:AddButton({
        Name = "Territory 3",
        Callback = function()
            teleportTO(game:GetService("Workspace").Dimensions.Supermarket.Territories.T3.CFrame)
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
    -- Misc Tab

    local MiscTab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    MiscTab:AddToggle({
        Name = "Claim event reward",
        Default = false,
        Callback = function(Value)
            getgenv().claimEvent = Value
            if Value then
                doClaimEvent()
            end
        end
    })
    MiscTab:AddToggle({
        Name = "Collect Shamrocks",
        Default = false,
        Callback = function(Value)
            getgenv().doCollectSh = Value
            if Value then
                doCollect()
            end
        end
    })
    MiscTab:AddToggle({
        Name = "Collect Gems",
        Default = false,
        Callback = function(Value)
            getgenv().doCollectGe = Value
            if Value then
                doCollectGems()
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

    function doClaimEvent()
        spawn(function()
            while claimEvent == true do
                game:GetService("ReplicatedStorage").Remotes.Timers.GetEventReward:InvokeServer()
                wait(60)
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
    function doCollect()
        spawn(function()
            while doCollectSh == true do
                for _, part in game:GetService("Workspace").ConsumableSpawns:GetDescendants() do
                    if part.Name == "ShamrocksModel" then
                        teleportTO(part.CFrame)
                        wait(1)
                    end
                end
                wait(1)
            end
        end)
    end
    function doCollectGems()
        spawn(function()
            while doCollectGe == true do
                for _, part in game:GetService("Workspace").ConsumableSpawns:GetDescendants() do
                    if part.Name == "GemModel" then
                        teleportTO(part.CFrame)
                        wait(1)
                    end
                end
                wait(1)
            end
        end)
    end
end

OrionLib:Init()
