-- Contextual Menu build Stash
function EZ_ContextMenuBuildStash(player, context, worldobjects, test)
    if test then return; end

    local character = getSpecificPlayer(player)
    if not character:isOutside() then return; end

    local shovel = ISFarmingMenu.getShovel(character);
    local currentStash = nil;
    local canDigUp = false;
    local canBurry = false;

    if shovel then
        for i,v in ipairs(worldobjects) do
            sq = v:getSquare();
            if sq then
                local stash = CStashSystem.instance:getLuaObjectOnSquare(sq);

                if stash then
                    if stash.state == "burried" then
                        canDigUp = true
                    elseif stash.state == "unburried" then
                        canBurry = true
                    end

                    currentStash = stash;
                end
            end
        end

        -- si il n'y a rien... propose de creer une stash
        if not currentStash then
            if ISFarmingMenu.canDigHere(worldobjects) and not character:getVehicle() then
                if EZ_HasResourcesToBuildStash(character) then
                    context:addOptionOnTop("Build stash", worldobjects, EZ_BuildStash, character, shovel, sq);
                end
            end

        -- si il y a deja une stash déterrer... propose de l'enterrer
        elseif canBurry then
            context:addOptionOnTop("Burry stash", worldobjects, EZ_BuryStash, character, shovel, sq);

        -- si il y a deja une stash enterrer... propose de deterrer
        elseif canDigUp then
            context:addOptionOnTop("DigUp stash", worldobjects, EZ_DigUpStash, character, shovel, sq);
        end
    end
end

function EZ_HasResourcesToBuildStash(character)
    local characterInv = character:getInventory();

    return characterInv:getItemCountRecurse("Base.Nails") >= 3 and characterInv:getItemCountRecurse("Plank") >= 2;
end

function EZ_BuildStash(worldobjects, playerObj, shovel, sq)
    if not ISFarmingMenu.walkToPlant(playerObj, sq) then
        return;
    end

    local handItem = ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), shovel, true);

    -- create stash
    local bo = stashSlot:new(handItem, playerObj);
    bo.player = playerObj:getPlayerNum();
    getCell():setDrag(bo, bo.player);
end

function EZ_BuryStash(worldobjects, playerObj, shovel, sq)
    if not ISFarmingMenu.walkToPlant(playerObj, sq) then
        return;
    end

    local stash = stashSlot.instance:getLuaObjectOnSquare(sq);
    stash.state = "burried";
end

function EZ_DigUpStash(worldobjects, playerObj, shovel, sq)
    if not ISFarmingMenu.walkToPlant(playerObj, sq) then
        return;
    end

    local stash = stashSlot.instance:getLuaObjectOnSquare(sq);
    stash.state = "unburried";
end

-- Events.OnFillWorldObjectContextMenu.Add(EZ_ContextMenuBuildStash);