local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ANGEL HUB | OWNER",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "angel",
   LoadingSubtitle = "by VILKI",
   ShowText = "VILKI", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/4ap98uWrXu", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "ANGEL KEY SYSTEM",
      Subtitle = "Key System",
      Note = "GET KEY https://discord.gg/2AvPuvpDv3", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"ANGELNS"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Player")

local Button = Tab:CreateButton({
   Name = "Fly [X]",
   Callback = function()
       repeat wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0
 
function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "x" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
   end,
})

local Button = Tab:CreateButton({
   Name = "Inf Jump",
   Callback = function()
   game:GetService("UserInputService").JumpRequest:connect(function()
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")       
    end)
   end,
})


local Slider = Tab:CreateSlider({ -- СОЗДАНИЕ СЛАЙДЕРА СКОРОСТИ
   Name = "Speed Player [BETA]",
   Range = {16, 500},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  getgenv().WalkSpeedValue = 500; --set your desired walkspeed here
local Player = game:service'Players'.LocalPlayer;
Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
end)
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
   end,
})

local Button = Tab:CreateButton({
   Name = "Spin",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Проверяем, есть ли у игрока "Humanoid"
local humanoid = character:WaitForChild("Humanoid")

while true do
wait() -- Задержка между вращениями
character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(360), 0)) -- Вращаем на 10 градусов
end
   end,
})


local Tab = Window:CreateTab("Tools", 4483362458) -- СОЗДАНИЕ ТАБА

local Button = Tab:CreateButton({
   Name = "TP Tool",
   Callback = function()
   mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "TP Tool"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})

local Tab = Window:CreateTab("Misc", 4483362458) --СОЗДАНИЕ ТАБА

local Section = Tab:CreateSection("FOV")

local Button = Tab:CreateButton({
   Name = "FOV",
   Callback = function()
   _G.FOVChangerConnection = _G.FOVChangerConnection or nil
 
if _G.FOVChangerConnection then
    _G.FOVChangerConnection:Disconnect()
    _G.FOVChangerConnection = nil
end
 
local camera = workspace.Camera
 
_G.FOVChangerConnection = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
    if camera.FieldOfView ~= 120 then
        camera.FieldOfView = 120
    end
end)
 
camera.FieldOfView = 120
   end,
})

local Button = Tab:CreateButton({
   Name = "FOV OFF",
   Callback = function()
   _G.FOVChangerConnection = _G.FOVChangerConnection or nil
 
if _G.FOVChangerConnection then
    _G.FOVChangerConnection:Disconnect()
    _G.FOVChangerConnection = nil
end
 
local camera = workspace.Camera
 
_G.FOVChangerConnection = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
    if camera.FieldOfView ~= 70 then
        camera.FieldOfView = 70
    end
end)
 
camera.FieldOfView = 70
   end,
})

local Section = Tab:CreateSection("FPS")

local Button = Tab:CreateButton({
   Name = "Unlock FPS",
   Callback = function()
   local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
   end,
})

local Section = Tab:CreateSection("AFK")

local Button = Tab:CreateButton({
   Name = "Anti AFK",
   Callback = function()
   local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

while true do
wait(10) -- Задержка в 10 секунд
if character and character:FindFirstChild("Humanoid") then
local humanoid = character.Humanoid

    -- Двигаем игрока слегка
    humanoid:Move(Vector3.new(0.1, 0, 0), true)
    wait(0.1) -- Небольшая пауза
    humanoid:Move(Vector3.new(-0.1, 0, 0), true)
end
end
   end,
})

local Tab = Window:CreateTab("Players", 4483362458) -- Title, Image
