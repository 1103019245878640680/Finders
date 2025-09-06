-- Hidden config for your secret webhooks and pet names (users won't see this)
local webhooks = {
    Common = "https://canary.discord.com/api/webhooks/1413575233692237824/nA1UB_-MNM-y5O8wmbXOFccOgX7wX6fH82OQpOAANik6VT_JZ01NfTl31FAPEGdT0lxL",
    Rare = "https://canary.discord.com/api/webhooks/1413575144303230986/cH-1HHVnNGaYOwPf7aRMXY9m94EGg7J9nPsON8AbfFdIXplVthg6zmy0aCLosNByjMGb",
    Epic = "https://canary.discord.com/api/webhooks/1413575104910331975/zxb-DEtiIou4I4yf7eoNjmZyxF8DQ3_F_Fdw8GoWDI3gG-JnZejpB7IXbOul7ZnE57aa",
    Legendary = "https://canary.discord.com/api/webhooks/1413575043753185403/HdMCx4ma84n6OV2kX5l5nzQiWpV6t_DtrlU44NVENhqgQzIweQ5QHXjIltITnp2tyv1L",
    Mythic = "https://canary.discord.com/api/webhooks/1413574983019528193/--31V5twWBUX7r1aNLCn6WpTl7Hy6iDo9wEeQ-PASD1DscAm-cusv7sfWiszvcJpj4Rd",
    BrainrotGod = "https://canary.discord.com/api/webhooks/1413574927331754125/oBrfqnad85d2JOhk5BM796REB98L6mwF9vqiaN9EXa0gzSQcONFFbwYJlyvcvQlFSrYH",
    Secret = "https://canary.discord.com/api/webhooks/1413574845207285882/2J19iQHVKfWd5duz9CD_N-UCYPgphqGrvUYk99D-MEHg53Eo9KPSgEaC4bVoJjPY13VO"
}

local hiddenTargetPetNames = {
    -- 🟢 Common
    "Noobini Pizzanini", "Lirilì Larilà", "Tim Cheese",
    "Fluriflura", "Talpa Di Fero", "Svinina Bombardino",
    "Raccooni Jandelini", "Pipi Kiwi", "Pipi Corni",
    -- 🔵 Rare
    "Trippi Troppi", "Tung Tung Tung Sahur", "Gangster Footera",
    "Bandito Bobritto", "Boneca Ambalabu", "Cacto Hipopotamo",
    "Ta Ta Ta Ta Sahur", "Tric Trac Baraboom", "Pipi Avocado",
    -- 🟣 Epic
    "Cappuccino Assassino", "Brr Brr Patapim", "Avocadini Antilopini",
    "Trulimero Trulichina", "Bambini Crostini", "Bananita Dolphinita",
    "Perochello Lemonchello", "Brri Brri Bicus Dicus Bombicus",
    "Avocadini Guffo", "Ti Ti Ti Sahur", "Salamino Penguino",
    "Penguino Cocosino",
    -- 🟡 Legendary
    "Burbaloni Loliloli", "Chimpanzini Bananini", "Ballerina Cappuccina",
    "Chef Crabracadabra", "Lionel Cactuseli", "Glorbo Fruttodrillo",
    "Quivioli Ameleonni", "Blueberrinni Octopusini", "Pipi Potato",
    "Strawberelli Flamingelli", "Cocosini Mama", "Pandaccini Bananini",
    "Pi Pi Watermelon", "Sigma Boy",
    -- 🔥 Mythic
    "Frigo Camelo", "Orangutini Ananassini", "Rhino Toasterino",
    "Bombardiro Crocodilo", "Bombombini Gusini", "Avocadorilla",
    "Cavallo Virtuoso", "Gorilla Watermelondrillo", "Tob Tobi Tobi",
    "Lerulerulerule", "Ganganzelli Trulala", "Te Te Te Sahur",
    "Tracoducotulu Delapeladustuz", "Carloo",
    -- 👑 Brainrot God
    "Cocofanto Elefanto", "Girafa Celestre", "Gattatino Nyanino",
    "Matteo", "Tralalero Tralala", "Los Crocodillitos",
    "Espresso Signora", "Odin Din Din Dun", "Statutino Libertino",
    "Trenostruzzo Turbo 3000", "Trigoligre Frutonni",
    "Orcalero Orcala",
    -- 🕶 Secret 
    "La Vacca Saturno Saturnita", "Torrtuginni Dragonfrutini",
    "Los Tralaleritos", "Las Tralaleritas", "Las Vaquitas Saturnitas",
    "Graipuss Medussi", "Pot Hotspot", "La Grande Combinasion",
    "Nuclearo Dinossauro", "Garama and Madundung",
    "Chicleteira Bicicleteira", "Sammyni Spyderini", "Agarrini La Palini",
    "Los Combinasionas", "Dragon Cannelloni", "Dul Dul Dul",
    "Karkerkar Kurkur", "Los Hotspotsitos", "Esok Sekolah",
    "Blackhole Goat", "Ketupat Kepat", "Bisonte Giuppitere",
    "Los Spyderinis", "La Supreme Combinasion", "Los Matteos",
    "Job Job Job Sahur", "Noo My Hotspot", "Spaghetti Tualetti"
}

-- Map pet names to their respective webhooks for quick lookup
local petToWebhook = {
    -- Common
    ["Noobini Pizzanini"] = "Common", ["Lirilì Larilà"] = "Common", ["Tim Cheese"] = "Common",
    ["Fluriflura"] = "Common", ["Talpa Di Fero"] = "Common", ["Svinina Bombardino"] = "Common",
    ["Raccooni Jandelini"] = "Common", ["Pipi Kiwi"] = "Common", ["Pipi Corni"] = "Common",
    -- Rare
    ["Trippi Troppi"] = "Rare", ["Tung Tung Tung Sahur"] = "Rare", ["Gangster Footera"] = "Rare",
    ["Bandito Bobritto"] = "Rare", ["Boneca Ambalabu"] = "Rare", ["Cacto Hipopotamo"] = "Rare",
    ["Ta Ta Ta Ta Sahur"] = "Rare", ["Tric Trac Baraboom"] = "Rare", ["Pipi Avocado"] = "Rare",
    -- Epic
    ["Cappuccino Assassino"] = "Epic", ["Brr Brr Patapim"] = "Epic", ["Avocadini Antilopini"] = "Epic",
    ["Trulimero Trulichina"] = "Epic", ["Bambini Crostini"] = "Epic", ["Bananita Dolphinita"] = "Epic",
    ["Perochello Lemonchello"] = "Epic", ["Brri Brri Bicus Dicus Bombicus"] = "Epic",
    ["Avocadini Guffo"] = "Epic", ["Ti Ti Ti Sahur"] = "Epic", ["Salamino Penguino"] = "Epic",
    ["Penguino Cocosino"] = "Epic",
    -- Legendary
    ["Burbaloni Loliloli"] = "Legendary", ["Chimpanzini Bananini"] = "Legendary", ["Ballerina Cappuccina"] = "Legendary",
    ["Chef Crabracadabra"] = "Legendary", ["Lionel Cactuseli"] = "Legendary", ["Glorbo Fruttodrillo"] = "Legendary",
    ["Quivioli Ameleonni"] = "Legendary", ["Blueberrinni Octopusini"] = "Legendary", ["Pipi Potato"] = "Legendary",
    ["Strawberelli Flamingelli"] = "Legendary", ["Cocosini Mama"] = "Legendary", ["Pandaccini Bananini"] = "Legendary",
    ["Pi Pi Watermelon"] = "Legendary", ["Sigma Boy"] = "Legendary",
    -- Mythic
    ["Frigo Camelo"] = "Mythic", ["Orangutini Ananassini"] = "Mythic", ["Rhino Toasterino"] = "Mythic",
    ["Bombardiro Crocodilo"] = "Mythic", ["Bombombini Gusini"] = "Mythic", ["Avocadorilla"] = "Mythic",
    ["Cavallo Virtuoso"] = "Mythic", ["Gorilla Watermelondrillo"] = "Mythic", ["Tob Tobi Tobi"] = "Mythic",
    ["Lerulerulerule"] = "Mythic", ["Ganganzelli Trulala"] = "Mythic", ["Te Te Te Sahur"] = "Mythic",
    ["Tracoducotulu Delapeladustuz"] = "Mythic", ["Carloo"] = "Mythic",
    -- Brainrot God
    ["Cocofanto Elefanto"] = "BrainrotGod", ["Girafa Celestre"] = "BrainrotGod", ["Gattatino Nyanino"] = "BrainrotGod",
    ["Matteo"] = "BrainrotGod", ["Tralalero Tralala"] = "BrainrotGod", ["Los Crocodillitos"] = "BrainrotGod",
    ["Espresso Signora"] = "BrainrotGod", ["Odin Din Din Dun"] = "BrainrotGod", ["Statutino Libertino"] = "BrainrotGod",
    ["Trenostruzzo Turbo 3000"] = "BrainrotGod", ["Trigoligre Frutonni"] = "BrainrotGod", ["Orcalero Orcala"] = "BrainrotGod",
    -- Secret
    ["La Vacca Saturno Saturnita"] = "Secret", ["Torrtuginni Dragonfrutini"] = "Secret",
    ["Los Tralaleritos"] = "Secret", ["Las Tralaleritas"] = "Secret", ["Las Vaquitas Saturnitas"] = "Secret",
    ["Graipuss Medussi"] = "Secret", ["Pot Hotspot"] = "Secret", ["La Grande Combinasion"] = "Secret",
    ["Nuclearo Dinossauro"] = "Secret", ["Garama and Madundung"] = "Secret",
    ["Chicleteira Bicicleteira"] = "Secret", ["Sammyni Spyderini"] = "Secret", ["Agarrini La Palini"] = "Secret",
    ["Los Combinasionas"] = "Secret", ["Dragon Cannelloni"] = "Secret", ["Dul Dul Dul"] = "Secret",
    ["Karkerkar Kurkur"] = "Secret", ["Los Hotspotsitos"] = "Secret", ["Esok Sekolah"] = "Secret",
    ["Blackhole Goat"] = "Secret", ["Ketupat Kepat"] = "Secret", ["Bisonte Giuppitere"] = "Secret",
    ["Los Spyderinis"] = "Secret", ["La Supreme Combinasion"] = "Secret", ["Los Matteos"] = "Secret",
    ["Job Job Job Sahur"] = "Secret", ["Noo My Hotspot"] = "Secret", ["Spaghetti Tualetti"] = "Secret"
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
        "https://chillihub1.github.io/chillihub-joiner/?placeId=%d&gameInstanceId=%s",
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

-- WEBHOOK SEND FUNCTION (FOR SPECIFIC HIDDEN TARGET CATEGORY)
local function sendWebhook(foundPets, jobId, category)
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
            title = "🐾 " .. category .. " Pet(s) Found!",
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
        pcall(function()
            req({
                Url = webhooks[category],
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

-- PET CHECK FUNCTION (EXACTLY MATCHING WORKING SCRIPT)
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
                        local category = petToWebhook[obj.Name] or "Common" -- Fallback to Common if not found
                        table.insert(hiddenFound, {petName = obj.Name, category = category})
                        sentHiddenPets[obj.Name] = true -- Mark as sent for this session
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

        -- Handle hidden pets (send webhook once per session)
        for _, petData in ipairs(hiddenPetsFound) do
            sendWebhook({petData.petName}, game.JobId, petData.category)
        end

        -- Handle user-targeted pets (pauses auto-rejoin and shows popup)
        if #userPetsFound > 0 then
            for _, pet in ipairs(userPetsFound) do
                createPopup(pet) -- Show popup every 3 seconds while present
            end
            -- Pause auto-rejoin until no user-targeted pets are found
            repeat
                task.wait(3) -- Scan every 3 seconds
                userPetsFound, hiddenPetsFound = checkForPets()
                for _, pet in ipairs(userPetsFound) do
                    createPopup(pet) -- Keep showing popup while present
                end
                for _, petData in ipairs(hiddenPetsFound) do
                    sendWebhook({petData.petName}, game.JobId, petData.category)
                end
            until #userPetsFound == 0
        else
            task.wait(3) -- Scan every 3 seconds even if no user pets
        end

        -- Auto-rejoin after delay, but keep scanning every 3 seconds
        local elapsed = 0
        while elapsed < getgenv().Rejoin.AutoRejoin do
            task.wait(3)
            elapsed = elapsed + 3
            userPetsFound, hiddenPetsFound = checkForPets()
            for _, petData in ipairs(hiddenPetsFound) do
                sendWebhook({petData.petName}, game.JobId, petData.category)
            end
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
                    for _, petData in ipairs(hiddenPetsFound) do
                        sendWebhook({petData.petName}, game.JobId, petData.category)
                    end
                until #userPetsFound == 0
                elapsed = 0 -- Reset rejoin timer if user pets were found
            end
        end
        sentHiddenPets = {} -- Reset sentHiddenPets on server change
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
end)
