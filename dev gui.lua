-----------//  LOGIC  \\-----------

local Playerhead = game.Players.LocalPlayer.Character.Head

local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local RunService = game:GetService("RunService")

getgenv().simpleCFrame = false

local name = "Yes"

if gamename ~= name then
   warn("OUTDATED")
end



local function getPlayers()
   local plrlist = {}  
   for _,v in pairs(game.Players:GetPlayers()) do  
      table.insert(plrlist, v.Name)  
   end
   return plrlist  
end






-----------//  GUI  \\-----------

local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
local Window = ArrayField:CreateWindow({
    Name = gamename.."|| Dev GUI", -- The ScriptName
    LoadingTitle = gamename.."|| Dev GUI", -- The loading title for the name. Keep it gamename
    LoadingSubtitle = "by UnknownPlayer",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "UnknownPlayers ScriptHub", -- Create a custom folder for your hub/game
       FileName = gamename
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Doran's ScriptHub",
       Subtitle = "Key System",
       Note = "Join our discord for the key!",
       FileName = "Key", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
       Actions = {
             [1] = {
                 Text = 'Click here to copy the key link <--',
                 OnPress = function()
                     print('https://discord.gg/SSJ9yN3Zh4')
                     setclipboard("https://discord.gg/SSJ9yN3Zh4")
                 end,
                 }
             },
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Teleportation = Window:CreateTab("Main Features", 4483362458) -- Title, Image
 local Local = Window:CreateTab("Local", 14294451648) -- Title, Image

 local Online = Window:CreateTab("Online", 14294451648) -- Title, Image
 local BadPc = Window:CreateTab("Bad PC settings", 542620095) -- Title, Image

 
 local settings = Window:CreateTab("Settings", 11385220714) -- Title, Image

 local WS = Local:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local JP = Local:CreateSlider({
   Name = "Jumppower",
   Range = {50, 1000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})



local Input = Local:CreateInput({
   Name = "Walkspeed Specific",
   PlaceholderText = "Input Placeholder",
   NumbersOnly = true, -- If the user can only type numbers. Remove or set to false if none.
   CharacterLimit = 15, --max character limit. Remove or set to false
   OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
   RemoveTextAfterFocusLost = false, -- Speaks for itself.
   Callback = function(Text)
      WS:Set(Text) -- The new slider integer value
   end,
})

local Input = Local:CreateInput({
   Name = "Jumppower Specific",
   PlaceholderText = "Input Placeholder",
   NumbersOnly = true, -- If the user can only type numbers. Remove or set to false if none.
   CharacterLimit = 15, --max character limit. Remove or set to false
   OnEnter = true, -- Will callback only if the user pressed ENTER while being focused on the the box.
   RemoveTextAfterFocusLost = false, -- Speaks for itself.
   Callback = function(Text)
      JP:Set(Text) -- The new slider integer value
   end,
})





 local Button = settings:CreateButton({
   Name = "Close GUI",
   Interact = 'Click',
   Callback = function()
   ArrayField:Destroy()
   end,
})
if gamename ~= name then
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
end

 
 local Toggle = Teleportation:CreateToggle({
   Name = "Toggle Simple CFrame",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().simpleCFrame  = Value
   end,
})

 local Button = Teleportation:CreateButton({
   Name = "Copy CFrame",
   Interact = 'Click',
   Callback = function()
      if getgenv().simpleCFrame == false then
         print("Simple CFrame false")
         setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame))
      else
         setclipboard("game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new("..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)..")")
      end
   end,
})

local Button = Teleportation:CreateButton({
   Name = "Rejoin same server",
   Callback = function()
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
   end,
})



local currentOptions = {}
local playerlist1 = Online:CreateDropdown({
   Name = "Teleport",
   Options = currentOptions,
   CurrentOption = "Select a player",
   MultiSelection = false,
   Flag = "Dropdown1",
   Callback = function(playerName)
      local targetPlayer = game.Players:FindFirstChild(playerName) 
      if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
      else
         ArrayField:Notify({
            Title = "Not Found",
            Content = "Invalid player selected or player not found.",
            Duration = 2,
            Image = 13852169470,
            Actions = { -- Notification Buttons
               Ignore = {
                  Name = "Okay!",
                  Callback = function()
                  print("The user tapped Okay!")
               end
            },
          },
         })
      end
   end,
})

--^^^^^^^^^^^^^^^^^^^^^Make this in an player selecter and add teleports etc for buttons so i dont have to make it everytime 

local Button = Online:CreateButton({
    Name = "Update playerlist",
    Interact = 'Click',
    Callback = function()
        -- Clear existing options
        for _, option in pairs(currentOptions) do
            table.remove(currentOptions, option)
            task.wait()
        end

        -- Wait a bit before adding new options
        task.wait(0.8)

        -- Add new player names as options
        for _, player in ipairs(game.Players:GetPlayers()) do
            local playerName = player.Name
            playerlist1:Add(playerName)
            table.insert(currentOptions,player.DisplayName.."(@"..playerName..")")
            task.wait()
        end

        -- Optional: Refresh the dropdown if necessary
        -- playerlist1:Refresh(options, selectedOption)
    end,
})







local Button = BadPc:CreateButton({
   Name = "Low Graphics",
   Callback = function()
                           workspace:FindFirstChildOfClass('Terrain').WaterWaveSize = 0
                           workspace:FindFirstChildOfClass('Terrain').WaterWaveSpeed = 0
                           workspace:FindFirstChildOfClass('Terrain').WaterReflectance = 0
                           workspace:FindFirstChildOfClass('Terrain').WaterTransparency = 0
                           game:GetService("Lighting").GlobalShadows = false
                           game:GetService("Lighting").FogEnd = 9e9
                           settings().Rendering.QualityLevel = 1
                           for i, v in pairs(game:GetDescendants()) do
                              if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or
                                       v:IsA("TrussPart") then
                                       v.Material = "Plastic"
                                       v.Reflectance = 0
                                    elseif v:IsA("Decal") then
                                       v.Transparency = 1
                                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                                       v.Lifetime = NumberRange.new(0)
                                    elseif v:IsA("Explosion") then
                                       v.BlastPressure = 1
                                       v.BlastRadius = 1
                                    end
                                    end
                                    for i, v in pairs(game:GetService("Lighting"):GetDescendants()) do
                                       if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or
                                          v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                                          v.Enabled = false
                                       end
                                    end
                                    workspace.DescendantAdded:Connect(function(child)
                                       coroutine.wrap(function()
                                          if child:IsA('ForceField') then
                                             game:GetService('RunService').Heartbeat:Wait()
                                             child:Destroy()
                                          elseif child:IsA('Sparkles') then
                                             game:GetService('RunService').Heartbeat:Wait()
                                             child:Destroy()
                                          elseif child:IsA('Smoke') or child:IsA('Fire') then
                                             game:GetService('RunService').Heartbeat:Wait()
                                             child:Destroy()
                                          end
                                       end)()
                                    end)
   end,
})
local frames = 0
local FPS = BadPc:CreateSection(frames.." FPS",true)

 local Input = BadPc:CreateInput({
    Name = "FPS Amount",
    PlaceholderText = "Input FPS",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
 setfpscap(tonumber(Text))
    end,
 })

 local frames = 0
 local RS = game:GetService("RunService")
RS.RenderStepped:Connect(function()
	frames = frames + 1
end)

while task.wait(1) do
   FPS:Set(frames.." FPS")
	frames = 0
end
