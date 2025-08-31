require("__module-config__/functions.lua")
local modules = require("__module-config__/variables.lua")


for module, _ in pairs(modules) do
    local cost = tech_cost_pattern(settings.startup["tech-cost"].value, modules[module].max_level)
    for level = 4, modules[module].max_level do
        data:extend({
            {
                type = "technology",
                name = module.."-module-"..level,
                icon_size = 64,
                icons = {
                    {
                        icon = "__module-config__/graphics/"..module.."-module-3.png",
                        icon_size = 64
                    },
                    {
                        icon = "__module-config__/graphics/xxframe.png",
                        icon_size = 64
                    },
                    {
                        icon = "__module-config__/graphics/empty.png",
                        icon_size = 64,
                        tint = {r = 1, g = 1, b = 1, a = 1}
                    },
                    {
                        icon = "__module-config__/graphics/empty.png",
                        icon_size = 64,
                        tint = {r = 1, g = 1, b = 1, a = 1}
                    },
                    {
                        icon = "__module-config__/graphics/empty.png",
                        icon_size = 64,
                        tint = {r = 1, g = 1, b = 1, a = 1}
                    }
                },
                effects = {
                    {
                    type = "unlock-recipe",
                    recipe = module.."-module-"..level
                    }
                },
                prerequisites = {module.."-module-"..level-1},
                unit ={
                    count = cost[level],
                    ingredients =
                    {
                        {"automation-science-pack", 1},
                        {"logistic-science-pack", 1},
                        {"chemical-science-pack", 1},
                        {"production-science-pack", 1}
                    },
                    time = settings.startup["tech-time"].value
                },
                upgrade = true,
                order = "a[if you're reading this, hi.]"
            }
        })
    end
end

for _, module in pairs(modules) do
    add_numbers_to_icons(module, "technology", 4, module.max_level)
end