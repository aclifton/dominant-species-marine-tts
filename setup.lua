require("constants")
require("common")

STANDARD_SETUP_TILES = {
    {WANDERLUST_TILE_CORAL, {1.34, 1.16, 5.39}},
    {WANDERLUST_TILE_SEAGRASS, {3.92, 1.16, 6.85}},
    {WANDERLUST_TILE_SAND, {3.95, 1.16, 3.88}},
    {WANDERLUST_TILE_SEAMOUNT, {-1.30, 1.16, 3.84}},
    {WANDERLUST_TILE_KELP, {-1.33, 1.16, 6.83}},
    {WANDERLUST_TILE_LAND, {1.31, 1.16, 8.38}},
    {WANDERLUST_TILE_LAND, {1.32, 1.16, 11.33}},
    {WANDERLUST_TILE_LAND, {3.90, 1.16, 12.87}},
    {WANDERLUST_TILE_LAND, {-1.30, 1.16, 12.84}},
    {WANDERLUST_TILE_LAND, {1.36, 1.16, 14.36}},
    {WANDERLUST_TILE_OCEAN, {1.30, 1.16, 2.35}},
    {WANDERLUST_TILE_OCEAN, {1.29, 1.16, -0.71}},
    {WANDERLUST_TILE_OCEAN, {3.90, 1.16, -2.23}},
    {WANDERLUST_TILE_OCEAN, {1.28, 1.16, -3.76}},
    {WANDERLUST_TILE_OCEAN, {-1.29, 1.16, -2.15}},
}

RANDOM_EARTH_SETUP_TILES = {
    {nil, {1.34, 1.16, 5.39}},
    {nil, {3.92, 1.16, 6.85}},
    {nil, {3.95, 1.16, 3.88}},
    {nil, {-1.30, 1.16, 3.84}},
    {nil, {-1.33, 1.16, 6.83}},
    {nil, {1.31, 1.16, 8.38}},
    {WANDERLUST_TILE_LAND, {1.32, 1.16, 11.33}},
    {WANDERLUST_TILE_LAND, {3.90, 1.16, 12.87}},
    {WANDERLUST_TILE_LAND, {-1.30, 1.16, 12.84}},
    {WANDERLUST_TILE_LAND, {1.36, 1.16, 14.36}},
    {nil, {1.30, 1.16, 2.35}},
    {WANDERLUST_TILE_OCEAN, {1.29, 1.16, -0.71}},
    {WANDERLUST_TILE_OCEAN, {3.90, 1.16, -2.23}},
    {WANDERLUST_TILE_OCEAN, {1.28, 1.16, -3.76}},
    {WANDERLUST_TILE_OCEAN, {-1.29, 1.16, -2.15}},
}

STANDARD_SETUP_VENTS = {
    {"7944c3", {1.33, 1.26, 14.30}}, -- upper
    {"00d34d", {1.22, 1.36, -3.64}}, -- reef
}

STANDARD_SETUP_ELEMENTS = {
    algae={2.20, 1.26, 6.87},
    gastropods={3.05, 1.26, 5.35},
    worms={2.21, 1.26, 3.87},
    plankton={0.40, 1.26, 3.85},
    sponges={-0.40, 1.36, 5.36},
    sun={0.40, 1.26, 6.84},
}

STANDARD_PLAYER_ELEMENTS = {
    [Player.Brown.color] = {ELEMENT_TYPE_WORMS, ELEMENT_TYPE_WORMS, ELEMENT_TYPE_ALGAE},
    [Player.Blue.color] = {ELEMENT_TYPE_PLANKTON, ELEMENT_TYPE_PLANKTON, ELEMENT_TYPE_ALGAE},
    [Player.Orange.color] = {ELEMENT_TYPE_GASTROPODS, ELEMENT_TYPE_GASTROPODS, ELEMENT_TYPE_SPONGES},
    [Player.Purple.color] = {ELEMENT_TYPE_SUN, ELEMENT_TYPE_SUN, ELEMENT_TYPE_SPONGES},
}

table_settings = {
    evolution_cards_removed = 10,
    alternate_animals = false,
    animal_elements = STANDARD_PLAYER_ELEMENTS,
    earth_tile_pairs = STANDARD_SETUP_TILES,
    earth_elements = { ELEMENT_TYPE_ALGAE, ELEMENT_TYPE_SUN, ELEMENT_TYPE_WORMS, ELEMENT_TYPE_SPONGES, ELEMENT_TYPE_PLANKTON, ELEMENT_TYPE_GASTROPODS },
    random_earth = false,
    setup_done = false,
}

function onSave()
    if table_settings.setup_done then
        return JSON.encode(table_settings)
    else
        return ""
    end
end

function onLoad(save_state)
    self.setLock(true)
    self.setPosition({-23.07, 0, 5.63})
    self.setInvisibleTo(Player.getColors())
    if save_state ~= "" then
        self.UI.setAttribute("layoutSetup", "visibility", "Black")
    else

    end
end

function onUpdate()
end

function onClickStandard()
    local players = getValidSeatedPlayers()
    local playerCount = #players
    if playerCount < 2 then
        broadcastToAll("Please have at least 2 players seated before clicking setup", {r=1, g=0, b=0})
        return
    end
    self.UI.setAttribute("layoutStart", "visibility", "Black")
    startLuaCoroutine(self, "boardSetup")
    self.UI.setAttribute("layoutTrait", "visibility", "Brown|Orange|Blue|Purple")
    self.UI.setAttribute("btnConfirmTraits", "interactable", true)
end

function onClickConfirmTraits()
    self.UI.setAttribute("layoutTrait", "visibility", "Black")
    self.UI.setAttribute("btnConfirmTraits", "interactable", false)
    self.UI.setAttribute("layoutSetup", "visibility", "Black")
    startLuaCoroutine(self, "finishSetup")
end

function finishSetup()
    local playerList = getValidSeatedPlayers()
    local traitDeck = getObjectFromGUID(TRAIT_DECK)
    for _, player in ipairs(playerList) do
        for _, card in ipairs(player.getHandObjects()) do
            traitDeck.putObject(card)
        end
    end
    traitDeck.shuffle()
    setupEvolutionDeck(table_settings.evolution_cards_removed)
    table_settings.setup_done = true
    return 1
end

function onGameLengthSelected(player, option, id)
    local lookup = {
        ["Short"] = 15,
        ["Standard"] = 10,
        ["Long"] = 5,
        ["Epic"] = 0,
    }
    table_settings.evolution_cards_removed = lookup[option]
end

function onAnimalDisplaySelected(player, option, id)
    if option == "Standard" then
        table_settings.alternate_animals = false
    else
        table_settings.alternate_animals = true
    end
end

function onRandomEarthSelected(player, option, id)
    if option == "Standard" then
        table_settings.random_earth = false
        table_settings.earth_tile_pairs = STANDARD_SETUP_TILES
    else
        table_settings.random_earth = true
        table_settings.earth_tile_pairs = RANDOM_EARTH_SETUP_TILES
    end
end

function boardSetup()
    print("setupAnimalDisplays")
    setupAnimalDisplays(table_settings.alternate_animals)
    print("setupTiles")
    setupTiles(table_settings.earth_tile_pairs)
    print("setupVentTiles")
    setupVentTiles()
    if table_settings.random_earth then
        print("setupElementTokensRandom")
        setupElementTokensRandom()
    else
        print("setupElementTokensStandard")
        setupElementTokensStandard()
    end
        print("emptyWanderlustBagToStacks")
    emptyWanderlustBagToStacks()
    local reseedButton = getObjectFromGUID(RESEED_BUTTON)
    reseedButton.call("reseed",false)
    if table_settings.random_earth then
        print("setupSpeciesCubesRandom")
        setupSpeciesCubesRandom()
    else
        print("setupSpeciesCubes")
        setupSpeciesCubes()
    end
    print("removeExtraActionPawns")
    removeExtraActionPawns()
    dealTraits()
    broadcastToAll("Select trait(s) and click confirm to finish setup.", {r=1,g=0,b=0})
    return 1
end

function setupAnimalDisplays(isAlternate)
    if isAlternate then
        local elementBag = getObjectFromGUID(COMMON_COMPONENTS.element_bag)
        local players = getValidSeatedPlayers()
        for _, player in ipairs(players) do
            local guid = PLAYER_COMPONENTS[player.color].boards
            local pb = getObjectFromGUID(guid[1])
            if pb ~= nill then pb.setState(2) end
            local pb2 = getObjectFromGUID(guid[2])
            local snaps = pb2.getSnapPoints()
            table.sort(snaps, function(a, b) return a.position.z < b.position.z end)
            while #snaps > 6 do table.remove(snaps) end
            table.sort(snaps, function(a, b) return a.position.x > b.position.x end)
            local animal_elements = {}
            for ii, snap in ipairs(snaps) do
                if ii <= 3 then
                    local newPosition = snap.position
                    newPosition[2] = snap.position[2] + 2
                    local obj = elementBag.takeObject({position=pb2.positionToWorld(newPosition), rotation={0,180,0}})
                    table.insert(animal_elements, getElementType(obj))
                    table_settings.animal_elements[player.color] = animal_elements
                end
            end
        end
    else
        for _, playerComponents in pairs(PLAYER_COMPONENTS) do
            local pb2 = getObjectFromGUID(playerComponents.boards[2])
            if pb2 ~= nill then pb2.setState(1) end
        end
    end
end

function setupTiles(tileTypePositionPairs)
    local tileRotation = {0, 180, 0}
    local bag = getObjectFromGUID(COMMON_COMPONENTS.wander_lust_bag)
    local wanderlust_tile_cache = {
        [WANDERLUST_TILE_LAND] = {},
        [WANDERLUST_TILE_KELP] = {},
        [WANDERLUST_TILE_SAND] = {},
        [WANDERLUST_TILE_CORAL] = {},
        [WANDERLUST_TILE_OCEAN] = {},
        [WANDERLUST_TILE_SEAGRASS] = {},
        [WANDERLUST_TILE_SEAMOUNT] = {},
        [WANDERLUST_TILE_VENT] = {},
    }
    local randomPairs = {}
    for _, typePosition in ipairs(tileTypePositionPairs) do
        local type = typePosition[1]
        local position = typePosition[2]
        local tile = nil
        if type == nil then
            table.insert(randomPairs, position)
        else
            if #wanderlust_tile_cache[type] > 0 then
                tile = wanderlust_tile_cache[type][1]
                table.remove(wanderlust_tile_cache[type], 1)
            else
                tile = bag.takeObject()
            end
            local foundType = getWanderlustType(tile)
            while type ~= nil and type ~= foundType do
                table.insert(wanderlust_tile_cache[foundType], tile)
                tile = bag.takeObject()
                foundType = getWanderlustType(tile)
                coroutine.yield(0)
            end
            tile.setPosition(position)
            tile.setRotation(tileRotation)
            tile.setLock(true)
        end
    end
    for _, list in pairs(wanderlust_tile_cache) do
        for _, obj in ipairs(list) do
            bag.putObject(obj)
        end
    end
    for _, boardPosition in ipairs(randomPairs) do
        local tile = bag.takeObject()
        tile.setPosition(boardPosition)
        tile.setRotation(tileRotation)
        tile.setLock(true)
    end
    coroutine.yield(0)
end

function setupVentTiles()
    local guid = STANDARD_SETUP_VENTS[1][1]
    local position = STANDARD_SETUP_VENTS[1][2]
    local tile = getObjectFromGUID(guid)
    tile.setPositionSmooth(position, false, true)
    tile.setRotation({0, 180, 0})
    tile.setLock(true)
    guid = STANDARD_SETUP_VENTS[2][1]
    position = STANDARD_SETUP_VENTS[2][2]
    tile = getObjectFromGUID(guid)
    tile.setPosition(position)
    tile.setRotation({0,180, 180})
    tile.setLock(true)
end

function emptyWanderlustBagToStacks()
    local wanderlustStacks = {
        {9.97, 10, -3.33},
        {13.57, 10, -3.31},
        {17.22, 10, -3.28}
    }
    local tileHeight = .4
    local bag = getObjectFromGUID(COMMON_COMPONENTS.wander_lust_bag)
    local stackIndex = 1
    local height = 2
    local stackRotation = {0, 180, 180}
    while #bag.getObjects() > 0 do
        if #bag.getObjects() <= 3 then
            stackRotation = {0, 180, 0}
        end
        local newPosition = wanderlustStacks[stackIndex]
        newPosition[2] = height
        local tile = bag.takeObject({
            rotation = stackRotation,
            position = newPosition
        })
        stackIndex = stackIndex + 1
        if stackIndex > 3 then
            stackIndex = 1
            height = height + tileHeight
        end
    end
end

function setupElementTokensStandard()
        local rotation = {0, 180, 0}
        local elementBag = getObjectFromGUID(COMMON_COMPONENTS.element_bag)
        local elementCache = {
            [ELEMENT_TYPE_SUN] = {},
            [ELEMENT_TYPE_ALGAE] = {},
            [ELEMENT_TYPE_WORMS] = {},
            [ELEMENT_TYPE_SPONGES] = {},
            [ELEMENT_TYPE_PLANKTON] = {},
            [ELEMENT_TYPE_GASTROPODS] = {},
        }
        for element, destination in pairs(STANDARD_SETUP_ELEMENTS) do
            local obj
            if #elementCache[element] > 0 then
                obj = elementCache[element][1]
                table.remove(elementCache[element], 1)
            else
                obj = elementBag.takeObject()
            end
            local foundElement = getElementType(obj)
            while foundElement ~= element do
                table.insert(elementCache[foundElement], obj)
                obj = elementBag.takeObject()
                foundElement = getElementType(obj)
                coroutine.yield(0)
            end
            obj.setPosition(destination)
            obj.setRotation(rotation)
        end
        for _, elementList in pairs(elementCache) do
            for _, obj in ipairs(elementList) do
                elementBag.putObject(obj)
            end
        end
end

function setupElementTokensRandom()
    local valid = true
    local players = getValidSeatedPlayers()
    local rotation = {0, 180, 0}
    local elementBag = getObjectFromGUID(COMMON_COMPONENTS.element_bag)
    local choosenElements = {}
    local elementTypes = {
        [ELEMENT_TYPE_SUN] = false,
        [ELEMENT_TYPE_ALGAE] = false,
        [ELEMENT_TYPE_WORMS] = false,
        [ELEMENT_TYPE_SPONGES] = false,
        [ELEMENT_TYPE_PLANKTON] = false,
        [ELEMENT_TYPE_GASTROPODS] = false,
    }
    for element, destination in pairs(STANDARD_SETUP_ELEMENTS) do
        local wrong = {}
        local obj = elementBag.takeObject()
        table.insert(choosenElements, obj)
        elementTypes[getElementType(obj)] = true
        obj.setPosition(destination)
        obj.setRotation(rotation)
    end
    for _, player in ipairs(players) do
        local hasElement = false
        for _, playerElement in ipairs(table_settings.animal_elements[player.color]) do
            hasElement = hasElement or elementTypes[playerElement]
        end
        valid = valid and hasElement
    end
    if valid == false then
        for _, obj in ipairs(choosenElements) do elementBag.putObject(obj) end
        coroutine.yield(0)
        setupElementTokensRandom()
    else
        local earth_elements = {}
        for _, choosen in ipairs(choosenElements) do
            table.insert(earth_elements, getElementType(choosen))
        end
        table_settings.earth_elements = earth_elements
    end
end

function setupSpeciesCubes()
    local first = vector(0.5, 1.45, 6.12)
    local shiftRight = vector(.5, 0, 0)
    local shiftDown = vector(0, 0, -.5)
    local center = vector(1.30, 1.45, 5.34)
    local count = 0
    local playerList = getValidSeatedPlayers()
    for _, player in ipairs(playerList) do
        local bag = getObjectFromGUID(PLAYER_COMPONENTS[player.color].gene_pool_bag)
        bag.takeObject({position = PLAYER_COMPONENTS[player.color].food_chain_start_position})
        for ii=1,3 do
            local current = first + (shiftRight * ii) + (count * shiftDown)
            bag.takeObject({position=current})
        end
        count = count + 1
    end
end

function positionToVector(position)
    return vector(float, float, float)
end

function setupSpeciesCubesRandom()
    local cubesPlace = {}
    local first = vector(0.5, 1.45, 6.12)
    local shiftRight = vector(.3, 0, 0)
    local shiftDown = vector(0, 0, -.3)
    local shiftUp = vector(0, .4, 0)
    local center = vector(1.30, 1.45, 5.34)
    local playerList = getValidSeatedPlayers()
    local playerCubes = {}
    local cubesPerRow = 3
    for playerIndex, player in ipairs(playerList) do
        local bag = getObjectFromGUID(PLAYER_COMPONENTS[player.color].gene_pool_bag)
        local playerElements = table_settings.animal_elements[player.color]
        local speciesCount = 0
        for _, playerElement in ipairs(playerElements) do
            for _, earthElement in ipairs(table_settings.earth_elements) do
                if playerElement == earthElement then
                    speciesCount = speciesCount + 1
                end
            end
        end
        playerCubes[player.color] = speciesCount
        bag.takeObject({position = PLAYER_COMPONENTS[player.color].food_chain_start_position})
        local totalCount = 0
        local playerFirst = first + (vector(1,0,0) * ((playerIndex - 1) % 2)) + (vector(0, 0, -1) * math.floor((playerIndex - 1)/2))
        for ii=1,speciesCount do
            local current = playerFirst + (shiftRight * (totalCount % cubesPerRow)) + (math.floor(totalCount/cubesPerRow) * shiftDown)
            if ii > 9 then current = current + shiftUp - (3*shiftDown) end
            bag.takeObject({position=current})
            totalCount = totalCount + 1
        end
    end
    -- find center
    local center = Vector(1.34, 1.16, 5.39)
    local centerObjects = getObjectFromGUID(CENTER_SCRIPTING_ZONE).getObjects()
    local centerTile = nil
    for _, obj in ipairs(centerObjects) do
        local wanderlustType = getWanderlustType(obj)
        if wanderlustType ~= nil and center:distance(Vector(obj.getPosition())) < 1 then
            centerTile = wanderlustType
        end
    end
    -- Update scores
    local scores = WANDERLUST_TILE_SCORES[centerTile]
    local sum = 0
    for _, v in ipairs(scores) do sum = sum + v end
    local foodChainOrder = {Player.Purple.color, Player.Orange.color, Player.Blue.color, Player.Brown.color}
    local scoreOrder = getValidSeatedPlayers()
    table.sort(scoreOrder, function(a,b)
        if playerCubes[a.color] == playerCubes[b.color] then
            for _, player in ipairs(foodChainOrder) do
                if player == a.color then
                    return true
                elseif player == b.color then
                    return false
                end
            end
        else
            return playerCubes[a.color] > playerCubes[b.color]
        end
    end)
    local score0 = Vector({19.31, 10, -5.92})
    local scoreOffset = Vector({-.955, 0, 0})
    for ii, score in ipairs(scoreOrder) do
         print(score.color, sum - scores[ii])
         local vpToken = getObjectFromGUID(PLAYER_COMPONENTS[score.color].vp)
         vpToken.setPositionSmooth(score0 + (sum - scores[ii]) * scoreOffset, false, false)
    end
end

function dealTraits()
    local deck = getObjectFromGUID(TRAIT_DECK)
    deck.shuffle()
    deck.deal(3)
end

function setupEvolutionDeck(remove_count)
    local evolutionDeckZone = getObjectFromGUID(EVOLUTION_DECK_ZONE)
    local aboveEvolutionDeck = evolutionDeckZone.getPosition()
    aboveEvolutionDeck[2] = aboveEvolutionDeck[2] + 2
    local deck = getEvolutionReserveDeck()
    deck.shuffle()
    deck.setName("Evolution Deck Removed")
    local asteroid = getObjectFromGUID(ASTEROID_CARD)
    asteroid.setRotation({0, 180, 180})
    asteroid.setPosition(evolutionDeckZone.getPosition())
    for ii=1,4 do
        deck.takeObject({position = aboveEvolutionDeck})
        coroutine.yield(0)
    end
    local newDeck = getEvolutionDeck()
    while newDeck == nil or newDeck.type ~= "Deck" or #newDeck.getObjects() ~= 5 do
        coroutine.yield(0)
        newDeck = getEvolutionDeck()
    end
    newDeck.shuffle()
    newDeck.setName("Evolution Deck")
    local cards_to_add = #getEvolutionReserveDeck().getObjects() - remove_count
    for ii=1,cards_to_add do
        local reserveDeck = getEvolutionReserveDeck()
        if deck.type == "Deck" then
            local card = deck.takeObject()
            card.setPositionSmooth(aboveEvolutionDeck, false, false)
        elseif deck.type == "Card" then
            deck.setPositionSmooth(aboveEvolutionDeck, false, false)
        else
            print("Error building evolution deck.")
            break
        end
        coroutine.yield(0)
    end
    while (35 - remove_count) ~= #newDeck.getObjects() do
        -- newDeck = getEvolutionDeck()
        coroutine.yield(0)
    end
    local evoslots = {
        {-14.10, 1.17, -3.21},
        {-14.10, 1.17, 0.89},
        {-14.18, 1.17, 5.13},
        {-14.15, 1.17, 9.13},
        {-14.14, 1.17, 13.24},
    }
    for _, slot in ipairs(evoslots) do
        newDeck.takeObject({position=slot, rotation={0,180,0}})
    end
end

function removeExtraActionPawns()
    local players = getValidSeatedPlayers()
    local playerCount = #players
    local boxBag = getObjectFromGUID(COMMON_COMPONENTS.box_bag)
    local pawns = {7, 7, 5, 4}
    for _, animal in ipairs({CRUSTACEANS_TAG, FISHES_TAG, CEPHALOPODS_TAG, REPTILES_TAG}) do
        local playerPawns = getObjectsWithAllTags({animal, ACTION_PAWN_TAG})
        table.sort(playerPawns, function (a,b)
            local posa = a.getPosition()
            local posb = b.getPosition()
            if posa[1] == posb[1] then
                return posa[3] < posb[3]
            else
                return posa[1] < posb[1]
            end
        end)
        for ii, actionPawn in ipairs(playerPawns) do
            if ii > pawns[playerCount] then
                boxBag.putObject(actionPawn)
            end
        end
    end
end