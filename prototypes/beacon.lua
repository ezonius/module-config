if not settings.startup["icons-on-beacons"].value then
    return
end

for _, beacon in pairs(data.raw.beacon) do
    if beacon.graphics_set and beacon.graphics_set.module_visualisations and beacon.graphics_set.module_visualisations[1].slots then
        for slot_number, slot in pairs(beacon.graphics_set.module_visualisations[1].slots) do
            local icon_layer = table.deepcopy(slot[#slot])
            local filename = ""
            if settings.startup["icons-on-modules"].value == "all" then
                filename = "__module-config__/graphics/icon-spritesheet-all.png"
            elseif settings.startup["icons-on-modules"].value == "new" then
                filename = "__module-config__/graphics/icon-spritesheet-new.png"
            else
                return
            end
            
            icon_layer.pictures = {
                filename = filename,
                line_length = 10,
                width = 64,
                height = 64,
                variation_count = 255,
                shift = util.by_pixel(22, -16),
                --draw_as_light = true,
                scale = 0.35
            }
            if slot_number == 1 then
                icon_layer.pictures.shift = util.by_pixel(-20, 10)  -- -20, 14
            elseif slot_number == 2 then
                icon_layer.pictures.shift = util.by_pixel(21, -17)   -- 21, -12
            end
            icon_layer.render_layer = "object"
            icon_layer.apply_module_tint = "secondary"
            table.insert(slot, icon_layer)
        end
    end
end
