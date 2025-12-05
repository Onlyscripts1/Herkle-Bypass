-- Made it open source for some issues here you can skid it freely.

local gam = game
local pai = pairs
local sgsub = string.gsub
local gets = gam.GetService

local ver = "1.90"

if not gam:IsLoaded() then
    gam.Loaded:Wait()
end

if gam.PlaceId == 137493074101677 then
    gam:GetService("StarterGui"):SetCore("SendNotification", {
       Title = "Info";
       Text = "The autobypass ain't gonna work here :(";
       Icon = 137667128572599;
       Duration = 5
    })
end

if getgenv().Herkle == true and not nil or false then
    gam:GetService("StarterGui"):SetCore("SendNotification", {
       Title = "Warning";
       Text = "The script is already executed!";
       Icon = 137667128572599;
       Duration = 5
    })
    return
end

pcall(function()
    getgenv().Herkle = true
    
    local g = getinfo or debug.getinfo
    local d = false
    local h = {}
    
    local x, y
    
    setthreadidentity(2)

    for i, v in getgc(true) do
        if typeof(v) == "table" then
            local a = rawget(v, "Detected")
            local b = rawget(v, "Kill")
            
            if typeof(a) == "function" and not x then
                x = a
                        
                local o; o = hookfunction(x, function(c, f, n)
                if c ~= "_" then
                    if d then
                        warn(`Adonis AntiCheat flagged\nMethod: {c}\nInfo: {f}`)
                    end
                end
                
           return true
       end)

       table.insert(h, x)
    end

    if rawget(v, "Variables") and rawget(v, "Process") and typeof(b) == "function" and not y then
        y = b
        local o; o = hookfunction(y, function(f)
        if d then
            warn(`Adonis AntiCheat tried to kill (fallback): {f}`)
        end
    end)

    table.insert(h, y)
end
end
end

    local o; o = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local a, f = ...

    if x and a == x then
        if d then
            warn(`zins | adonis bypassed`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return o(...)
end))

    setthreadidentity(7)
end)

local Rayfield = loadstring(gam:HttpGet("https://gist.githubusercontent.com/Onlyscripts1/d0220635db2f04c5a38e4667082f2fab/raw/bf20cbd050041588d501ac679dec80b7723198d4/rayfield.lua"))()
local Window = Rayfield:CreateWindow({
   Name = "[" .. ver .. "]" .. " Herkle Bypass",
   Icon = 137667128572599, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Herkle By feariosz0",
   LoadingSubtitle = "get rid of tags, never get tagged.",
   
   ToggleUIKeybind = "X", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Herkle"
   },

   Discord = {
     Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
     Invite = "", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
     RememberJoins = true -- Set this to true to make them join the discord every time they load it up
  },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Herkle Bypass",
      Subtitle = "Key System",
      Note = "Join to get key discord.gg/RuBYEuCnDQ", -- Use this to tell the user how to get a key
      FileName = "Login", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"juicexwalter"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local plrs = gets(gam,'Players')
local plr = plrs.LocalPlayer

local gui = plr:FindFirstChildWhichIsA("PlayerGui")
local text = gets(gam,'TextChatService')
local chat = gets(gam,'Chat')
local voice = gets(gam,'VoiceChatService')
local core = gets(gam,'CoreGui')
local repli = gets(gam,'ReplicatedStorage')

local cl = text:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local user = plr.UserId

local istagged = nil
local autobypass = nil

local repsig 
local textBox 
if replicatesignal then
    repsig = replicatesignal
end

pcall(function()
    if core:FindFirstChild("ExperienceChat") then
        textBox = core.ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox
    elseif gui:FindFirstChild("Chat") and gui.Chat.Frame:FindFirstChild("ChatBar") then
        textBox = gui.Chat.Frame.ChatBar.TextBox
    else
        warn("Vahhh where is textbox!!")
    end
end)

local isunder13 = plr:GetUnder13()
if isunder13 then
    plr:Kick("You're under 13, this script is for 13+ sorry!")
    return
end

local methodq = {
    ["0"] = "0",
    ["1"] = "1",
    ["2"] = "2",
    ["3"] = "3",
    ["4"] = "4",
    ["5"] = "5",
    ["6"] = "6",
    ["7"] = "7",
    ["8"] = "8",
    ["9"] = "9",
    [" "] = ""
}

local chars = "abcdefghijklmn¿"
local charss = ""

local function check(msg)
    local m = chat:FilterStringForBroadcast(msg, plr)
    if m == msg then
        return false
    else
        return true
    end
end

local function send(msg)
    cl:SendAsync(msg)
end

local function resetfilter()
    local rs = ""
    for i = 1, 20 do
        local rand = math.random(1, #chars)
        rs = rs .. chars:sub(rand, rand)
    end
    return rs
end

local function thai(msg)
    local map = {
        q = "q", w = "พ",e = "e", r = "r",t = "t",
        y = "у", u = "ⴎ", i = "เ่", o = "o", p = "p",
        a = "ล", s = "ร", d = "d",f = "f", g = "g",
        h = "h", j = "ϳ", k = "ҟ", l = "ӏ",
        z = "z", x = "x", c = "c", v = "v", b = "b",
        n = "ⴖ", m = "เาา"
    }

    local ct = ""

    for i = 1, #msg do
        local char = msg:sub(i, i)
        local lower = char:lower()
        if map[lower] then
            if char == lower then
                ct = ct .. map[lower]
            else
                ct = ct .. map[lower]
            end
        else
            ct = ct .. char
        end
    end

    return ct
end

local function thai2(msg)
    local map = {
        q = "q", w = "พ",e = "e", r = "r",t = "t",
        y = "у", u = "ιɹ", i = "เ่", o = "ϙ", p = "p",
        a = "ล", s = "ร", d = "d",f = "f", g = "g",
        h = "Iา", j = "ϳ", k = "ҟ", l = "ӏ",
        z = "z", x = "ӽ", c = "c", v = "v", b = "b",
        n = "ⴖ", m = "เาา"
    }

    local ct = ""

    for i = 1, #msg do
        local char = msg:sub(i, i)
        local lower = char:lower()
        if map[lower] then
            if char == lower then
                ct = ct .. map[lower]
            else
                ct = ct .. map[lower]
            end
        else
            ct = ct .. char
        end
    end

    return ct
end

local function thai3(msg)
    local map = {
        q = "q", w = "พ",e = "e", r = "r",t = "t",
        y = "у", u = "ιɹ", i = "เ่", o = "ϙ", p = "p",
        a = "ล", s = "ร", d = "d",f = "f", g = "g",
        h = "Iา", j = "ϳ", k = "ҟ", l = "ӏ",
        z = "z", x = "ӽ", c = "c", v = "v", b = "b",
        n = "η", m = "เาา"
    }

    local ct = ""

    for i = 1, #msg do
        local char = msg:sub(i, i)
        local lower = char:lower()
        if map[lower] then
            if char == lower then
                ct = ct .. map[lower]
            else
                ct = ct .. map[lower]
            end
        else
            ct = ct .. char
        end
    end

    return ct
end

local function thai4(msg)
    local map = {
        q = "q", w = "พ",e = "e", r = "r",t = "t",
        y = "у", u = "ιɹ", i = "เ่", o = "ϙ", p = "p",
        a = "ส", s = "ธ", d = "d",f = "ƭ", g = "อ",
        h = "Iา", j = "ϳ", k = "ҟ", l = "ӏ",
        z = "z", x = "ӽ", c = "є", v = "v", b = "b",
        n = "ศ", m = "เาา"
    }

    local ct = ""

    for i = 1, #msg do
        local char = msg:sub(i, i)
        local lower = char:lower()
        if map[lower] then
            if char == lower then
                ct = ct .. map[lower]
            else
                ct = ct .. map[lower]
            end
        else
            ct = ct .. char
        end
    end

    return ct
end

Rayfield:Notify({
   Title = "Welcome to the herkle sir, enjoy.",
   Content = "Set Your Language (From Account Settings) To Shqipe* For This To Work. Enjoy",
   Duration = 5,
   Image = "info",
})

local HomeTab = Window:CreateTab("Home", "Home") -- Title, Image
local Tab2 = Window:CreateTab("Bypass", "flag") -- Title, Image

local h = HomeTab:CreateParagraph({ 
    Title = "Welcome",
    Content = "To the cleanest and less tagging chat bypasser. Herkle " .. "[" .. ver .. "]"
})

local er = HomeTab:CreateParagraph({ 
    Title = "Known Bugs",
    Content = "Doesn't convert when clicked > (paper plane) button on the right of typing box"
})

local Button = HomeTab:CreateButton({
   Name = "VoiceChat UnBan (Patched)",
   Callback = function()
        if repsig then
            repsig(voice.ClientRetryJoin)
        end
   end,
})

local Button = HomeTab:CreateButton({
   Name = "Text Chat UnSuspend (Patched)",
   Callback = function()
       if repsig then
           repsig(text.UpdateChatTimeout, user, 1, 1)
       end
   end,
})

local Toggle = Tab2:CreateToggle({
    Name = "Automatic Bypasser",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        autobypass = Value
        
        textBox.FocusLost:Connect(function(func)
            if func and autobypass and textBox.Text ~= "" then
                local func1 = textBox.Text
                textBox.Text = ""
                local msg = func1
                
                local gu = sgsub(msg, "%u", string.lower)
                local st = sgsub(gu, "%d", methodq)
                local srt = sgsub(st, "%s+", methodq)
                local ghw = sgsub(srt, ":", ";")
                
                local rx = check(ghw)
                if not rx then
                    send(ghw)
                    istagged = false
                else
                    istagged = true
                end
                
                if istagged == true then
                    local st = thai(msg)
                    local sp = sgsub(st, "%s+", "")
                    local ghw = sgsub(sp, ":", ";")
     
                    local resut = check(ghw)
                    if not resut then
                        send(ghw)
                        istagged = false
                    else
                        istagged = true
                    end
                end
                
                if istagged == true then
                    local st = thai3(msg)
                    local sp = sgsub(st, "%s+", "")
                    local ghw = sgsub(sp, ":", ";")
     
                    local resut = check(ghw)
                    if not resut then
                        send(ghw)
                        istagged = false
                    else
                        istagged = true
                    end
                end
                
                if istagged == true then
                    local st = thai4(msg)
                    local sp = sgsub(st, "%s+", "")
                    local ghw = sgsub(sp, ":", ";")
     
                    local resut = check(ghw)
                    if not resut then
                        send(ghw)
                        istagged = false
                    else
                        istagged = true
                    end
                end
                
                if istagged == true then
                    Rayfield:Notify({
                        Title = "Herkle Bypass",
                        Content = "Message was tagged, try typing something similar.",
                        Duration = 5, 
                        Image = "x"
                    })
                end
            end
        end)
    end,
})

local Button = Tab2:CreateButton({
   Name = "Reset Filter",
   Callback = function()
       local e = resetfilter()
       send(e)
   end,
})
