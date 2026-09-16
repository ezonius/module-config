require("prototypes.recipes-updates")
local modules  = require("__module-config__/variables.lua")


function split(source, delimiters)
    local elements = {}
    local pattern = '([^' .. delimiters .. ']+)'
    local is_valid = true -- Flag to track if all values are valid numbers

    string.gsub(source, pattern, function(value)
        local num = tonumber(value)
        if num then
            elements[#elements + 1] = num -- Add valid number to the list
        else
            is_valid = nil -- Set flag to nil if conversion fails
        end
    end)

    if is_valid then
        return elements
    else
        return nil
    end
end


local allowed_effects = {}

if settings.startup["speed-in-beacon"].value then
    table.insert(allowed_effects, "speed")
end

if settings.startup["efficiency-in-beacon"].value then
    table.insert(allowed_effects, "consumption")
end

if settings.startup["productivity-in-beacon"].value then
    table.insert(allowed_effects, "productivity")
end

if settings.startup["pollution-in-beacon"].value then
    table.insert(allowed_effects, "pollution")
end

if mods["quality"] then
    data.raw["beacon"]["beacon"].distribution_effectivity_bonus_per_quality_level = settings.startup["vanilla-beacon-distribution-effectivity-bonus-per-quality-level"].value
    
    if settings.startup["quality-in-beacon"].value then
        table.insert(allowed_effects, "quality")
    end
end


data.raw["beacon"]["beacon"].allowed_effects = allowed_effects
data.raw["beacon"]["beacon"].distribution_effectivity = settings.startup["vanilla-beacon-distribution-effectivity"].value
data.raw["beacon"]["beacon"].supply_area_distance = settings.startup["vanilla-beacon-supply_area_distance"].value
data.raw["beacon"]["beacon"].module_slots = settings.startup["vanilla-beacon-module-slots"].value
data.raw["beacon"]["beacon"].icons_positioning[1].max_icons_per_row = math.ceil(math.sqrt(settings.startup["vanilla-beacon-module-slots"].value))




-- Effect Limits
-- Per-effect upper/lower bounds on the summed module+beacon effects, applied engine-side.
-- Values are percent in the settings (300 = 3.0 multiplier); quality uses the engine's x10 stored domain.
local effect_limits = {
    productivity = {low = settings.startup["productivity-limits-low"].value / 100, high = settings.startup["productivity-limits-high"].value / 100},
    speed = {low = settings.startup["speed-limits-low"].value / 100, high = settings.startup["speed-limits-high"].value / 100},
    consumption = {low = settings.startup["consumption-limits-low"].value / 100, high = settings.startup["consumption-limits-high"].value / 100},
    pollution = {low = settings.startup["pollution-limits-low"].value / 100, high = settings.startup["pollution-limits-high"].value / 100}
}
if mods["quality"] then
    effect_limits.quality = {low = settings.startup["quality-limits-low"].value / 10, high = settings.startup["quality-limits-high"].value / 10}
end

for _, type_prototypes in pairs(data.raw) do
    for _, proto in pairs(type_prototypes) do
        if proto.effect_receiver then
            for effect, limits in pairs(effect_limits) do
                proto.effect_receiver[effect .. "_limits"] = limits
            end
        end
    end
end




-- Beacon Profiles
local beacon_profile = {}
if settings.startup["vanilla-beacon-profile"].value == "default" then
    for i = 1, 100 do
        beacon_profile[i] = 1/(math.sqrt(i))
    end
    data.raw["beacon"]["beacon"].profile = beacon_profile
elseif settings.startup["vanilla-beacon-profile"].value == "overload-non-exclusive" then
    for i = 1, 100 do
        beacon_profile[i] = 1/i
    end
    data.raw["beacon"]["beacon"].profile = beacon_profile
elseif settings.startup["vanilla-beacon-profile"].value == "overload" then
    data.raw["beacon"]["beacon"].profile = {1,0}
elseif settings.startup["vanilla-beacon-profile"].value == "custom" then
    data.raw["beacon"]["beacon"].profile = split(settings.startup["vanilla-beacon-custom-profile"].value,",") or {0}
end

