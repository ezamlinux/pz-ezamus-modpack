require 'Items/ProceduralDistributions'


----------- KEFIR -----------

local kefir_seed_rand = 8

local kefir_jar_rand = 2

local kefir_bottle_rand = 5

-- kefir Grain
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, kefir_seed_rand/2);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, kefir_seed_rand);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, kefir_seed_rand);

table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, kefir_seed_rand);

table.insert(ProceduralDistributions.list["BreakRoomShelves"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["BreakRoomShelves"].items, kefir_seed_rand);

table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, "EZ_LR.EZ_KefirSeed");
table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, kefir_seed_rand);

-- kefir Jar
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, kefir_jar_rand/2);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, kefir_jar_rand);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, kefir_jar_rand);

table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, kefir_jar_rand);

table.insert(ProceduralDistributions.list["BreakRoomShelves"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["BreakRoomShelves"].items, kefir_jar_rand);

table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, "EZ_LR.EZ_KefirJar");
table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, kefir_jar_rand);

-- Fridge Kefir Bottle
table.insert(ProceduralDistributions.list["DeepFryKitchenFridge"].items, "EZ_LR.EZ_FilteredKefirBottle");
table.insert(ProceduralDistributions.list["DeepFryKitchenFridge"].items, kefir_bottle_rand);

table.insert(ProceduralDistributions.list["DinerKitchenFridge"].items, "EZ_LR.EZ_FilteredKefirBottle");
table.insert(ProceduralDistributions.list["DinerKitchenFridge"].items, kefir_bottle_rand);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "EZ_LR.EZ_FilteredKefirBottle");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, kefir_bottle_rand);

table.insert(ProceduralDistributions.list["FridgeGeneric"].items, "EZ_LR.EZ_FilteredKefirBottle");
table.insert(ProceduralDistributions.list["FridgeGeneric"].items, kefir_bottle_rand);

table.insert(ProceduralDistributions.list["FridgeRich"].items, "EZ_LR.EZ_FilteredKefirBottle");
table.insert(ProceduralDistributions.list["FridgeRich"].items, kefir_bottle_rand);

----------- END KEFIR -----------