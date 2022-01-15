require("constants")

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

function getDeckOrCardFromZone(zone_guid)
    local zone = getObjectFromGUID(zone_guid)
    if zone == nil then return nil end
    for _, obj in ipairs(zone.getObjects()) do
        if obj.type == "Deck" then
            return obj
        end
    end
    for _, obj in ipairs(zone.getObjects()) do
        if obj.type == "Card" then
            return obj
        end
    end
    return nil

end

function getEvolutionDeck()
    return getDeckOrCardFromZone(EVOLUTION_DECK_ZONE)
end

function getEvolutionReserveDeck()
    return getDeckOrCardFromZone(EVOLUTION_RESERVE_ZONE)
end