repeat wait() until game:IsLoaded()
local player = game:GetService("Players").LocalPlayer

getgenv().bandagebuy = false
getgenv().bandagesell = false
getgenv().antiidle = false
getgenv().autospin = false
getgenv().speed = 0.1
getgenv().dailyspin = false


    function getNumber()
        local tradeItems = player.PlayerGui.MainGuis.TradeF["Trade_Hub_Items"].Items.Scroll:GetChildren()
    
        for _, item in ipairs(tradeItems) do
            local number = string.match(item.Name, "Bandage(%d+)")
            if number then
                return tonumber(number)
            end
        end

        return nil
    end


function bandagebuyer()
        local args = {
            [1] = "buysomething",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = "Bandage",
            [4] = game:GetService("ReplicatedStorage").Player_Data[player.Name].Yen,
            [5] = game:GetService("ReplicatedStorage").Player_Data[player.Name].Inventory,
            [6] = 5
    }

    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
    task.wait()

end

function AntiAfk()
    while antiidle do
        task.wait()
        local vu = game:GetService("VirtualUser")

        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end        
end


function KamadoSpin()
local targetclan = {
     "Kamado"
    }

    while autospin ==true do
        local playerClan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan.Value
        if table.find(targetclan, playerClan) then
            getgenv().autospin = false
        else
            local args = {[1] = "check_can_spin"}
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
            wait(getgenv().speed)
            task.wait()
        end
    end
end


 




local player = game:GetService("Players").LocalPlayer
function bandagebuyer()
    while bandagebuy == true do
        local args = {
            [1] = "buysomething",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = "Bandage",
            [4] = game:GetService("ReplicatedStorage").Player_Data[player.Name].Yen,
            [5] = game:GetService("ReplicatedStorage").Player_Data[player.Name].Inventory,
            [6] = 5
    }

    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
    task.wait()

    end

end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
getgenv().SecureMode = true


local Window = Rayfield:CreateWindow({
    Name = "Key System",
    LoadingTitle = "Rogue Hub",
    LoadingSubtitle = "by RogueInk",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Rogue Hub", -- Create a custom folder for your hub/game
       FileName = "Project Slayer"
    },
    Discord = {
       Enabled = true,
       Invite = "vrYUGtVePK", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem  = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Rogue Hub",
       Subtitle = "Key System",
       Note = "Join Discord for key",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })




local Tab = Window:CreateTab("MISC", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Millionaire Farm (Bandage)")
local Toggle = Tab:CreateToggle({
    Name = "Auto Buy",
    CurrentValue = false,
    Callback = function(Value)
        bandagebuy = Value
        while Value do
            bandagebuyer()
            task.wait()
        end
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Callback = function(Value)
        bandagesell = Value
        while bandagesell do
            task.wait()
            print()
            local ohTable1 = {
                [getNumber()] = 1
            }
            local ohNumber2 = 0
            local ohNumber3 = 0

        game:GetService("ReplicatedStorage").Sell_Items_tang:InvokeServer(ohTable1, ohNumber2, ohNumber3)
        task.wait()

        end
    end,
 })
 local Section = Tab:CreateSection("EXTRA")
 local Toggle = Tab:CreateToggle({
     Name = "Anti AFK",
     CurrentValue = false,
     Callback = function(Value)
         antiidle = Value
         while Value do
             AntiAfk()
             task.wait()
         end
     -- The function that takes place when the toggle is pressed
     -- The variable (Value) is a boolean on whether the toggle is true or false
     end,
  })


  local Toggle = Tab:CreateToggle({
    Name = "Spin Till Kamado",
    CurrentValue = false,
    Callback = function(Value)
        autospin = Value
        while Value do
             KamadoSpin()
             task.wait()
        end
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })


 local Toggle = Tab:CreateToggle({
    Name = "Daily Spin",
    CurrentValue = false,
    Callback = function(Value)
        dailyspin = Value
        while Value do
            game:GetService("ReplicatedStorage").spins_thing_remote:InvokeServer()
            task.wait()
        end
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })


---Rayfield:Destroy()
Rayfield:LoadConfiguration()
