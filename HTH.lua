-- Trigon Hub [ Sailor Piece ] - Cleaned by deobfuscator
-- Original source: discord.gg/25ms
-- NOTE: callbacks marked with error() = deobfuscation incomplete (logic not recovered)

local genv = getgenv()

-- Services
local Players          = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Workspace        = game:GetService('Workspace')
local TweenService     = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local RunService       = game:GetService('RunService')
local HttpService      = game:GetService('HttpService')
local TeleportService  = game:GetService('TeleportService')
game:GetService('VirtualInputManager')

-- Player references
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild('PlayerGui')

-- Destroy old UI if exists
if PlayerGui:FindFirstChild('LiquidUltraIsland') then
    PlayerGui:FindFirstChild('LiquidUltraIsland'):Destroy()
end

-- ─── Notification GUI Setup ───────────────────────────────────────────────────

local screenGui = Instance.new('ScreenGui')
screenGui.Name              = 'LiquidUltraIsland'
screenGui.IgnoreGuiInset    = true
screenGui.ResetOnSpawn      = false
screenGui.ZIndexBehavior    = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder      = 999999
screenGui.Parent            = PlayerGui

local masterHolder = Instance.new('Frame')
masterHolder.Name                 = 'MasterHolder'
masterHolder.Size                 = UDim2.new(0, 400, 1, 0)
masterHolder.AnchorPoint          = Vector2.new(0.5, 0)
masterHolder.Position             = UDim2.new(0.5, 0, 0, 0)
masterHolder.BackgroundTransparency = 1
masterHolder.Parent               = screenGui

local listLayout = Instance.new('UIListLayout')
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment   = Enum.VerticalAlignment.Top
listLayout.Padding             = UDim.new(0, 12)
listLayout.SortOrder           = Enum.SortOrder.LayoutOrder
listLayout.Parent              = masterHolder

local padding = Instance.new('UIPadding')
padding.PaddingTop = UDim.new(0, 35)
padding.Parent     = masterHolder

local basePill = Instance.new('Frame')
basePill.Name                   = '00_BasePill'
basePill.Size                   = UDim2.new(0, 80, 0, 32)
basePill.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
basePill.BackgroundTransparency = 0.45
basePill.BorderSizePixel        = 0
basePill.LayoutOrder            = -1
basePill.Parent                 = masterHolder

local pillCorner = Instance.new('UICorner')
pillCorner.CornerRadius = UDim.new(1, 0)
pillCorner.Parent       = basePill

local pillStroke = Instance.new('UIStroke')
pillStroke.Color       = Color3.fromRGB(255, 255, 255)
pillStroke.Transparency = 0.5
pillStroke.Thickness   = 1.8
pillStroke.Parent      = basePill

-- ─── Notification Function ────────────────────────────────────────────────────

genv.LiquidGlassNotify = function(title, desc, icon, duration, _unused)
    local notifyCard = Instance.new('Frame')
    notifyCard.Name                   = 'NotifyCard'
    notifyCard.Size                   = UDim2.new(0, 80, 0, 0)
    notifyCard.BackgroundTransparency = 1
    notifyCard.ClipsDescendants       = false
    notifyCard.LayoutOrder            = 1689784461.0328968
    notifyCard.Parent                 = masterHolder

    local mainBody = Instance.new('CanvasGroup')
    mainBody.Name                   = 'MainBody'
    mainBody.Size                   = UDim2.new(0, 80, 0, 32)
    mainBody.Position               = UDim2.new(0.5, -40, 0, -44)
    mainBody.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
    mainBody.BackgroundTransparency = 0.35
    mainBody.GroupTransparency      = 1
    mainBody.BorderSizePixel        = 0
    mainBody.Parent                 = notifyCard

    local bodyCorner = Instance.new('UICorner')
    bodyCorner.CornerRadius = UDim.new(1, 0)
    bodyCorner.Parent       = mainBody

    local bodyStroke = Instance.new('UIStroke')
    bodyStroke.Color          = Color3.fromRGB(255, 255, 255)
    bodyStroke.Transparency   = 0.4
    bodyStroke.Thickness      = 2.4
    bodyStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bodyStroke.Parent         = mainBody

    local contentFrame = Instance.new('Frame')
    contentFrame.Size                   = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent                 = mainBody

    local iconLabel = Instance.new('ImageLabel')
    iconLabel.Size                   = UDim2.new(0, 30, 0, 30)
    iconLabel.Position               = UDim2.new(0, 18, 0.5, -15)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Image                  = icon
    iconLabel.ImageTransparency      = 1
    iconLabel.Parent                 = contentFrame

    local textContainer = Instance.new('Frame')
    textContainer.Size                   = UDim2.new(1, -90, 1, 0)
    textContainer.Position               = UDim2.new(0, 65, 0, 0)
    textContainer.BackgroundTransparency = 1
    textContainer.Parent                 = contentFrame

    local titleLabel = Instance.new('TextLabel')
    titleLabel.Size                   = UDim2.new(1, 0, 0, 22)
    titleLabel.Position               = UDim2.new(0, 0, 0.5, -20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font                   = Enum.Font.GothamBold
    titleLabel.TextColor3             = Color3.fromRGB(15, 15, 15)
    titleLabel.TextSize               = 16
    titleLabel.Text                   = title
    titleLabel.TextXAlignment         = Enum.TextXAlignment.Left
    titleLabel.TextTransparency       = 1
    titleLabel.Parent                 = textContainer

    local descLabel = Instance.new('TextLabel')
    descLabel.Size                   = UDim2.new(1, 0, 0, 18)
    descLabel.Position               = UDim2.new(0, 0, 0.5, 2)
    descLabel.BackgroundTransparency = 1
    descLabel.Font                   = Enum.Font.GothamMedium
    descLabel.TextColor3             = Color3.fromRGB(60, 60, 65)
    descLabel.TextSize               = 13
    descLabel.Text                   = desc
    descLabel.TextXAlignment         = Enum.TextXAlignment.Left
    descLabel.TextTransparency       = 1
    descLabel.Parent                 = textContainer

    local progressBar = Instance.new('Frame')
    progressBar.Size                   = UDim2.new(0, 0, 0, 3)
    progressBar.Position               = UDim2.new(0, 18, 1, -8)
    progressBar.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
    progressBar.BackgroundTransparency = 0.75
    progressBar.BorderSizePixel        = 0
    progressBar.Parent                 = mainBody

    Instance.new('UICorner', progressBar)

    -- Animate in
    local tweenIn = TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

    TweenService:Create(notifyCard, tweenIn, { Size = UDim2.new(0, 310, 0, 72) }):Play()
    TweenService:Create(mainBody,   tweenIn, { Size = UDim2.new(1, 0, 1, 0), GroupTransparency = 0, Position = UDim2.new(0, 0, 0, 0) }):Play()
    TweenService:Create(bodyCorner, tweenIn, { CornerRadius = UDim.new(0, 24) }):Play()

    task.delay(0.2, function()
        local fadeIn = TweenInfo.new(0.4)
        TweenService:Create(iconLabel,    fadeIn, { ImageTransparency = 0 }):Play()
        TweenService:Create(titleLabel,   fadeIn, { TextTransparency = 0 }):Play()
        TweenService:Create(descLabel,    fadeIn, { TextTransparency = 0 }):Play()
        TweenService:Create(progressBar,  TweenInfo.new(duration, Enum.EasingStyle.Linear), { Size = UDim2.new(1, -36, 0, 3) }):Play()
    end)

    -- Animate out
    task.delay(duration + 0.8, function()
        local tweenOut = TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        TweenService:Create(iconLabel,   TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
        TweenService:Create(titleLabel,  TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
        TweenService:Create(descLabel,   TweenInfo.new(0.2), { TextTransparency = 1 }):Play()
        TweenService:Create(progressBar, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
        task.wait(0.15)
        TweenService:Create(mainBody,   tweenOut, { Size = UDim2.new(0, 80, 0, 32), GroupTransparency = 1, Position = UDim2.new(0.5, -40, 0, -44) }):Play()
        TweenService:Create(bodyCorner, tweenOut, { CornerRadius = UDim.new(1, 0) }):Play()
        TweenService:Create(notifyCard, tweenOut, { Size = UDim2.new(0, 80, 0, 0) }).Completed:Wait()
        notifyCard:Destroy()
    end)
end

-- ─── Global State ─────────────────────────────────────────────────────────────

genv.AutoFarm             = false
genv.AutoDungeon          = false
genv.AutoVoteDifficulty   = false
genv.SelectedDungeon      = ''
genv.DungeonDifficulty    = 'Easy'
genv.AutoReplayDungeon    = false
genv.AutoQuest            = false
genv.AcceptBoss           = true
genv.AutoQuestForMonster  = false
genv.AutoBoss             = false
genv.AutoSummonBoss       = false
genv.SelectedBoss         = ''
genv.BossDifficulty       = 'Normal'
genv.AutoFarmSelectedBoss = false
genv.AutoHop              = false
genv.AutoHaki             = false
genv.AutoZ                = false
genv.AutoX                = false
genv.AutoC                = false
genv.AutoV                = false
genv.AutoF                = false
genv.AutoStat             = false
genv.StatPoints           = 50
genv.SelectedStat         = 'Sword'
genv.SelectedMonsters     = {}
genv.freezeEnabled        = true
genv.hitboxEnabled        = true
genv.useRandomPos         = false
genv.tpX                  = 0
genv.tpY                  = 9
genv.tpZ                  = 0
genv.tweenSpeed           = 100
genv.PrimaryWeapon        = ''
genv.AutoSave             = false

-- ─── Remote References ────────────────────────────────────────────────────────

local questAbandonRemote = ReplicatedStorage.RemoteEvents:FindFirstChild('QuestAbandon')
local RemoteEvents       = ReplicatedStorage.RemoteEvents

require(ReplicatedStorage.Modules:FindFirstChild('QuestConfig'))

-- ─── Character Respawn Handler ────────────────────────────────────────────────

RemoteEvents:FindFirstChild('QuestUIUpdate').OnClientEvent:Connect(function() end)

LocalPlayer.CharacterAdded:Connect(function()
    genv.StopTween = true

    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
        if part:IsA('BasePart') then
            part.CanCollide = true
        end
    end

    local hrp = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
    if hrp then
        hrp.CanCollide = true
    end

    task.wait(2)
end)

-- ─── UI Window ────────────────────────────────────────────────────────────────

local window = loadstring(game:HttpGet('https://raw.githubusercontent.com/Sindex-Saliii/Sindex-Main/refs/heads/main/DummyUI.lua'))():Window({
    Config = {
        Size    = UDim2.new(0, 530, 0, 400),
        Keybind = Enum.KeyCode.RightControl,
    },
    Title          = 'Trigon Hub [ Sailor Piece ]',
    CloseUIButton  = { Enabled = true, Text = 'Close UI' },
    Theme          = 'Dark',
    Icon           = 82500352718600,
    Desc           = 'by x.saliii',
})

window:SelectTab(1)

-- ─── Tabs ─────────────────────────────────────────────────────────────────────

local autoFarmTab    = window:Tab({ Title = 'Auto Farm',    Icon = 'swords' })
local autoDungeonTab = window:Tab({ Title = 'Auto Dungeon', Icon = 'layers' })
local autoBossTab    = window:Tab({ Title = 'Auto Boss',    Icon = 'skull' })
local skillsTab      = window:Tab({ Title = 'Skills',       Icon = 'zap' })
local statsTab       = window:Tab({ Title = 'Stats',        Icon = 'bar-chart-2' })
local playerTab      = window:Tab({ Title = 'Player',       Icon = 'user' })
local weaponTab      = window:Tab({ Title = 'Weapon',       Icon = 'package' })
local miscTab        = window:Tab({ Title = 'Misc',         Icon = 'settings' })
local settingsTab    = window:Tab({ Title = 'Settings',     Icon = 'settings' })

-- ═══════════════════════════════════════════════════════════════════════════════
-- AUTO FARM TAB
-- ═══════════════════════════════════════════════════════════════════════════════

autoFarmTab:Section({ Title = 'Farming Settings' })

autoFarmTab:Toggle({
    Title = 'Auto Farm',
    Callback = function(value)
        genv.AutoFarm = value
        -- NOTE: notification inline code incomplete (deobfuscation artifact)
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoFarmTab:Toggle({
    Title = 'White Screen',
    Callback = function(value)
        genv.WhiteScreen = value
        local rs = game:GetService('RunService')
        rs:Set3dRenderingEnabled(false)
        -- NOTE: notification inline code incomplete (deobfuscation artifact)
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

-- Build monster list from NPCs in workspace
do
    local monsterList = {}
    for _, npc in pairs(Workspace:FindFirstChild('NPCs'):GetChildren()) do
        if npc:FindFirstChild('Humanoid') then
            table.insert(monsterList, npc.Name)
        end
    end
end

local monsterDropdown = autoFarmTab:Dropdown({
    Title    = 'Select Monsters',
    List     = {},
    Value    = '',
    Multi    = true,
    Callback = function(selected)
        genv.SelectedMonsters = selected
        -- NOTE: deobfuscation artifact
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoFarmTab:Button({
    Title    = 'Refresh Monster List',
    Callback = function()
        monsterDropdown:Clear()
        -- NOTE: deobfuscation artifact
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoFarmTab:Toggle({
    Title    = 'Auto Accept Quest',
    Callback = function(value)
        genv.AutoQuest = value
        questAbandonRemote:FireServer('repeatable')
        task.wait(0.5)
        task.wait(1)
        -- NOTE: deobfuscation artifact
        error('line 1: attempt to compare number <= table')
    end,
})

autoFarmTab:Toggle({
    Value    = true,
    Title    = 'Accept Boss Quests',
    Callback = function(value)
        genv.AcceptBoss = value
    end,
})

autoFarmTab:Toggle({
    Value    = true,
    Title    = 'Freeze Monster',
    Callback = function(value)
        genv.freezeEnabled = value
    end,
})

autoFarmTab:Toggle({
    Value    = true,
    Title    = 'Big Hitbox',
    Callback = function(value)
        genv.hitboxEnabled = value
    end,
})

-- ═══════════════════════════════════════════════════════════════════════════════
-- AUTO DUNGEON TAB
-- ═══════════════════════════════════════════════════════════════════════════════

autoDungeonTab:Section({ Title = 'Dungeon Settings' })

local dungeonDropdown = autoDungeonTab:Dropdown({
    Value    = '',
    Title    = 'Select Dungeon',
    List     = { 'CidDungeon', 'RuneDungeon', 'DoubleDungeon', 'BossRush' },
    Callback = function(selected)
        genv.SelectedDungeon = selected
        -- NOTE: deobfuscation artifact
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoDungeonTab:Button({
    Title    = 'Refresh Dungeon List',
    Callback = function()
        dungeonDropdown:Clear()
        dungeonDropdown:Add('CidDungeon')
        dungeonDropdown:Add('RuneDungeon')
        dungeonDropdown:Add('DoubleDungeon')
        dungeonDropdown:Add('BossRush')
        -- NOTE: deobfuscation artifact
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoDungeonTab:Dropdown({
    Value    = 'Easy',
    Title    = 'Dungeon Difficulty',
    List     = { 'Easy', 'Medium', 'Hard', 'Extreme' },
    Callback = function(selected)
        genv.DungeonDifficulty = selected
    end,
})

autoDungeonTab:Toggle({
    Title    = 'Auto Vote Difficulty',
    Callback = function(value)
        genv.AutoVoteDifficulty = value
    end,
})

autoDungeonTab:Toggle({
    Title    = 'Auto Dungeon',
    Callback = function(value)
        genv.AutoDungeon = value
        genv.AutoBoss    = false
        genv.AutoFarm    = true
        genv.AutoQuest   = false
        -- NOTE: deobfuscation artifact
        error('internal 579: <25ms: infinitelooperror>')
    end,
})

autoDungeonTab:Toggle({
    Title    = 'Auto Replay Dungeon',
    Callback = function(value)
        genv.AutoReplayDungeon = value
    end,
})

autoDungeonTab:Button({ Title = 'Vote Difficulty', Callback = function() end })
autoDungeonTab:Button({ Title = 'Vote Replay',     Callback = function() end })

-- ═══════════════════════════════════════════════════════════════════════════════
-- AUTO BOSS TAB
-- ═══════════════════════════════════════════════════════════════════════════════

autoBossTab:Section({ Title = 'Normal Boss (No Hop)' })

-- Build normal boss list from workspace NPCs
do
    for _, npc in pairs(Workspace:FindFirstChild('NPCs'):GetChildren()) do
        local upperName = string.upper(npc.Name)
        if string.find(upperName, 'BOSS') and not string.find(npc.Name, 'Summon') then
            -- populate normal boss list
        end
    end
end

autoBossTab:Dropdown({
    Value    = '',
    Title    = 'Select Normal Boss',
    List     = {},
    Callback = function(selected) end,
})

autoBossTab:Button({
    Title    = 'Refresh Normal Boss List',
    Callback = function() end,
})

autoBossTab:Toggle({
    Title    = 'Auto Farm Selected Boss (No Hop)',
    Callback = function(value)
        genv.AutoFarmSelectedBoss = value
    end,
})

autoBossTab:Section({ Title = 'Summon Boss (Requires Summon)' })

autoBossTab:Dropdown({
    Value    = '',
    Title    = 'Select Summon Boss',
    List     = {
        'SaberBoss', 'SaberAlterBoss', 'QinShiBoss', 'IchigoBoss',
        'GilgameshBoss', 'BlessedMaidenBoss', 'StrongestToday',
        'StrongestHistory', 'RimuruBoss', 'AnosBoss', 'TrueAizenBoss',
    },
    Callback = function(selected)
        genv.SelectedBoss = selected
    end,
})

autoBossTab:Button({
    Title    = 'Refresh Summon Boss List',
    Callback = function() end,
})

autoBossTab:Dropdown({
    Value    = 'Normal',
    Title    = 'Boss Difficulty',
    List     = { 'Normal', 'Medium', 'Hard', 'Extreme' },
    Callback = function(selected)
        genv.BossDifficulty = selected
    end,
})

autoBossTab:Toggle({
    Title    = 'Auto Summon Boss',
    Callback = function(value)
        genv.AutoSummonBoss = value
    end,
})

autoBossTab:Toggle({
    Title    = 'Auto Boss',
    Callback = function(value)
        genv.AutoBoss = value
    end,
})

autoBossTab:Toggle({
    Title    = 'Auto Hop',
    Callback = function(value)
        genv.AutoHop = value
    end,
})

-- ═══════════════════════════════════════════════════════════════════════════════
-- SKILLS TAB
-- ═══════════════════════════════════════════════════════════════════════════════

skillsTab:Section({ Title = 'Auto Skills' })

skillsTab:Toggle({ Title = 'Auto Skill Z', Callback = function(v) genv.AutoZ = v end })
skillsTab:Toggle({ Title = 'Auto Skill X', Callback = function(v) genv.AutoX = v end })
skillsTab:Toggle({ Title = 'Auto Skill C', Callback = function(v) genv.AutoC = v end })
skillsTab:Toggle({ Title = 'Auto Skill V', Callback = function(v) genv.AutoV = v end })
skillsTab:Toggle({ Title = 'Auto Skill F', Callback = function(v) genv.AutoF = v end })

-- ═══════════════════════════════════════════════════════════════════════════════
-- STATS TAB
-- ═══════════════════════════════════════════════════════════════════════════════

statsTab:Section({ Title = 'Stat Allocation' })

statsTab:Dropdown({
    Title    = 'Select Stat',
    List     = { 'Sword', 'Power', 'Defense', 'Melee' },
    Value    = 'Sword',
    Multi    = false,
    Callback = function(selected)
        genv.SelectedStat = selected
    end,
})

statsTab:Slider({
    Title    = 'Points per Upgrade',
    Min      = 1,
    Max      = 100,
    Value    = 50,
    Callback = function(value)
        genv.StatPoints = value
    end,
})

statsTab:Toggle({
    Title    = 'Auto Upgrade Stats',
    Callback = function(value)
        genv.AutoStat = value
    end,
})

-- ═══════════════════════════════════════════════════════════════════════════════
-- WEAPON TAB
-- ═══════════════════════════════════════════════════════════════════════════════

weaponTab:Section({ Title = 'Weapon Selection' })

-- Build weapon list from character + backpack
do
    local weaponList = {}
    for _, item in pairs(LocalPlayer.Character:GetChildren()) do
        if item:IsA('Tool') then
            table.insert(weaponList, item.Name)
        end
    end
    for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
        if item:IsA('Tool') then
            table.insert(weaponList, item.Name)
        end
    end
end

weaponTab:Dropdown({
    Value    = '',
    Title    = 'Select Weapon',
    List     = {},
    Callback = function(selected)
        genv.PrimaryWeapon = selected
    end,
})

weaponTab:Button({
    Title    = 'Refresh Weapon List',
    Callback = function() end,
})

-- ═══════════════════════════════════════════════════════════════════════════════
-- PLAYER TAB
-- ═══════════════════════════════════════════════════════════════════════════════

playerTab:Section({ Title = 'Teleport Settings' })

playerTab:Toggle({
    Title    = 'Use Zigzag Position',
    Callback = function(value)
        genv.useRandomPos = value
    end,
})

playerTab:Button({
    Title    = 'Randomize Base Position',
    Callback = function() end,
})

playerTab:Slider({
    Title    = 'Offset X',
    Min      = -15,
    Max      = 20,
    Value    = 0,
    Callback = function(value)
        genv.tpX = value
    end,
})

playerTab:Slider({
    Title    = 'Offset Y',
    Min      = -5,
    Max      = 20,
    Value    = 9,
    Callback = function(value)
        genv.tpY = value
    end,
})

playerTab:Slider({
    Title    = 'Offset Z',
    Min      = -15,
    Max      = 15,
    Value    = 0,
    Callback = function(value)
        genv.tpZ = value
    end,
})

playerTab:Slider({
    Title    = 'Tween Speed',
    Min      = 50,
    Max      = 500,
    Value    = 100,
    Callback = function(value)
        genv.tweenSpeed = value
    end,
})

-- ═══════════════════════════════════════════════════════════════════════════════
-- MISC TAB
-- ═══════════════════════════════════════════════════════════════════════════════

miscTab:Section({ Title = 'Miscellaneous' })

miscTab:Toggle({
    Title    = 'Auto Haki',
    Callback = function(value)
        genv.AutoHaki = value
    end,
})

miscTab:Button({ Title = 'Redeem All Codes', Callback = function() end })
miscTab:Button({ Title = 'Better FPS',       Callback = function() end })
miscTab:Button({ Title = 'RTX MODE',          Callback = function() end })

-- ═══════════════════════════════════════════════════════════════════════════════
-- SETTINGS TAB
-- ═══════════════════════════════════════════════════════════════════════════════

settingsTab:Section({ Title = 'Settings' })

settingsTab:Button({ Title = "I'm Invisible? Click Me!", Callback = function() end })
settingsTab:Button({ Title = 'Anti Afk',                 Callback = function() end })

settingsTab:Toggle({
    Title    = 'Auto Save Config',
    Callback = function(value)
        genv.AutoSave = value
    end,
})

settingsTab:Button({ Title = 'Save Config', Callback = function() end })
settingsTab:Button({ Title = 'Load Config', Callback = function() end })

-- ─── Loaded Notification ─────────────────────────────────────────────────────

-- Show "Trigon - Loaded Successfully" notification on startup
do
    local notifyCard = Instance.new('Frame')
    notifyCard.Name                   = 'NotifyCard'
    notifyCard.Size                   = UDim2.new(0, 80, 0, 0)
    notifyCard.BackgroundTransparency = 1
    notifyCard.ClipsDescendants       = false
    notifyCard.LayoutOrder            = 1689784641.0026975
    notifyCard.Parent                 = masterHolder

    local mainBody = Instance.new('CanvasGroup')
    mainBody.Name                   = 'MainBody'
    mainBody.Size                   = UDim2.new(0, 80, 0, 32)
    mainBody.Position               = UDim2.new(0.5, -40, 0, -44)
    mainBody.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
    mainBody.BackgroundTransparency = 0.35
    mainBody.GroupTransparency      = 1
    mainBody.BorderSizePixel        = 0
    mainBody.Parent                 = notifyCard

    local bodyCorner = Instance.new('UICorner')
    bodyCorner.CornerRadius = UDim.new(1, 0)
    bodyCorner.Parent       = mainBody

    local bodyStroke = Instance.new('UIStroke')
    bodyStroke.Color           = Color3.fromRGB(255, 255, 255)
    bodyStroke.Transparency    = 0.4
    bodyStroke.Thickness       = 2.4
    bodyStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bodyStroke.Parent          = mainBody

    local contentFrame = Instance.new('Frame')
    contentFrame.Size                   = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent                 = mainBody

    local iconLabel = Instance.new('ImageLabel')
    iconLabel.Size                   = UDim2.new(0, 30, 0, 30)
    iconLabel.Position               = UDim2.new(0, 18, 0.5, -15)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Image                  = 'rbxassetid://82500352718600'
    iconLabel.ImageTransparency      = 1
    iconLabel.Parent                 = contentFrame

    local textContainer = Instance.new('Frame')
    textContainer.Size                   = UDim2.new(1, -90, 1, 0)
    textContainer.Position               = UDim2.new(0, 65, 0, 0)
    textContainer.BackgroundTransparency = 1
    textContainer.Parent                 = contentFrame

    local titleLabel = Instance.new('TextLabel')
    titleLabel.Size                   = UDim2.new(1, 0, 0, 22)
    titleLabel.Position               = UDim2.new(0, 0, 0.5, -20)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font                   = Enum.Font.GothamBold
    titleLabel.TextColor3             = Color3.fromRGB(15, 15, 15)
    titleLabel.TextSize               = 16
    titleLabel.Text                   = 'Trigon'
    titleLabel.TextXAlignment         = Enum.TextXAlignment.Left
    titleLabel.TextTransparency       = 1
    titleLabel.Parent                 = textContainer

    local descLabel = Instance.new('TextLabel')
    descLabel.Size                   = UDim2.new(1, 0, 0, 18)
    descLabel.Position               = UDim2.new(0, 0, 0.5, 2)
    descLabel.BackgroundTransparency = 1
    descLabel.Font                   = Enum.Font.GothamMedium
    descLabel.TextColor3             = Color3.fromRGB(60, 60, 65)
    descLabel.TextSize               = 13
    descLabel.Text                   = 'Loaded Successfully'
    descLabel.TextXAlignment         = Enum.TextXAlignment.Left
    descLabel.TextTransparency       = 1
    descLabel.Parent                 = textContainer

    local progressBar = Instance.new('Frame')
    progressBar.Size                   = UDim2.new(0, 0, 0, 3)
    progressBar.Position               = UDim2.new(0, 18, 1, -8)
    progressBar.BackgroundColor3       = Color3.fromRGB(0, 0, 0)
    progressBar.BackgroundTransparency = 0.75
    progressBar.BorderSizePixel        = 0
    progressBar.Parent                 = mainBody

    Instance.new('UICorner', progressBar)

    local tweenIn = TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    TweenService:Create(notifyCard, tweenIn, { Size = UDim2.new(0, 310, 0, 72) }):Play()
    TweenService:Create(mainBody,   tweenIn, { Size = UDim2.new(1, 0, 1, 0), GroupTransparency = 0, Position = UDim2.new(0, 0, 0, 0) }):Play()
    TweenService:Create(bodyCorner, tweenIn, { CornerRadius = UDim.new(0, 24) }):Play()

    task.delay(0.2, function() end)
    task.delay(5.8, function() end)
end

-- ─── Auto Quest Repeat Settings ───────────────────────────────────────────────

ReplicatedStorage:WaitForChild('RemoteEvents'):WaitForChild('SettingsToggle'):FireServer('EnableQuestRepeat', true)
ReplicatedStorage:WaitForChild('RemoteEvents'):WaitForChild('SettingsToggle'):FireServer('AutoQuestRepeat', true)
