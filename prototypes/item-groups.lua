require("__module-config__/functions.lua")
local modules = require("__module-config__/variables.lua")

if settings.startup["more-tabs"].value then
    data:extend({
        {
            type = "item-group",
            name = "modules",
            order = "ba",
            icon = "__base__/graphics/technology/module.png",
            icon_size = 256,
            icon_mipmaps = 4
        },
        {
            type = "item-subgroup",
            name = "beacons",
            group = "modules",
            order = "a"
        },
        {
            type = "item-subgroup",
            name = "speed-modules",
            group = "modules",
            order = "b"
        },
        {
            type = "item-subgroup",
            name = "efficiency-modules",
            group = "modules",
            order = "c"
        },
        {
            type = "item-subgroup",
            name = "productivity-modules",
            group = "modules",
            order = "d"
        },
        {
            type = "item-subgroup",
            name = "quality-modules",
            group = "modules",
            order = "e"
        }
    })

    data.raw["item"]["beacon"].subgroup = "beacons"

    if mods["quality"] then
        data.raw["item-group"]["modules"]["icon"] = "__quality__/graphics/technology/module.png"
    end

    for _, module in pairs(modules) do
        data.raw["module"][module.name.."-module"]["subgroup"] = module.name.."-modules"
        data.raw["module"][module.name.."-module-2"]["subgroup"] = module.name.."-modules"
        data.raw["module"][module.name.."-module-3"]["subgroup"] = module.name.."-modules"
    end
end

