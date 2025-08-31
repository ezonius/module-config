require("__module-config__/functions.lua")

-- Defining the modules table
-- Defining the modules variable

local modules = {
    speed = {
        name = "speed",
        local_name = "Speed Module ",
        local_description = "Increases machine speed at a cost of increased energy consumption.",
        max_level = settings.startup["max-speed"].value,
        highest_tier = 3,
        effects = {
            consumption = settings.startup["speed-consumption-values"].value,
            speed = settings.startup["speed-speed-values"].value,
            productivity = settings.startup["speed-productivity-values"].value,
            pollution = settings.startup["speed-pollution-values"].value
        },
        graphics = {
            primary_tint = {112/255, 182/255, 255/255},             -- r, g, b, a
            secondary_tint = {99/255, 248/255, 255/255, 1.00}       -- r, g, b, a
        },
        sa_special = "tungsten-carbide",
        sa_special_amount = 1,
        order = "a",
        subgroup = "module"
    },
    efficiency = {
        name = "efficiency",
        local_name = "Efficiency Module ",
        local_description = "Decreases machine energy consumption. Minimum energy consumption is 20%.",
        max_level = settings.startup["max-efficiency"].value,
        highest_tier = 3,
        effects = {
            consumption = settings.startup["efficiency-consumption-values"].value,
            speed = settings.startup["efficiency-speed-values"].value,
            productivity = settings.startup["efficiency-productivity-values"].value,
            pollution = settings.startup["efficiency-pollution-values"].value
        },
        graphics = {
            primary_tint = {0/255, 255/255, 0/255},                 -- r, g, b, a
            secondary_tint = {94/255, 255/255, 94/255, 1.00}        -- r, g, b, a
        },
        sa_special = "spoilage",
        sa_special_amount = 5,
        order = "b",
        subgroup = "module"
    },
    productivity = {
        name = "productivity",
        local_name = "Productivity Module ",
        local_description = "Machine will create extra products at a cost of increased energy consumption and reduced speed. \nUsable only on intermediate products.",
        max_level = settings.startup["max-productivity"].value,
        highest_tier = 3,
        effects = {
            consumption = settings.startup["productivity-consumption-values"].value,
            speed = settings.startup["productivity-speed-values"].value,
            productivity = settings.startup["productivity-productivity-values"].value,
            pollution = settings.startup["productivity-pollution-values"].value
        },
        graphics = {
            primary_tint = {209/255, 98/255, 66/255},               -- r, g, b, a
            secondary_tint = {255/255, 255/255, 78/255, 1.00}       -- r, g, b, a
        },
        sa_special = "biter-egg",
        sa_special_amount = 1,
        order = "c",
        subgroup = "module"
    }
}

-- Optional Quality Compatability


if mods["quality"] then
    for _, module_type in pairs({"speed", "productivity", "efficiency"}) do
        modules[module_type].effects.quality = settings.startup[module_type.."-quality-values"].value
    end
    modules.quality = {
        name = "quality",
        local_name = "Quality Module ",
        local_description = "Allows machines to make higher quality products.",
        max_level = settings.startup["max-quality"].value,
        highest_tier = 3,
        effects = {
            consumption = settings.startup["quality-consumption-values"].value,
            speed = settings.startup["quality-speed-values"].value,
            productivity = settings.startup["quality-productivity-values"].value,
            pollution = settings.startup["quality-pollution-values"].value,
            quality = settings.startup["quality-quality-values"].value
        },
        graphics = {
            primary_tint = {255/255, 255/255, 255/255},              -- r, g, b, a
            secondary_tint = {220/255, 40/255, 40/255, 1.00}         -- r, g, b, a
        },
        sa_special = "superconductor",
        sa_special_amount = 1,
        order = "d",
        subgroup = "module"
    }
end

-- Moving to new items tab
if settings.startup["more-tabs"].value then
    modules.speed.subgroup = "speed-modules"
    modules.efficiency.subgroup = "efficiency-modules"
    modules.productivity.subgroup = "productivity-modules"
    if mods["quality"] then
        modules.quality.subgroup = "quality-modules"
    end
end

-- Generating the effects
modules["speed"]["generated-effect"] = generate_effects(modules, "speed")
modules["efficiency"]["generated-effect"] = generate_effects(modules, "efficiency")
modules["productivity"]["generated-effect"] = generate_effects(modules, "productivity")
if mods["quality"] then
    modules["quality"]["generated-effect"] = generate_effects(modules, "quality")
end

if settings.startup["productivity-anywhere"] then
    modules.productivity.local_description = "Machine will create extra products at a cost of increased energy consumption and reduced speed."
end
return modules