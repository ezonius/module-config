-- Some helping functions
function ceil(value, place)
    place = place or 0
    local factor = 10^place
	return (math.ceil(value / factor) * factor)
end

function floor(value, place)
    place = place or 0
    local factor = 10^place
	return (math.floor(value / factor) * factor)
end

function round(number, place)
    place = place or 0
    local factor = 10^place
    if number >= 0 then
        return math.floor(number / factor + 0.5) * factor
    else
        return math.ceil(number / factor - 0.5) * factor
    end
end

function bonus_cap(bonus) -- prevents int overflow
    local sign = round(math.abs(bonus)/bonus)
    if math.abs(bonus) > 327.66 then
        return 327.66 * sign
    else
        return bonus
    end
end

function find_index(table, input_string)
    for index, value in pairs(table) do
        if value == input_string then
            return index
        end
    end
    return nil  -- Return nil if the string is not found
end

function stringToNumberTable(inputString)
    local result = {}
    
    -- Loop through the input string to find sequences of numbers with optional decimal points and dashes for negatives
    for num in string.gmatch(inputString, "%-?[%d%.]+") do
        local validNumber = tonumber(num) -- Convert the number to a numeric value
        if validNumber then
            table.insert(result, validNumber)
        end
    end

    return result
end

function add_numbers_to_icons(module, prototype, range_min, range_max)  -- Graphics
    local secondary_tint = module.graphics.secondary_tint
    for level = range_min, range_max do
        local hundreds = floor(level,2)/100
        local tens = floor((level - hundreds*100),1)/10
        local ones = level - hundreds*100 - tens*10

        local module_prototype = {}
        if level == 1 then
            module_prototype = data.raw[prototype][module.name.."-module"]
        else
            module_prototype = data.raw[prototype][module.name.."-module-"..level]
        end
        table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/xxframe.png", icon_size = 64})
        if hundreds > 0 then
            module_prototype["icons"][2] = {icon = "__module-config__/graphics/frame.png", icon_size = 64}
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Hundreds/"..hundreds..".png",   icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Tens/"..tens..".png",           icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Ones/"..ones..".png",           icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
        elseif tens > 0 then
            module_prototype["icons"][2] = {icon = "__module-config__/graphics/xframex.png", icon_size = 64}
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Tens/"..tens..".png",           icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Ones/"..ones..".png",           icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
        else
            table.insert(module_prototype["icons"], {icon = "__module-config__/graphics/Ones/"..ones..".png",           icon_size = 64, tint = {secondary_tint[1], secondary_tint[2], secondary_tint[3]}})
        end
    end
end


function tech_cost_pattern(expression, max_level)
    local cost = {}
    
    -- Precompile the formula, replacing "L" with the variable `level`
    local formula = "return function(L) return " .. expression .. " end"
    local compiled_formula, err = load(formula)
    
    if not compiled_formula then
        -- If there's an error in compiling the formula, fill the cost table with 1s
        for level = 1, max_level do
            cost[level] = 1
        end
        return cost
    end

    compiled_formula = compiled_formula()
    
    -- Evaluate the formula for each level, using pcall to catch runtime errors
    for level = 1, max_level do
        local success, result = pcall(compiled_formula, level)
        if success then
            if result == 0 then
                result = 1
            end
            cost[level] = ceil(math.abs(result))
        else
            -- If there's an error in evaluating the formula, set the cost to 1
            cost[level] = 1
        end
    end
    
    return cost
end

-- Helper function to get the bonus
function get_bonus(scaling_type, initial_values, max_level)
    -- Defining what bonuses modules should have
    -- Define the pattern functions
    local pattern_functions = {
        ["disabled_pattern"] = disabled_pattern,
        ["linear_pattern"] = linear_pattern,
        ["constant_pattern"] = constant_pattern,
        ["fibonacci_pattern"] = fibonacci_pattern,
        ["exponential_pattern"] = exponential_pattern,
        ["polynomial_pattern"] = polynomial_pattern,
    }

    return pattern_functions[scaling_type](max_level, initial_values)
end

function generate_effects(modules, module_type)
    local effect_types = {"consumption", "speed", "productivity", "pollution"}
    if mods["quality"] then
        table.insert(effect_types, "quality")
    end
    local effect = {}

    for _, effect_type in pairs(effect_types) do
        local scaling_type = settings.startup[module_type.."-"..effect_type.."-extrapolation"].value
        local initial_values = settings.startup[module_type.."-"..effect_type.."-values"].value

        -- Need to convert initial_values as a string into a table of floats.
        initial_values = stringToNumberTable(initial_values)
        if effect_type == "quality" then
            for key, value in pairs(initial_values) do
                initial_values[key] = 10 * value  -- Internally the game divides all quality effects by 10
            end
        end
        local max_level = modules[module_type].max_level
        effect[effect_type] = get_bonus(scaling_type, initial_values, max_level)
        
    end

    return effect
end

function generate_module(modules, module_type, level, require_alt_mode)
    data:extend({
        {
            type = "module",
            name = module_type.."-module-"..level,
            localised_name = modules[module_type].local_name..level,
            localised_description = modules[module_type].local_description,
            icons = {
                {
                    icon = "__module-config__/graphics/"..module_type.."-module-3.png",
                    icon_size = 64
                }
            },
            subgroup = modules[module_type].subgroup,
            category = module_type,
            tier = level,
            order = modules[module_type].order.."["..module_type.."]-a["..module_type.."-module-"..level.."]",
            stack_size = 50,
            effect = {
                consumption = modules[module_type]["generated-effect"]["consumption"][level],
                speed = modules[module_type]["generated-effect"]["speed"][level],
                productivity = modules[module_type]["generated-effect"]["productivity"][level],
                pollution = modules[module_type]["generated-effect"]["pollution"][level]
            },
            art_style = "vanilla",
            requires_beacon_alt_mode = require_alt_mode,
            beacon_tint = {
                primary = modules[module_type].graphics.primary_tint,
                secondary = modules[module_type].graphics.secondary_tint,
            }
        }
    })
    if mods["quality"] then
        data.raw["module"][module_type.."-module-"..level]["effect"].quality = modules[module_type]["generated-effect"]["quality"][level]
    end
    if level < 100 then -- updating order
        if level < 10 then
            data.raw["module"][module_type.."-module-"..level]["order"] = modules[module_type].order.."["..module_type.."]-a["..module_type.."-module-00"..level.."]"
        else
            data.raw["module"][module_type.."-module-"..level]["order"] = modules[module_type].order.."["..module_type.."]-a["..module_type.."-module-0"..level.."]"
        end
    end
end










--------------------- Some functions which determine how effects scale ---------------------

-- Bonuses scale by a constant value
function constant_pattern(length, effects)
    if #effects == 0 then
        disabled_pattern(length, effects)
    end
    local scale = effects[#effects] - effects[#effects-1]

    -- Generate the effects knowing the scale factor
    for i = #effects + 1, length do
        effects[i] = effects[i-1] + scale
        effects[i] = bonus_cap(round(effects[i], -4))
    end
    return effects
end

-- Bonuses scale via linear pattern
function linear_pattern(length, effects)
    if #effects == 0 then
        disabled_pattern(length, effects)
    end
    local scale = 0
    
    -- Finding the scaling pattern (i*scale = bonus)
    scale = (effects[#effects] - effects[#effects - 1])/(#effects-1)

    -- Generate the effects knowing the scale factor
    for i = #effects + 1, length do
        effects[i] = effects[i-1] + (i - 1) * scale
        effects[i] = bonus_cap(round(effects[i], -4))
    end
    return effects
end



-- Bonuses scale via fibonacci pattern
function fibonacci_pattern(length, effects)
    if #effects == 0 then
        disabled_pattern(length, effects)
    end

    -- Generate the Fibonacci sequence past the starting levels
    for i = #effects + 1, length do
        effects[i] = effects[i - 1] + effects[i - 2]
        effects[i] = bonus_cap(round(effects[i], -4))
    end

    return effects
end


function exponential_pattern(length, effects)
    if #effects == 0 then
        disabled_pattern(length, effects)
    end
    local scale = 2

    -- Generate the effects knowing the scale factor
    for i = 2, length do
        effects[i] = effects[1] * scale^(i-1)
        effects[i] = bonus_cap(round(effects[i], -4))
    end
    return effects
end


function polynomial_pattern(length, effects)
    if #effects == 0 then
        disabled_pattern(length, effects)
    end
    local scale = 2

    -- Generate the effects knowing the scale factor
    for i = 2, length do
        effects[i] = effects[1] * i^scale
        effects[i] = bonus_cap(round(effects[i], -4))
    end
    return effects
end

function disabled_pattern(length, effects)
    local effects = {}
    for i = 1, length do
        effects[i] = 0
    end
    return effects
end