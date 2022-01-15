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