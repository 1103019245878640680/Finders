-- SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- WEBHOOK CONFIG
local webhook = {
    Common = "https://canary.discord.com/api/webhooks/1413575233692237824/nA1UB_-MNM-y5O8wmbXOFccOgX7wX6fH82OQpOAANik6VT_JZ01NfTl31FAPEGdT0lxL",
    Rare = "https://canary.discord.com/api/webhooks/1413575144303230986/cH-1HHVnNGaYOwPf7aRMXY9m94EGg7J9nPsON8AbfFdIXplVthg6zmy0aCLosNByjMGb",
    Epic = "https://canary.discord.com/api/webhooks/1413575104910331975/zxb-DEtiIou4I4yf7eoNjmZyxF8DQ3_F_Fdw8GoWDI3gG-JnZejpB7IXbOul7ZnE57aa",
    Legendary = "https://canary.discord.com/api/webhooks/1413575043753185403/HdMCx4ma84n6OV2kX5l5nzQiWpV6t_DtrlU44NVENhqgQzIweQ5QHXjIltITnp2tyv1L",
    Mythic = "https://canary.discord.com/api/webhooks/1413574983019528193/--31V5twWBUX7r1aNLCn6WpTl7Hy6iDo9wEeQ-PASD1DscAm-cusv7sfWiszvcJpj4Rd",
    BrainrotGod = "https://canary.discord.com/api/webhooks/1413574927331754125/oBrfqnad85d2JOhk5BM796REB98L6mwF9vqiaN9EXa0gzSQcONFFbwYJlyvcvQlFSrYH",
    Secret = "https://canary.discord.com/api/webhooks/1413574845207285882/2J19iQHVKfWd5duz9CD_N-UCYPgphqGrvUYk99D-MEHg53Eo9KPSgEaC4bVoJjPY13VO"
}

-- PET NAME TO RARITY MAPPING
local TargetPetNames = {
    -- Common
    ["Noobini Pizzanini"] = "Common",
    ["Lirilì Larilà"] = "Common",
    ["Tim Cheese"] = "Common",
    ["Fluriflura"] = "Common",
    ["Talpa Di Fero"] = "Common",
    ["Svinina Bombardino"] = "Common",
    ["Raccooni Jandelini"] = "Common",
    ["Pipi Kiwi"] = "Common",
    ["Pipi Corni"] = "Common",
    -- Rare
    ["Trippi Troppi"] = "Rare",
    ["Tung Tung Tung Sahur"] = "Rare",
    ["Gangster Footera"] = "Rare",
    ["Bandito Bobritto"] = "Rare",
    ["Boneca Ambalabu"] = "Rare",
    ["Cacto Hipopotamo"] = "Rare",
    ["Ta Ta Ta Ta Sahur"] = "Rare",
    ["Tric Trac Baraboom"] = "Rare",
    ["Pipi Avocado"] = "Rare",
    -- Epic
    ["Cappuccino Assassino"] = "Epic",
    ["Brr Brr Patapim"] = "Epic",
    ["Avocadini Antilopini"] = "Epic",
    ["Trulimero Trulichina"] = "Epic",
    ["Bambini Crostini"] = "Epic",
    ["Bananita Dolphinita"] = "Epic",
    ["Perochello Lemonchello"] = "Epic",
    ["Brri Brri Bicus Dicus Bombicus"] = "Epic",
    ["Avocadini Guffo"] = "Epic",
    ["Ti Ti Ti Sahur"] = "Epic",
    ["Salamino Penguino"] = "Epic",
    ["Penguino Cocosino"] = "Epic",
    -- Legendary
    ["Burbaloni Loliloli"] = "Legendary",
    ["Chimpanzini Bananini"] = "Legendary",
    ["Ballerina Cappuccina"] = "Legendary",
    ["Chef Crabracadabra"] = "Legendary",
    ["Lionel Cactuseli"] = "Legendary",
    ["Glorbo Fruttodrillo"] = "Legendary",
    ["Quivioli Ameleonni"] = "Legendary",
    ["Blueberrinni Octopusini"] = "Legendary",
    ["Pipi Potato"] = "Legendary",
    ["Strawberelli Flamingelli"] = "Legendary",
    ["Cocosini Mama"] = "Legendary",
    ["Pandaccini Bananini"] = "Legendary",
    ["Pi Pi Watermelon"] = "Legendary",
    ["Sigma Boy"] = "Legendary",
    -- Mythic
    ["Frigo Camelo"] = "Mythic",
    ["Orangutini Ananassini"] = "Mythic",
    ["Rhino Toasterino"] = "Mythic",
    ["Bombardiro Crocodilo"] = "Mythic",
    ["Bombombini Gusini"] = "Mythic",
    ["Avocadorilla"] = "Mythic",
    ["Cavallo Virtuoso"] = "Mythic",
    ["Gorilla Watermelondrillo"] = "Mythic",
    ["Tob Tobi Tobi"] = "Mythic",
    ["Lerulerulerule"] = "Mythic",
    ["Ganganzelli Trulala"] = "Mythic",
    ["Te Te Te Sahur"] = "Mythic",
    ["Tracoducotulu Delapeladustuz"] = "Mythic",
    ["Carloo"] = "Mythic",
    -- Brainrot God
    ["Cocofanto Elefanto"] = "BrainrotGod",
    ["Girafa Celestre"] = "BrainrotGod",
    ["Gattatino Nyanino"] = "BrainrotGod",
    ["Matteo"] = "BrainrotGod",
    ["Tralalero Tralala"] = "BrainrotGod",
    ["Los Crocodillitos"] = "BrainrotGod",
    ["Espresso Signora"] = "BrainrotGod",
    ["Odin Din Din Dun"] = "BrainrotGod",
    ["Statutino Libertino"] = "BrainrotGod",
    ["Trenostruzzo Turbo 3000"] = "BrainrotGod",
    ["Trigoligre Frutonni"] = "BrainrotGod",
    ["Orcalero Orcala"] = "BrainrotGod",
    -- Secret
    ["La Vacca Saturno Saturnita"] = "Secret",
    ["Torrtuginni Dragonfrutini"] = "Secret",
    ["Los Tralaleritos"] = "Secret",
    ["Las Tralaleritas"] = "Secret",
    ["Las Vaquitas Saturnitas"] = "Secret",
    ["Graipuss Medussi"] = "Secret",
    ["Pot Hotspot"] = "Secret",
    ["La Grande Combinasion"] = "Secret",
    ["Nuclearo Dinossauro"] = "Secret",
    ["Garama and Madundung"] = "Secret",
    ["Chicleteira Bicicleteira"] = "Secret",
    ["Sammyni Spyderini"] = "Secret",
    ["Agarrini La Palini"] = "Secret",
    ["Los Combinasionas"] = "Secret",
    ["Dragon Cannelloni"] = "Secret",
    ["Dul Dul Dul"] = "Secret",
    ["Karkerkar Kurkur"] = "Secret",
    ["Los Hotspotsitos"] = "Secret",
    ["Esok Sekolah"] = "Secret",
    ["Blackhole Goat"] = "Secret",
    ["Ketupat Kepat"] = "Secret",
    ["Bisonte Giuppitere"] = "Secret",
    ["Los Spyderinis"] = "Secret",
    ["La Supreme Combinasion"] = "Secret",
    ["Los Matteos"] = "Secret",
    ["Job Job Job Sahur"] = "Secret",
    ["Noo My Hotspot"] = "Secret",
    ["Spaghetti Tualetti"] = "Secret"
}

-- PRIVATE SERVER CHECK
local function isPrivateServer()
    return (game.PrivateServerId and game.PrivateServerId ~= "")
        or (game.VIPServerId and game.VIPServerId ~= "")
end

-- ALLOWED PLACE IDS
local allowedPlaceIds = {
    [96342491571673] = true, -- New Players Server
    [109983668079237] = true -- Normal
}

-- BUILD JOIN LINK
local function buildJoinLink(placeId, jobId)
    return string.format(
        "https://chillihub1.github.io/chillihub-joiner/?placeId=%d&gameInstanceId=%s",
        placeId,
        jobId
    )
end

-- KICK CHECKS
if isPrivateServer() then
    LocalPlayer:Kick("Kicked: Private server detected")
    return
elseif not allowedPlaceIds[game.PlaceId] then
    local joinLink = buildJoinLink(game.PlaceId, game.JobId)
    LocalPlayer:Kick("Kicked: Invalid game\nClick to join server:\n" .. joinLink)
    return
end

-- WEBHOOK SEND
local function sendWebhook(foundPets, jobId, rarity)
    local petCounts = {}
    for _, pet in ipairs(foundPets) do
        petCounts[pet] = (petCounts[pet] or 0) + 1
    end

    local formattedPets = {}
    for petName, count in pairs(petCounts) do
        table.insert(formattedPets, "• " .. petName .. (count > 1 and " (x" .. count .. ")" or ""))
    end

    local joinLink = buildJoinLink(game.PlaceId, jobId)
    local serverDetails = string.format("**Server Size**: %d/%d\n**Job ID**: `%s`", #Players:GetPlayers(), Players.MaxPlayers, jobId)
    local timestamp = DateTime.now():ToIsoDate()

    local embedData = {
        username = "Pet Finder Pro",
        avatar_url = "https://i.imgur.com/8J3kZ5q.png", -- Professional-looking avatar (replace with a real URL if you have one)
        embeds = { {
            title = "✨ Rare Pet Alert: " .. rarity .. " ✨",
            description = "```yaml\n" .. table.concat(formattedPets, "\n") .. "\n```",
            color = ({
                Common = 0x00FF00, -- Green
                Rare = 0x1E90FF, -- Blue
                Epic = 0x800080, -- Purple
                Legendary = 0xFFD700, -- Gold
                Mythic = 0xFF4500, -- OrangeRed
                BrainrotGod = 0xFF69B4, -- HotPink
                Secret = 0x2F4F4F -- DarkSlateGray
            })[rarity] or 0x00FF00,
            fields = {
                {
                    name = "Server Information",
                    value = serverDetails,
                    inline = true
                },
                {
                    name = "Join Server",
                    value = "[Click to Join](" .. joinLink .. ")",
                    inline = true
                }
            },
            thumbnail = {
                url = "https://i.imgur.com/Qs7jX9p.png" -- Professional pet-themed thumbnail (replace with a real URL)
            },
            footer = {
                text = "Pet Finder Pro | Powered by xAI",
                icon_url = "https://i.imgur.com/xAIlogo.png" -- xAI logo or similar (replace with a real URL)
            },
            timestamp = timestamp
        } }
    }

    local jsonData = HttpService:JSONEncode(embedData)
    local req = http_request or request or (syn and syn.request)
    if req then
        local success, err = pcall(function()
            req({
                Url = webhook[rarity],
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = jsonData
            })
        end)
        if success then
            print("✅ Webhook sent for " .. rarity)
        else
            warn("❌ Webhook failed for " .. rarity .. ": " .. tostring(err))
        end
    else
        warn("❌ No HTTP request function available")
    end
end

-- PET CHECK
local function checkForPets()
    local foundByRarity = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local nameLower = string.lower(obj.Name)
            for target, rarity in pairs(TargetPetNames) do
                if string.find(nameLower, string.lower(target)) then
                    foundByRarity[rarity] = foundByRarity[rarity] or {}
                    table.insert(foundByRarity[rarity], obj.Name)
                    break
                end
            end
        end
    end
    return foundByRarity
end

-- RANDOM SERVER JOIN
local function randomServerJoin()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end

-- SERVER HOP (LOW PLAYER COUNT)
local function serverHop()
    if getgenv().Rejoin.HopServer then
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        local serverList = servers.data
        for _, server in ipairs(serverList) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    else
        randomServerJoin()
    end
end

-- AUTO REJOIN
if getgenv().Rejoin and getgenv().Rejoin.AutoRejoin then
    task.spawn(function()
        task.wait(getgenv().Rejoin.AutoRejoin)
        randomServerJoin()
    end)
end

-- MAIN LOOP
task.spawn(function()
    while true do
        local petsFound = checkForPets()
        local anyFound = false
        for rarity, pets in pairs(petsFound) do
            if #pets > 0 then
                anyFound = true
                print("✅ Pets found in " .. rarity .. ": " .. table.concat(pets, ", "))
                sendWebhook(pets, game.JobId, rarity)
            end
        end
        if not anyFound then
            print("🔍 No pets found")
            if getgenv().Rejoin and getgenv().Rejoin.HopServer then
                serverHop()
            end
        end
        task.wait(15)
    end
end)
