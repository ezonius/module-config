for name, recipe_details in pairs(data.raw["recipe"]) do
    if settings.startup["speed-in-all-recipes"].value == "everywhere" then
        recipe_details.allow_speed = true
    elseif settings.startup["speed-in-all-recipes"].value == "nowhere" then
        recipe_details.allow_speed = false
    end
    if settings.startup["productivity-in-all-recipes"].value == "everywhere" then
        recipe_details.allow_productivity = true
    elseif settings.startup["productivity-in-all-recipes"].value == "nowhere" then
        recipe_details.allow_productivity = false
    end
    if settings.startup["efficiency-in-all-recipes"].value == "everywhere" then
        recipe_details.allow_consumption = true
    elseif settings.startup["efficiency-in-all-recipes"].value == "nowhere" then
        recipe_details.allow_consumption = false
    end
    if settings.startup["pollution-in-all-recipes"].value == "everywhere" then
        recipe_details.allow_pollution = true
    elseif settings.startup["pollution-in-all-recipes"].value == "nowhere" then
        recipe_details.allow_pollution = false
    end
    if mods["quality"] and settings.startup["quality-in-all-recipes"].value == "everywhere" then
        recipe_details.allow_quality = true
    elseif mods["quality"] and settings.startup["quality-in-all-recipes"].value == "nowhere" then
        recipe_details.allow_quality = false
    end

    --if settings.startup["productivity-cap"].value ~= 300 and recipe_details.allow_productivity then
    --    recipe_details.maximum_productivity = settings.startup["productivity-cap"].value / 100
    --    if settings.startup["productivity-cap-recycle"].value == "no-recycle" then
    --        recipe_details.auto_recycle = false
    --    elseif string.find(recipe_details.name,"-recycling") and (settings.startup["productivity-cap-recycle"].value == "less-recycled") then
    --        -- reduce probability
    --        local recycling_recipe = data.raw['recipe'][recipe_details.name .. '-recycling']
    --
	--	
    --        if (not recycling_recipe) or (not recipe['ingredients']) or (not recycling_recipe['results']) then 
    --            goto noRecipeFound
    --        end
    --        
    --        
    --        local is_self_recycling_recipe = true
    --        if	(#recycling_recipe['results'] > 1) or (recycling_recipe['results'][1]['name'] ~= recycling_recipe['ingredients'][1]['name']) then
    --            is_self_recycling_recipe = false
    --        end
    --
    --        local recycling_metallurgy = {["big-mining-drill"]=true, ["turbo-transport-belt"]=true, ["turbo-underground-belt"]=true, ["turbo-splitter"]=true}
    --    -- block of code lifted from original recycling code to re-add exceptions
    --        if 
    --            (recipe_details.category == "recycling") or
    --            (recipe_details.auto_recycle == false) or
    --            (recipe_details.subgroup == "empty-barrel") or
    --            (recipe_details.category == "smelting") or
    --            (recipe_details.category == "chemistry") or
    --            (recipe_details.category == "chemistry-or-cryogenics" and recipe_details.name ~= "battery") or
    --            (recipe_details.category == "crushing") or
    --            (recipe_details.category == "metallurgy" and recycling_metallurgy[recipe_details.name] == nil) or
    --            (recipe_details.category == "organic") or
    --            (recipe_details.category == "cryogenics" and recipe_details.name ~= "railgun-turret" and recipe_details.name ~= "railgun" and recipe_details.name ~= "cryogenic-plant" and recipe_details.name ~= "fusion-reactor" and recipe_details.name ~= "fusion-generator") or
    --            (string.find(recipe_details.name, "science") and string.find(recipe_details.name, "pack")) or
    --            (recipe_details.name == "tungsten-carbide") or
    --            (recipe_details.name == "superconductor") or
    --            (recipe_details.name == "biolab") then
    --            is_self_recycling_recipe = true
    --        end
    --
    --        if recycling_recipe and (settings.startup["productivity-cap-recycle"].value == "less-recycled") then
    --            -- get product table from original recipe
    --            local ingredients_table = recipe_details.ingredients
    --            local results_table = {}
    --            
    --            local max_prod = (settings.startup["productivity-cap"].value/100) + 1 -- it should return 100% of outputs with 0% productivity cap, so we need to increase prod
    --            
    --            
    --            
    --            if is_self_recycling_recipe then
    --                recycling_recipe['results'][1].amount = 1
    --                recycling_recipe['results'][1].probability = math.min(1/max_prod, 0.75)
    --            else
    --                for i = 1, #ingredients_table do
    --                    local item_count = ingredients_table[i].amount / max_prod -- produces int and float values
    --                    if ingredients_table[i].type ~= 'fluid' then -- fluids should not be returned
    --                        local result = table.deepcopy(ingredients_table[i])
    --                        result.amount = math.floor(item_count)
    --                        result.extra_count_fraction = item_count - math.floor(item_count)
    --                        table.insert(results_table, result)
    --                    end
    --                end
    --                data.raw['recipe'][recipe_details.name .. '-recycling']['results'] = results_table
    --            end
    --            
    --
    --            
    --        end
    --        
    --        ::noRecipeFound::
    --    end
    --end
end