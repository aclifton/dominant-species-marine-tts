require("constants")
require("common")

function onScriptingButtonDown(index, player_color)
    if index == 1 then
        local player = Player[player_color]
        local pointerPosition = player.getPointerPosition()
        pointerPosition[2] = pointerPosition[2] + 2
        local playerComponents = PLAYER_COMPONENTS[player_color]
        if playerComponents ~= nil then
            local speciesBag = getObjectFromGUID(playerComponents.gene_pool_bag)
            if #speciesBag.getObjects() > 0 then
                speciesBag.takeObject({position=pointerPosition, rotation={0,0,0}})
            end
        end
    end
end

function tryObjectEnterContainer(container, object)
    if container.getGUID() == COMMON_COMPONENTS.box_bag and object.hasTag(SPECIES_TAG) then
        for _, info in pairs(PLAYER_COMPONENTS) do
            if object.hasTag(info.tag) then
                getObjectFromGUID(info.eliminated_species).putObject(object)
                return false
            end
        end
    end
    for _, info in pairs(PLAYER_COMPONENTS) do
        if container.getGUID() == info.eliminated_species then
            if not object.hasTag(SPECIES_TAG) then
                return false
            elseif object.hasTag(info.tag) then
                return true
            else
                for _, player_info in pairs(PLAYER_COMPONENTS) do
                    if object.hasTag(player_info.tag) then
                        getObjectFromGUID(player_info.eliminated_species).putObject(object)                        
                    end
                end
                return false
            end
        end
    end
    return true -- Allows object to enter.
end
