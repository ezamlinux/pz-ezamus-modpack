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
	player:getInventory():AddItem("Base.RippedSheetsDirty");
end

function EZ_recipe_Empty_Jar(items, result, player)
	player:getInventory():AddItem("Base.EmptyJar");
end

function Recipe.OnGiveXP.Tailoring3(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 3);
end

function Recipe.OnGiveXP.Tailoring10(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Tailoring, 10);
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