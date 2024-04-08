-----------//  LOGIC  \\-----------

local Playerhead = game.Players.LocalPlayer.Character.Head

local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

getgenv().name = "Input Name Here"
getgenv().nameWarn = false

if gamename ~= getgenv().name then
   warn("OUTDATED")
end

-----------//  GUI  \\-----------

local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Window = ArrayField:CreateWindow({
    Name = gamename, -- The ScriptName
    LoadingTitle = gamename, -- The loading title for the name. Keep it gamename
    LoadingSubtitle = "by Doran",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Dorans ScriptHub", -- Create a custom folder for your hub/game
       FileName = gamename
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Doran's ScriptHub",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
       Actions = {
             [1] = {
                 Text = 'Click here to copy the key link <--',
                 OnPress = function()
                     print('Pressed')
                 end,
                 }
             },
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 if gamename ~= getgenv().name and getgenv().nameWarn == false then
   warn("OUTDATED")
   ArrayField:Notify({
      Title = "OUTDATED",
      Content = "My name checker is different from the current name! The script may be outdated! (testing feature)",
      Duration = 10,
      Image = 4483362458,
      Actions = { -- Notification Buttons
         Ignore = {
            Name = "Okay!",
            Callback = function()
            print("The user tapped Okay!")
         end
      },
    },
   })
   getgenv().nameWarn = true
end




 local Main = Window:CreateTab("Main Features", 4483362458) -- Title, Image

 
 local settings = Window:CreateTab("Settings", 11385220714) -- Title, Image
