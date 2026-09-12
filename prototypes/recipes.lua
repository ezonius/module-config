require("__module-config__/functions.lua")
local modules = require("__module-config__/variables.lua")


for module, _ in pairs(modules) do
    data:extend({ -- lvl 1
    { 
        type = "recipe",
        name = module.."-module",
        categories = {"crafting"},
        allow_decomposition = true,
        icons = {
            {
                icon = "__module-config__/graphics/"..module.."-module.png",
                icon_size = 64
            }
        },
        energy_required = 15,
        enabled = false,
        ingredients = {
            {type = "item", name = "advanced-circuit", amount = 5},
            {type = "item", name = "electronic-circuit", amount = 5}
        },
        results = {{type = "item", name = module.."-module", amount = 1}
        }
    },
    { 
        type = "recipe",
        name = module.."-module-2",
        categories = {"crafting"},
        allow_decomposition = true,
        icons = {
            {
                icon = "__module-config__/graphics/"..module.."-module-2.png",
                icon_size = 64
            }
        },
        energy_required = 30,
        enabled = false,
        ingredients = {
            {type = "item", name = "advanced-circuit", amount = 5},
            {type = "item", name = "processing-unit", amount = 5},
            {type = "item", name = module.."-module", amount = 4}
        },
        results = {{type = "item", name = module.."-module-2", amount = 1}
        }
    },
    })


    if modules[module].max_level > 3 then
        if mods["space-age"] then
            data:extend({
                { 
                    type = "recipe",
                    name = module.."-module-3",
                    -- "crafting" like vanilla tiers 1-2; space-age data-updates adds "electromagnetics" for this name automatically
                    categories = {"crafting"},
                    allow_decomposition = true,
                    icons = {
                        {
                            icon = "__module-config__/graphics/"..module.."-module-3.png",
                            icon_size = 64
                        }
                    },
                    enabled = false,
                    ingredients = {
                        {type = "item", name = module.."-module-2", amount = 4},
                        {type = "item", name = "advanced-circuit", amount = 5},
                        {type = "item", name = "processing-unit", amount = 5},
                        {type = "item", name = modules[module].sa_special, amount = modules[module].sa_special_amount}
                    },
                    energy_required = settings.startup["crafting-time"].value,
                    results = {{type="item", name=module.."-module-3", amount=1}}
                }
            })
            for level = 4, modules[module].max_level do -- Vanilla like recipe
                data:extend({
                    { 
                        type = "recipe",
                        name = module.."-module-"..level,
                        -- tier 4+ is custom to this mod, so keep hand/assembler + EM plant explicitly
                        categories = {"crafting", "electromagnetics"},
                        allow_decomposition = true,
                        icons = {
                            {
                                icon = "__module-config__/graphics/"..module.."-module-3.png",
                                icon_size = 64
                            }
                        },
                        energy_required = settings.startup["crafting-time"].value,
                        enabled = false,
                        ingredients = {
                            {type = "item", name = module.."-module-"..level-1, amount = settings.startup['modules-per-recipe'].value},
                            {type = "item", name = "advanced-circuit", amount = 5},
                            {type = "item", name = "processing-unit", amount = 5},
                            {type = "item", name = modules[module].sa_special, amount = modules[module].sa_special_amount}
                        },
                        results = {{type = "item", name = module.."-module-"..level, amount = settings.startup['modules-per-result'].value}}
                    }
                })
            end
        else
            data:extend({
                { 
                    type = "recipe",
                    name = module.."-module-3",
                    categories = {"crafting"},
                    allow_decomposition = true,
                    icons = {
                        {
                            icon = "__module-config__/graphics/"..module.."-module-3.png",
                            icon_size = 64
                        }
                    },
                    enabled = false,
                    ingredients = {
                        {type = "item", name = module.."-module-2", amount = 4},
                        {type = "item", name = "advanced-circuit", amount = 5},
                        {type = "item", name = "processing-unit", amount = 5}
                    },
                    energy_required = settings.startup["crafting-time"].value,
                    results = {{type="item", name=module.."-module-3", amount=1}}
                }
            })
            for level = 4, modules[module].max_level do -- Top module is different (like space age)
                data:extend({
                    { 
                        type = "recipe",
                        name = module.."-module-"..level,
                        categories = {"crafting"},
                        allow_decomposition = true,
                        icons = {
                            {
                                icon = "__module-config__/graphics/"..module.."-module-3.png",
                                icon_size = 64
                            }
                        },
                        energy_required = settings.startup["crafting-time"].value,
                        enabled = false,
                        ingredients = {
                            {type = "item", name = "advanced-circuit", amount = 5},
                            {type = "item", name = "processing-unit", amount = 5},
                            {type = "item", name = module.."-module-"..level-1, amount = settings.startup['modules-per-recipe'].value}
                        },
                        results = {{type = "item", name = module.."-module-"..level, amount = settings.startup['modules-per-result'].value}}
                    }
                })
            end
        end

        if mods["quality"] then
            for level = 4, modules[module].max_level do
                -- add auto_recycle = true to all recipes
                data.raw["recipe"][modules[module].name.."-module-"..level].auto_recyle = true
            end
        end
    end
end

-- Applying graphics to all generated recipes
if settings.startup["icons-on-modules"].value == "all" or settings.startup["icons-on-modules"].value == "new" then
    local range_min = 4
    if settings.startup["icons-on-modules"].value == "all" then
        range_min = 1
    end
    
    for _, module in pairs(modules) do
        add_numbers_to_icons(module, "recipe", range_min, module.max_level)
    end
end


-- Do NOT set categories to {"electromagnetics"} here: that would remove hand/assembler (crafting) crafting.
-- Space Age's data-updates stage already appends "electromagnetics" to vanilla module recipes
-- (and this mod's generated ones share those names) via add_recipe_category, which runs after this file.