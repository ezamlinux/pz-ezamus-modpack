-- Display a message to tell people to try to sleep
function EZ_checkSleepTime()
    if getGameTime():getHour() % 24 == 22 then
        local player = getPlayer();
        if player == nil then
            return;
        end
        player:Say(getText("IGUI_PlayerText_ez_sleep"));
    end
end

-- Play Ring Bell on player death to notify other player
function EZ_ringTheBell(player)
    local churchBellSound = "church_bell";

    local sound = getSoundManager():PlaySound(churchBellSound, false, 0);
    getSoundManager():PlayAsMusic(churchBellSound, sound, false, 0);
    sound:setVolume(0.3);
    local aPlayer = getPlayer();

    if aPlayer == nil or aPlayer == player then
        return;
    end
    aPlayer:Say(getText("IGUI_PlayerText_ez_death"));
end

-- regive to player jar & more kefir seed
function EZ_recipe_Process_Kefir(items, result, player)
    EZ_recipe_Process_Jar(items, result, player);

    -- recipe coast + 1
    player:getInventory():AddItems("EZ_MP.EZ_KefirSeed", 6);
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

-- --- EVENTS MANAGER ---
Events.EveryHours.Add(EZ_checkSleepTime);
Events.OnPlayerDeath.Add(EZ_ringTheBell);