require("__module-config__/functions.lua")
local modules  = require("__module-config__/variables.lua")
local module_types = {"speed", "efficiency", "productivity"}
local effect_types = {"consumption", "speed", "productivity", "pollution"}

if mods["quality"] then
    table.insert(module_types,"quality")
    table.insert(effect_types,"quality")
end
-- Tweaking the orders of vanilla modules
for i = 1, 3 do
    if i == 1 then 
        data.raw["module"]["speed-module"]["order"] = "a[speed]-a[speed-module-00"..i.."]"
        data.raw["module"]["efficiency-module"]["order"] = "b[efficiency]-a[efficiency-module-00"..i.."]"
        data.raw["module"]["productivity-module"]["order"] = "c[productivity]-a[productivity-module-00"..i.."]"
        if mods["quality"] then
            data.raw["module"]["quality-module"]["order"] = "d[quality]-a[quality-module-00"..i.."]"
        end
    else
        data.raw["module"]["speed-module-"..i]["order"] = "a[speed]-a[speed-module-00"..i.."]"
        data.raw["module"]["efficiency-module-"..i]["order"] = "b[efficiency]-a[efficiency-module-00"..i.."]"
        data.raw["module"]["productivity-module-"..i]["order"] = "c[productivity]-a[productivity-module-00"..i.."]"
        if mods["quality"] then
            data.raw["module"]["quality-module-"..i]["order"] = "d[quality]-a[quality-module-00"..i.."]"
        end
    end
end

-- Generating all modules. Making all vanilla modules have all effects possible. Additionally making prod and qual have beacon tints
for _, module_type in pairs(module_types) do
    for _, effect_type in pairs(effect_types) do
        data.raw["module"][module_type.."-module"]["effect"][effect_type] = {}
        data.raw["module"][module_type.."-module"]["effect"][effect_type] = modules[module_type]["generated-effect"][effect_type][1]
        data.raw["module"][module_type.."-module-2"]["effect"][effect_type] = {}
        data.raw["module"][module_type.."-module-2"]["effect"][effect_type] = modules[module_type]["generated-effect"][effect_type][2]
        data.raw["module"][module_type.."-module-3"]["effect"][effect_type] = {}
        data.raw["module"][module_type.."-module-3"]["effect"][effect_type] = modules[module_type]["generated-effect"][effect_type][3]
    end

    if modules[module_type].max_level > 3 then
        for level = 4, modules[module_type].max_level, 1 do
            generate_module(modules, module_type, level, settings.startup["alt-mode-modules-in-beacons"].value)
        end
    end

    local alt_mode = settings.startup["alt-mode-modules-in-beacons"].value
    data.raw["module"][module_type.."-module"].requires_beacon_alt_mode = alt_mode
    data.raw["module"][module_type.."-module-2"].requires_beacon_alt_mode = alt_mode
    data.raw["module"][module_type.."-module-3"].requires_beacon_alt_mode = alt_mode


    if settings.startup["productivity-in-beacon"].value and module_type == "productivity" then
        data.raw["module"][module_type.."-module"].art_style = "vanilla"
        data.raw["module"][module_type.."-module-2"].art_style = "vanilla"
        data.raw["module"][module_type.."-module-3"].art_style = "vanilla"
        data.raw["module"][module_type.."-module"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module-2"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module-3"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
        data.raw["module"][module_type.."-module-2"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
        data.raw["module"][module_type.."-module-3"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
    end
    if mods["quality"] and settings.startup["quality-in-beacon"].value and module_type == "quality" then
        data.raw["module"][module_type.."-module"].art_style = "vanilla"
        data.raw["module"][module_type.."-module-2"].art_style = "vanilla"
        data.raw["module"][module_type.."-module-3"].art_style = "vanilla"
        data.raw["module"][module_type.."-module"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module-2"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module-3"].requires_beacon_alt_mode = false
        data.raw["module"][module_type.."-module"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
        data.raw["module"][module_type.."-module-2"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
        data.raw["module"][module_type.."-module-3"].beacon_tint = {primary = modules[module_type].graphics.primary_tint, secondary = modules[module_type].graphics.secondary_tint}
    end
end



--Making all vanilla modules have "icons" in their table, and not "icon" ONLY IF A SETTING IS ENABLED---------------------- Fix tiers 1-3 not getting tinted
if settings.startup["icons-on-modules"].value == "all" then
    for _, module_type in pairs(module_types) do
        data.raw["module"][module_type.."-module"]["icon"] = nil
        data.raw["module"][module_type.."-module-2"]["icon"] = nil
        data.raw["module"][module_type.."-module-3"]["icon"] = nil
        for i = 1, 3 do
            if i == 1 then
                data.raw["module"][module_type.."-module"]["icons"] = {
                    {
                        icon = "__module-config__/graphics/"..module_type.."-module.png",
                        icon_size = 64
                    }
                }
            else
                data.raw["module"][module_type.."-module-"..i]["icons"] = {
                    {
                        icon = "__module-config__/graphics/"..module_type.."-module-"..i..".png",
                        icon_size = 64
                    }
                }
            end
        end
    end
end



-- Applying graphics to all generated modules
if settings.startup["icons-on-modules"].value == "all" or settings.startup["icons-on-modules"].value == "new" then
    local range_min = 4
    if settings.startup["icons-on-modules"].value == "all" then
        range_min = 1
    end

    for _, module in pairs(modules) do
        add_numbers_to_icons(module, "module", range_min, module.max_level)
    end
end

if mods["space-age"] then
    for _, module_type in pairs(module_types) do
        for i = 3, modules[module_type].max_level do
            data.raw["module"][module_type.."-module-"..i]["weight"] = 20*kg
        end
    end
end