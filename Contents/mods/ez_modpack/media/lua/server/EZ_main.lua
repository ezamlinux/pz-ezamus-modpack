local text = require "EZ_text";

-- Display a message to tell people to try to sleep
function EZ_checkSleepTime()
    if getGameTime():getHour() % 24 == 22 then
        local player = getPlayer();
        if player == nil then
            return
        end
        player:Say(text.sleep_message);
    end
end

-- Play Ring Bell on player death to notify other player
-- function EZ_ringTheBell(player)
--     local churchBellSound = "church_bell";
-- -- Actualy the song is only played to the dead player ...
--     local sound = getSoundManager():PlaySound(churchBellSound, false, 0.5);
-- end

-- regive to player jar & more kefir seed
function EZ_recipe_Process_Kefir(items, result, player)
    player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");
    -- recipe coast + 1
    player:getInventory():AddItems("EZ_KEFIR.EZ_KefirSeed", 6);
end

-- regive to player jar when empty
function Recipe.GetItemTypes.FullJar(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("FullJar"))
end

function EZ_recipe_Empty_Jar(items, result, player)
    player:getInventory():AddItem("Base.JarLid");
end


function EZ_recipe_Process_Cider(items, result, player)
    player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");
end

-- --- EVENTS MANAGER ---
Events.EveryHours.Add(EZ_checkSleepTime);
-- Events.OnPlayerDeath.Add(EZ_ringTheBell);