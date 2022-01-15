ABUNDANCE_ZONE =  Global.getVar("ABUNDANCE_ZONE")
AUTOTROPHS_ZONE =  Global.getVar("AUTOTROPHS_ZONE")
DEPLETION_ZONE =  Global.getVar("DEPLETION_ZONE")
ADAPTION_ZONE =  Global.getVar("ADAPTION_ZONE")
REGRESSION_ZONE =  Global.getVar("REGRESSION_ZONE")
SPECIATION_ZONE = Global.getVar("SPECIATION_ZONE")
WANDERLUST_ZONE =  Global.getVar("WANDERLUST_ZONE")
COMPETITION_ZONE =  Global.getVar("COMPETITION_ZONE")
EVOLUTION_ZONE =  Global.getVar("EVOLUTION_ZONE")

COMMON_COMPONENTS = Global.getTable("COMMON_COMPONENTS")
PLAYER_COMPONENTS = Global.getTable("PLAYER_COMPONENTS")

ELEMENT_TAG =  Global.getVar("ELEMENT_TAG")
TERRAIN_TAG =  Global.getVar("TERRAIN_TAG")
SPECIES_TAG = Global.getVar("SPECIES_TAG")

WANDERLUST_TILE_VENT = Global.getVar("WANDERLUST_TILE_VENT")
WANDERLUST_TILE_OCEAN = Global.getVar("WANDERLUST_TILE_OCEAN")
WANDERLUST_TILE_SAND = Global.getVar("WANDERLUST_TILE_SAND")
WANDERLUST_TILE_SEAGRASS = Global.getVar("WANDERLUST_TILE_SEAGRASS")
WANDERLUST_TILE_SEAMOUNT = Global.getVar("WANDERLUST_TILE_SEAMOUNT")
WANDERLUST_TILE_CORAL = Global.getVar("WANDERLUST_TILE_CORAL")
WANDERLUST_TILE_KELP = Global.getVar("WANDERLUST_TILE_KELP")
WANDERLUST_TILE_LAND = Global.getVar("WANDERLUST_TILE_LAND")

ABUNDANCE_POSITIONS = {
    {14.55, 1.26, 15.01},
    {15.26, 1.16, 15.01},
    {16.00, 1.16, 15.01},
    {16.72, 1.16, 15.00}
}
AUTOTROPHS_POSITIONS = {
    {14.61, 1.26, 13.80},
    {15.24, 1.16, 13.84},
    {16.00, 1.16, 13.86},
    {16.71, 1.26, 13.85}
}
DEPLETION_POSITIONS = {
    {14.52, 1.26, 12.49},
    {15.17, 1.16, 12.49},
    {15.96, 1.16, 12.47},
    {16.73, 1.26, 12.48}
}
ADAPTION_POSITIONS = {
    {14.54, 1.26, 11.33},
    {15.27, 1.16, 11.34},
    {16.00, 1.16, 11.33},
    {16.68, 1.26, 11.32}
}
REGRESSION_POSITIONS = {
    {14.59, 1.26, 10.10},
    {15.27, 1.16, 10.10},
    {16.05, 1.16, 10.12},
    {16.76, 1.26, 10.12}
}
SPECIATION_POSITIONS = {
    {13.16, 1.26, 7.95},
    {14.46, 1.16, 7.97},
    {15.74, 1.26, 7.97},
    {17.05, 1.16, 7.97},
}
WANDERLUST_POSITIONS = {
    {14.54, 1.26, 6.78},
    {15.24, 1.16, 6.77},
    {15.98, 1.26, 6.78},
    {16.69, 1.16, 6.78},
}
COMPETITION_POSITIONS = {
    {15.13, 1.26, 2.86},
    {16.38, 1.16, 2.88},
    {17.67, 1.16, 2.87}
}
EVOLUTION_POSITIONS = {
    {15.10, 1.26, 1.39},
    {16.09, 1.16, 1.41},
    {17.14, 1.26, 1.40},
    {18.09, 1.26, 1.37},
    {19.10, 1.26, 1.39},
}

function getElementType(obj)
    return Global.call("getElementType",obj)
end

function getTerrainMarkerType(obj)
    return Global.call("getTerrainMarkerType", obj)
end

function onLoad()
    self.setPosition({-7.50, .9, 12.63})
    self.setLock(true)
end

function onUpdate()
end

function onClick()
    startLuaCoroutine(self, "reseedCoroutine")
end

function reseedCoroutine()
    reseed(true)
    return 1
end

function reseed(notify)
    if notify then notifyRegression() end
    removeElements(DEPLETION_ZONE)
    removeElements(REGRESSION_ZONE)
    removeElements(SPECIATION_ZONE)
    removeElements(WANDERLUST_ZONE)
    removeTerrain(COMPETITION_ZONE)
    removeTerrain(EVOLUTION_ZONE)
    addFromBagToPosition(COMMON_COMPONENTS.terrain_bag, COMPETITION_POSITIONS)
    -- addFromBagToPosition(COMMON_COMPONENTS.terrain_bag, EVOLUTION_POSITIONS)
    addTerrainEvolution()
    shiftElements(ADAPTION_ZONE, REGRESSION_POSITIONS)
    shiftElements(AUTOTROPHS_ZONE, DEPLETION_POSITIONS)
    shiftElements(ABUNDANCE_ZONE, AUTOTROPHS_POSITIONS)
    addFromBagToPosition(COMMON_COMPONENTS.element_bag, ABUNDANCE_POSITIONS)
    addFromBagToPosition(COMMON_COMPONENTS.element_bag, ADAPTION_POSITIONS)
    addFromBagToPosition(COMMON_COMPONENTS.element_bag, SPECIATION_POSITIONS)
    addFromBagToPosition(COMMON_COMPONENTS.element_bag, WANDERLUST_POSITIONS)
    resetFoodChainCubes()
end

function notifyRegression()
    local regression = getObjectFromGUID(REGRESSION_ZONE)
    local regressionElementsSet = {}
    for _,obj in ipairs(regression.getObjects()) do
        if obj.hasTag(ELEMENT_TAG) then
            local url = obj.getCustomObject().image
            regressionElementsSet[getElementType(obj)] = true
        end
    end
    local regressionElementList = {}
    for k,v in pairs(regressionElementsSet) do
        table.insert(regressionElementList, #regressionElementList + 1, k)
    end

    local rgb = {r=1, g=0, b=0}
    local msg = "Remove all elements from earth that are surrounded by exactly 3 Vent tiles."
    if #regressionElementList > 0 then
        local msgRegression = "Regression action: "
        for ii, value in ipairs(regressionElementList) do
            if ii ~= 1 then
                msgRegression = msgRegression .. ", "
            end
            msgRegression = msgRegression .. value
        end
        broadcastToAll(msg .. "\n" .. msgRegression, rgb)
    else
        broadcastToAll(msg, rgb)
    end
end

function removeElements(zone_guid)
    local bag = getObjectFromGUID(COMMON_COMPONENTS.element_bag)
    local zone = getObjectFromGUID(zone_guid)
    for _, obj in ipairs(zone.getObjects()) do
        if obj.hasTag(ELEMENT_TAG) then
            bag.putObject(obj)
        end
    end
end

function removeTerrain(zone_guid)
    local bag = getObjectFromGUID(COMMON_COMPONENTS.terrain_bag)
    local zone = getObjectFromGUID(zone_guid)
    for _, obj in ipairs(zone.getObjects()) do
        if obj.hasTag(TERRAIN_TAG) then
            bag.putObject(obj)
        end
    end
end

function addFromBagToPosition(bag_guid, dest_positions)
    local bag = getObjectFromGUID(bag_guid)
    for _, position in ipairs(dest_positions) do
        local params = {}
        params.position = position
        params.rotation = {0, 180, 0}
        bag.takeObject(params)
    end
end

function shiftElements(src_zone_guid, dest_positions)
    local zoneSrc = getObjectFromGUID(src_zone_guid)
    local positionIndex = 1
    for ii, element in ipairs(zoneSrc.getObjects()) do
        if element.hasTag(ELEMENT_TAG) and positionIndex <= #dest_positions then
            element.setPositionSmooth(dest_positions[positionIndex], false, false)
            element.setRotation({0, 180, 0})
            positionIndex = positionIndex + 1
        end
    end
end

function addElementsFromBag(dest_positions)
    local bag = getObjectFromGUID(COMMON_COMPONENTS.element_bag)
    for _, position in ipairs(dest_positions) do
        local params = {}
        params.position = position
        params.rotation = {0, 180, 0}
        bag.takeObject(params)
    end
end

function resetFoodChainCubes()
    for color, playerComponents in pairs(PLAYER_COMPONENTS) do
        local zoneRef = getObjectFromGUID(playerComponents.food_chain_zone)
        if zoneRef ~= nil then
            for _, obj in ipairs(zoneRef.getObjects()) do
                if obj.hasTag(SPECIES_TAG) then
                    obj.setPositionSmooth(playerComponents.food_chain_start_position, false, false)
                end
            end
        end
    end
end

function addTerrainEvolution()
    local bag = getObjectFromGUID(COMMON_COMPONENTS.terrain_bag)
    local terrains = {}
    for ii=1,#EVOLUTION_POSITIONS do
        local obj = bag.takeObject()
        table.insert(terrains, obj)
    end
    local terrain_index = {
        [WANDERLUST_TILE_LAND] = 1,
        [WANDERLUST_TILE_KELP] = 2,
        [WANDERLUST_TILE_CORAL] = 3,
        [WANDERLUST_TILE_SEAMOUNT] = 4,
        [WANDERLUST_TILE_SEAGRASS] = 5,
        [WANDERLUST_TILE_SAND] = 6,
        [WANDERLUST_TILE_OCEAN] = 7,
        [WANDERLUST_TILE_VENT] = 8,
    }
    table.sort(terrains, function(a,b)
        return terrain_index[getTerrainMarkerType(a)] < terrain_index[getTerrainMarkerType(b)]
    end)
    for ii, position in ipairs(EVOLUTION_POSITIONS) do
        terrains[ii].setPosition(position)
        terrains[ii].setRotation({0,180,0})
    end
end