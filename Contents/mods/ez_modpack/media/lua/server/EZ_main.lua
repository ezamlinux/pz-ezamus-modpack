-- Display a message to tell people to try to sleep
-- function EZ_checkSleepTime()
--     if getGameTime():getHour() % 24 == 22 then
--         local player = getPlayer();
--         if player == nil then
--             return;
--         end
--         player:Say(getText("IGUI_PlayerText_ez_sleep"));
--     end
-- end

-- Play Church Bell on player death to notify other player
-- function EZ_playerDeath(player)
--     local serverPlayer = getPlayer();

--     if serverPlayer == nil or serverPlayer:getUsername() == player:getUsername() then
--         return;
--     end

--     local churchBellSound = "church_bell";
--     local sound = getSoundManager():PlaySound(churchBellSound, false, 0);
--     getSoundManager():PlayAsMusic(churchBellSound, sound, false, 0);
--     sound:setVolume(0.3);
-- end

-- regive to player jar & more kefir seed
function EZ_recipe_Process_Kefir(items, result, player)
    EZ_recipe_Process_Jar(items, result, player);

    -- recipe coast + 1
    player:getInventory():AddItems("EZ_LR.EZ_KefirSeed", 6);
end

-- use the new 'FullJar' tags in recipe
function Recipe.GetItemTypes.FullJar(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullJar"));
end

-- regive to player jar when empty
function EZ_recipe_Process_Jar(items, result, player)
    EZ_recipe_Empty_Jar(items, result, player);
    player:getInventory():AddItem("Base.JarLid");
end

function EZ_recipe_Empty_Jar(items, result, player)
    player:getInventory():AddItem("Base.EmptyJar");
end

-- save the ropes used
function EZ_recipe_CreateStack(items, result, player)
    local item, itemType;
    local ropeItems = {};
    for i = 0, items:size() - 1 do
        item = items:get(i);
        if item then
            itemType = item:getFullType();
            if itemType ~= "Base.Twigs" and itemType ~= "Base.TreeBranch" then
                table.insert(ropeItems, itemType);
            end;
        end;
    end;
    result:getModData().ropeItems = ropeItems;
end

-- --- EVENTS MANAGER ---
-- Events.EveryHours.Add(EZ_checkSleepTime);
-- Events.OnPlayerDeath.Add(EZ_playerDeath);
