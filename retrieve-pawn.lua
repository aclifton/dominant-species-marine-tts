require("constants")
local ComponentUtils = require("tts-utils.ComponentUtils")

function onClick()
    local tags = self.getTags()
    local animalTag = tags[1]
    local playerColor = nil
    for key, playerComponents in pairs(PLAYER_COMPONENTS) do
        if playerComponents.tag == animalTag then
            playerColor = key
        end
    end
    table.insert(tags, ACTION_PAWN_TAG)
    local pawns = getObjectsWithAllTags(tags)
    -- Add special pawns to list
    for _, obj in ipairs(getObjectFromGUID(PLAYER_COMPONENTS[playerColor].control_marker_zone).getObjects()) do
        if obj.getGUID() == COMMON_COMPONENTS.control_marker_sun then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_sun))
        elseif obj.getGUID() == COMMON_COMPONENTS.control_marker_plankton then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_plankton))
        elseif obj.getGUID() == COMMON_COMPONENTS.control_marker_worms then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_worms))
        elseif obj.getGUID() == COMMON_COMPONENTS.control_marker_sponges then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_sponges))
        elseif obj.getGUID() == COMMON_COMPONENTS.control_marker_gastropods then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_gastropods))
        elseif obj.getGUID() == COMMON_COMPONENTS.control_marker_algae then
            table.insert(pawns, getObjectFromGUID(COMMON_COMPONENTS.special_pawn_algae))
        end
    end
    -- Move pawns into position
    ComponentUtils.arrange({
        items = pawns,
        padding = .1,
        origin = PLAYER_COMPONENTS[playerColor].action_pawn_position_first,
        alignment = "left",
        rows = 2,
        cols = math.ceil(#pawns/2),
        positionSmooth = true,
        reverseRowDirection = true,
    })
    -- Move food chain cube
    local food_chain_zone = getObjectFromGUID(COMMON_COMPONENTS.food_chain_start_zone)
    for _, obj in ipairs(food_chain_zone.getObjects()) do
        if obj.hasTag(SPECIES_TAG) and obj.hasTag(animalTag) then
            obj.setPositionSmooth(PLAYER_COMPONENTS[playerColor].food_chain_end_position, false, false)
        end
    end
end