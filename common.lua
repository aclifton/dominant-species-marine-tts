require("constants")
local DeckUtils = require("tts-utils.DeckUtils")

function getElementType(obj)
    if obj.hasTag(ELEMENT_TAG) then
        return ELEMENT_RESOURCE_TO_NAME_MAP[obj.getCustomObject().image]
    else
        return nil
    end
end

function getWanderlustType(obj)
    if obj.hasTag(WANDERLUST_TAG) then
        return WANDERLUST_RESOURCE_TO_NAME_MAP[obj.getCustomObject().image]
    else
        return nil
    end
end

function getTerrainMarkerType(obj)
    if obj.hasTag(TERRAIN_TAG) then
        return TERRAIN_RESOURCE_TO_NAME_MAP[obj.getCustomObject().image]
    else
        return nil
    end
end

function getValidSeatedPlayers()
    local players = {Player["Brown"], Player["Blue"], Player["Orange"], Player["Purple"]}
    local seatedPlayers = {}
    for _,player in ipairs(players) do
        if player.seated then
            table.insert(seatedPlayers, #seatedPlayers + 1, player)
        end
    end
    return seatedPlayers
end

function getEvolutionDeck()
    return DeckUtils.getDeckOrCardFromZone(EVOLUTION_DECK_ZONE)
end

function getEvolutionReserveDeck()
    return DeckUtils.getDeckOrCardFromZone(EVOLUTION_RESERVE_ZONE)
end