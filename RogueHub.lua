local player = game:GetService("Players").LocalPlayer

getgenv().bandagebuy = true
getgenv().bandagesell = true
getgenv().antiidle = true
getgenv().autospin = true
getgenv().speed = 0.1
getgenv().dailyspin = true


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

function AntiAfk()
    while antiidle == true do

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

    while getgenv().autospin do
        local playerClan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan.Value
        if table.find(targetclan, playerClan) then
            getgenv().autospin = false
        else
            local args = {[1] = "check_can_spin"}
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
            wait(getgenv().speed)
        end
    end
end











local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Rogue Hub") -- Creates the window
local b = w:CreateFolder("Millionaire Farm")
local c = w:CreateFolder("Teleport to -")
local d = w:CreateFolder("Auto Thingy")

b:Toggle("Buy",function(bool)
    getgenv().bandagebuy = bool
    if bool then -- This won't spam because u put if instead of do
        bandagebuyer()
    end
end)


b:Toggle("Sell",function(bool)
    getgenv().bandagesell = bool
        while bandagesell do
            task.wait()
            print()
        local ohTable1 = {
            [getNumber()] = 1
        }
        local ohNumber2 = 0
        local ohNumber3 = 0

        game:GetService("ReplicatedStorage").Sell_Items_tang:InvokeServer(ohTable1, ohNumber2, ohNumber3)

        end
end)


d:Button("Anti Afk",function()
    AntiAfk()
    print("Anti Afk Started now go away", antiidle)
end)

d:Button("Daily Spin",function()
    while dailyspin == true do
        game:GetService("ReplicatedStorage").spins_thing_remote:InvokeServer()
    end
end)


d:Button("Kamdo spinner",function()
    KamadoSpin()
    print("We spinin KAMADO for ya")
end)
d:DestroyGui()














-- b:Label("Auto Buy Bandage",{
--     TextSize = 25; -- Self Explaining
--     TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
--     BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
-- }) 

-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end) 
