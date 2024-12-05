if getgenv().Executed == true then return end
task.wait(getgenv().runDelay)
getgenv().Executed = true
local Players = game:GetService("Players")
local LocalPlayer = game.Players.LocalPlayer
repeat task.wait() until LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Character = LocalPlayer.Character
repeat task.wait() until Character:WaitForChild("RemoteEvent") and Character:WaitForChild("RemoteFunction")

local RemoteFunction, RemoteEvent = Character.RemoteFunction, Character.RemoteEvent
local HRP = Character.PrimaryPart
local part
local dontTPOnDeath = true
local finished = false
local tp = false

function Teleport()
    repeat task.wait(1)
        game:GetService("TeleportService"):Teleport(122892401013140, LocalPlayer)
    until tp == true
end

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local function TPReturner()
    local Site;
    if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=' .. getgenv().sortOrder .. '&limit=100'))
    else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=' .. getgenv().sortOrder .. '&limit=100&cursor=' .. foundAnything))
    end

    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
    end

    local num = 0;
    for _,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
          for _,Existing in pairs(AllIDs) do
             if num ~= 0 then
                if ID == tostring(Existing) then
                   Possible = false
                end
             else
                if tonumber(actualHour) ~= tonumber(Existing) then
                   local delFile = pcall(function()
                   delfile("abc.json")
                   AllIDs = {}
                   table.insert(AllIDs, actualHour)
                   end)
                end
             end
             num = num + 1
          end
          if Possible == true then
             table.insert(AllIDs, ID)
             task.wait()
             pcall(function()
                writefile("abc.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                task.wait()
                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
             end)
             task.wait(4)
          end
       end
    end
 end

 local function Teleportv2()
    while task.wait() do
       pcall(function()
        if getgenv().lessPing then
            game:GetService("TeleportService"):Teleport(2809202155, game:GetService("Players").LocalPlayer)
     
            game:GetService("TeleportService").TeleportInitFailed:Connect(function()
                 game:GetService("TeleportService"):Teleport(2809202155, game:GetService("Players").LocalPlayer)
            end)
            
            repeat task.wait() until game.JobId ~= game.JobId
        end

       TPReturner()
       if foundAnything ~= "" then
          TPReturner()
       end
       end)
    end
 end

if LocalPlayer.Name == getgenv().Acc1 then
    if Players:FindFirstChild(getgenv().Acc2) then
        Teleportv2()
        warn("Same Acc Detected.")
    end
elseif LocalPlayer.Name == getgenv().Acc2 then
    if Players:FindFirstChild(getgenv().Acc1) then
        Teleportv2()
        warn("Same Acc Detected.")
    end
end


game:GetService("CoreGui").DescendantAdded:Connect(function(child)
    if child.Name == "ErrorPrompt" then
        local GrabError = child:FindFirstChild("ErrorMessage",true)
        repeat task.wait() until GrabError.Text ~= "Label"
        local Reason = GrabError.Text
        if Reason:match("kick") or Reason:match("You") or Reason:match("conn") or Reason:match("rejoin") then
            game:GetService("TeleportService"):Teleport(2809202155, game:GetService("Players").LocalPlayer)
        end
    end
end)

if not LocalPlayer.PlayerGui:FindFirstChild("HUD") then
    local HUD = game:GetService("ReplicatedStorage").Objects.HUD:Clone()
    HUD.Parent = LocalPlayer.PlayerGui
end

RemoteEvent:FireServer("PressedPlay")

if LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1") then
    LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen1"):Destroy()
end

if LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") then
    LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen"):Destroy()
end

task.spawn(function()
    if game.Lighting:WaitForChild("DepthOfField", 10) then
        game.Lighting.DepthOfField:Destroy()
    end
end)

workspace.Map.IMPORTANT.OceanFloor.OceanFloor_Sand_6.Size = Vector3.new(2048, 89, 2048)
workspace.Map.IMPORTANT.OceanFloor.OceanFloor_Sand_4.Size = Vector3.new(2048, 89, 2048)

local itemHook;
itemHook = hookfunction(getrawmetatable(game.Players.LocalPlayer.Character.HumanoidRootPart.Position).__index, function(p,i)
    if getcallingscript().Name == "ItemSpawn" and i:lower() == "magnitude" then
        return 0
    end
    return itemHook(p,i)
end)

local Hook;
Hook = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
    local args = {...}
    local namecallmethod =  getnamecallmethod()

    if namecallmethod == "InvokeServer" then
        if args[1] == "idklolbrah2de" then
            return "  ___XP DE KEY"
        end
    end

    return Hook(self, ...)
end))

--// Hop Func //--
Time = 1 -- seconds
repeat wait() until game:IsLoaded()
wait(Time)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end

local function SendWebhook(msg)
    local url = getgenv().Webhook

    local data;
    data = {
        ["embeds"] = {
            {
                ["title"] = "lucky farm script",
                ["description"] = msg,
                ["type"] = "rich",
                ["color"] = tonumber(0x7269ff),
            }
        }
    }

    repeat task.wait() until data
    local newdata = game:GetService("HttpService"):JSONEncode(data)


    local headers = {
        ["Content-Type"] = "application/json"
    }
    local request = http_request or request or HttpPost or syn.request or http.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
end

local function getitem(item, itemIndex)
    local gotItem = false
    local timeout = getgenv().waitUntilCollect + 5

    if Character:FindFirstChild("SummonedStand") then
        if Character:FindFirstChild("SummonedStand").Value then
            RemoteFunction:InvokeServer("ToggleStand", "Toggle")
        end
    end

    LocalPlayer.Backpack.ChildAdded:Connect(function()
        gotItem = true
    end)
    
    task.spawn(function()
        while not gotItem do
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item["Position"][itemIndex] - Vector3.new(0,10,0)
        end
    end)

    task.wait(getgenv().waitUntilCollect)

    task.spawn(function()
        fireproximityprompt(item["ProximityPrompt"][itemIndex])
        
        local screenGui = LocalPlayer.PlayerGui:WaitForChild("ScreenGui",5)
        
        if not screenGui then
            return
        end

        local screenGuiPart = screenGui:WaitForChild("Part")
        for _, button in pairs(screenGuiPart:GetDescendants()) do
            if button:FindFirstChild("Part") then
                if button:IsA("ImageButton") and button:WaitForChild("Part").TextColor3 == Color3.new(0, 1, 0) then
                    repeat
                        firesignal(button.MouseEnter)
                        firesignal(button.MouseButton1Up)
                        firesignal(button.MouseButton1Click)
                        firesignal(button.Activated)
                        task.wait()
                    until not LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
                end
            end
        end
    end)
    
    task.spawn(function()
        for i=timeout, 1, -1 do
            task.wait(1)
        end

        if not gotItem then
            gotItem = true
            return
        end
    end)


    while not gotItem do
        task.wait()
    end
end

 local function findItem(itemName)
    local ItemsDict = {
        ["Position"] = {},
        ["ProximityPrompt"] = {},
        ["Items"] = {}
    }

    for _,item in pairs(game:GetService("Workspace")["Item_Spawns"].Items:GetChildren()) do
        if item:FindFirstChild("MeshPart") and item.ProximityPrompt.ObjectText == itemName then
            if item.ProximityPrompt.MaxActivationDistance == 8 then
                table.insert(ItemsDict["Items"], item.ProximityPrompt.ObjectText)
                table.insert(ItemsDict["ProximityPrompt"], item.ProximityPrompt)
                table.insert(ItemsDict["Position"], item.MeshPart.CFrame)
            end
        end
    end
    return ItemsDict
end

--count amount of items for checking if full of item
local function countItems(itemName)
    local itemAmount = 0

    for _,item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if item.Name == itemName then
            itemAmount += 1;
        end
    end

    return itemAmount
end

local function farmItem(itemName, amount)
    local items = findItem(itemName)
    local amountFirst = countItems(itemName) == amount

    for itemIndex, _ in pairs(items["Position"]) do
        if countItems(itemName) == amount or amountFirst then
            break
        else
            getitem(items, itemIndex)
        end
    end
    
    return true
end

local function endDialogue(NPC, Dialogue, Option)
    local dialogueToEnd = {
        ["NPC"] = NPC,
        ["Dialogue"] = Dialogue,
        ["Option"] = Option
     }
    RemoteEvent:FireServer("EndDialogue", dialogueToEnd)
end

local function purchasesell(item, amount)
    farmItem(item, amount)
    LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild(item))
    endDialogue("Merchant", "Dialogue5", "Option2")
end


local function collectAndSell()
    for i = 1, 2 do
        purchasesell("Mysterious Arrow", 25)
        purchasesell("Rokakaka", 25)
        purchasesell("Steel Ball", 10)
        purchasesell("Quinton's Glove", 10)
        purchasesell("Pure Rokakaka", 10)
        purchasesell("Ribcage Of The Saint's Corpse", 10)
        purchasesell("Ancient Scroll", 10)
        purchasesell("Stone Mask", 10)
        purchasesell("Dio's Diary", 10)
        purchasesell("Diamond", 10)
        purchasesell("Caesar's Headband", 10)
        purchasesell("Clackers", 10)
        if getgenv().Candies then
            farmItem("Yellow Candy", 45)
            farmItem("Green Candy", 45)
            farmItem("Blue Candy", 45) 
            farmItem("Red Candy", 45)   
        end 
        task.wait()
    end

    task.wait()

    farmItem("Lucky Arrow", 10)

    task.wait(1)
    finished = true
end

collectAndSell()

while task.wait(1) do
    if finished == true then
        if (LocalPlayer.PlayerStats.Money.Value < 50000) then
            repeat task.wait(1)
            Teleport()
            until tp == true
        elseif (LocalPlayer.PlayerStats.Money.Value >= 50000 and countItems("Lucky Arrow") < 10) then
            local args = {
                [1] = "PurchaseShopItem",
                [2] = {
                    ["ItemName"] = "1x Lucky Arrow"
                }
            }

            game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))

            SendWebhook("||"..LocalPlayer.Name.."||".." bought a lucky arrow and has "..countItems("Lucky Arrow"))
        end
        elseif (countItems("Lucky Arrow") >= 10) then
        SendWebhook("||"..LocalPlayer.Name.."||".." has Max Lucky Arrows!")
    end
end
