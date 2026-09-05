-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_then_n_consumable(n)
    local count = Tracker:ProviderCountForCode('consumable')
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

-- Movement Macros
function for_fun_mode()
    return has("magnet") and has("fun")
end
function funfly()
    for_fun_mode() -- and has("fun_mode_enabled")
end
function funslide()
    for_fun_mode() -- and has("fun_mode_enabled")
end

function biguppies()
    return for_fun_mode() or has("wings")
end
function mediumuppies()
    return biguppies() or has("djump")
end
function widies()
    return mediumuppies() or has("fast")
end
function bigslidies()
    return funslide() or has("slide")
end
function mediumslidies()
    return bigslidies() or has("cat")
end

function blocks()
    if has("fun") or has("barlowe") or has("axe3") or has("dark1") or has("beam") then
        return AccessibilityLevel.Normal
    end
    if has("special") then
        if has("light1") or has("light2") then
            if has("dark1") or has("dark2") then
                return AccessibilityLevel.Normal
            end
        end
        if has("sword1") or has("sword2") or has("sword3") then
            -- TODO logic
            return false
        end
    end
end
function blocks2()
    return has("fun") or has("axe3") or has("beam") or has("light1") or has("barlowe") or has("albus") or has("dark1")
end

function generator()
    if has("wings") or has("magnet") or has("fast") or has("bot") then
        return true -- logic
    end
end