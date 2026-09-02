-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    Tracker:AddLocations("locations/ecclesia.jsonc")
    Tracker:AddLocations("locations/monastery.jsonc")
    Tracker:AddLocations("locations/wygol_village.jsonc")
    Tracker:AddLocations("locations/ruvas_forest.jsonc")
    Tracker:AddLocations("locations/kalidus_channel.jsonc")
    Tracker:AddLocations("locations/minera_prison_island.jsonc")
    Tracker:AddLocations("locations/lighthouse.jsonc")
    Tracker:AddLocations("locations/tymeo_mountains.jsonc")
    Tracker:AddLocations("locations/misty_forest_road.jsonc")
    Tracker:AddLocations("locations/skeleton_cave.jsonc")
    Tracker:AddLocations("locations/somnus_reef.jsonc")
    Tracker:AddLocations("locations/giants_dwelling.jsonc")
    Tracker:AddLocations("locations/tristis_pass.jsonc")
    Tracker:AddLocations("locations/oblivion_ridge.jsonc")
    Tracker:AddLocations("locations/argila_swamp.jsonc")
    Tracker:AddLocations("locations/mystery_manor.jsonc")
    Tracker:AddLocations("locations/castle_entrance.jsonc")
    Tracker:AddLocations("locations/library.jsonc")
    Tracker:AddLocations("locations/underground_labyrinth.jsonc")
    Tracker:AddLocations("locations/barracks.jsonc")
    Tracker:AddLocations("locations/mechanical_tower.jsonc")
    Tracker:AddLocations("locations/arms_depot.jsonc")
    Tracker:AddLocations("locations/forsaken_cloister.jsonc")
    Tracker:AddLocations("locations/final_approach.jsonc")
    Tracker:AddLocations("locations/draculas_castle.jsonc")
    Tracker:AddLocations("locations/training_hall.jsonc")
    Tracker:AddLocations("locations/large_cavern.jsonc")
    Tracker:AddLocations("locations/glyphsanity.jsonc")
    Tracker:AddLocations("locations/_overview.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
