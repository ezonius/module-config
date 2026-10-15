data:extend{
    {
        name = 'more-tabs',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'a[basic]a[other]b',
        default_value = true
    }, {
        name = 'icons-on-modules',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'a[basic]a[other]c',
        default_value = "new",
        allowed_values = {
            "all",
            "new",
            "none"
        }
    }, {
        name = 'icons-on-beacons',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'a[basic]a[other]d',
        default_value = true
    }, {
        name = 'alt-mode-modules-in-beacons',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'a[basic]a[other]e',
        default_value = false
    },
    --{
    --    name = 'productivity-cap',
    --    setting_type = 'startup',
    --    type = 'double-setting',
    --    order = 'a[basic]a[other]f["productivity-cap]a',
    --    default_value = 300,
    --    minimum_value = 0,
    --    maximum_value = 32676
    --},
    {
        name = 'modules-per-recipe',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'a[basic]c[crafting]a',
        default_value = 5,
        minimum_value = 1,
        maximum_value = 2048
    }, {
        name = 'modules-per-result',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'a[basic]c[crafting]b',
        default_value = 1,
        minimum_value = 1,
        maximum_value = 2048
    }, {
        name = 'crafting-time',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'a[basic]c[crafting]c',
        default_value = 60,
        minimum_value = 1,
        maximum_value = 3600
    }, {
        name = 'tech-cost',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'a[basic]d[tech]a',
        default_value = "100*L^2"
    }, {
        name = 'tech-time',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'a[basic]d[tech]b',
        default_value = 30,
        minimum_value = 1,
        maximum_value = 3600
    }, {
        name = 'speed-in-beacon',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'b[beacons]a[allowed-effects]a',
        default_value = true
    }, {
        name = 'efficiency-in-beacon',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'b[beacons]a[allowed-effects]b',
        default_value = true
    }, {
        name = 'productivity-in-beacon',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'b[beacons]a[allowed-effects]c',
        default_value = false
    }, {
        name = 'pollution-in-beacon',
        setting_type = 'startup',
        type = 'bool-setting',
        order = 'b[beacons]a[allowed-effects]d',
        default_value = false
    }, {
        name = 'speed-in-all-recipes',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]c[allowed-recipes]a',
        default_value = "unchanged",
        allowed_values = {
            "unchanged",
            "everywhere",
            "nowhere"
        }
    }, {
        name = 'efficiency-in-all-recipes',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]c[allowed-recipes]b',
        default_value = "unchanged",
        allowed_values = {
            "unchanged",
            "everywhere",
            "nowhere"
        }
    }, {
        name = 'productivity-in-all-recipes',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]c[allowed-recipes]c',
        default_value = "unchanged",
        allowed_values = {
            "unchanged",
            "everywhere",
            "nowhere"
        }
    }, {
        name = 'pollution-in-all-recipes',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]c[allowed-recipes]d',
        default_value = "unchanged",
        allowed_values = {
            "unchanged",
            "everywhere",
            "nowhere"
        }
    }, {
        name = 'vanilla-beacon-distribution-effectivity',
        setting_type = 'startup',
        type = 'double-setting',
        order = 'b[beacons]b[vanilla-beacon]a',
        default_value = 1.5,
        minimum_value = 0.01,
        maximum_value = 65535
    }, {
        name = 'vanilla-beacon-supply_area_distance',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'b[beacons]b[vanilla-beacon]c',
        default_value = 3,
        minimum_value = 1,
        maximum_value = 64
    }, {
        name = 'vanilla-beacon-module-slots',
        setting_type = 'startup',
        type = 'int-setting',
        order = 'b[beacons]b[vanilla-beacon]d',
        default_value = 2,
        minimum_value = 1,
        maximum_value = 512
    }, {
        name = 'vanilla-beacon-profile',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]b[vanilla-beacon]e',
        default_value = "default",
        allowed_values = {
            "default",
            "overload-non-exclusive",
            "overload",
            "custom"
        }
    }, {
        name = 'vanilla-beacon-custom-profile',
        setting_type = 'startup',
        type = 'string-setting',
        order = 'b[beacons]b[vanilla-beacon]f',
        default_value = "",
        allow_blank = true
    },











    -- Speed Modules
    {
        name = 'max-speed',
        localised_name = {"", "[color=blue]", "Speed Module", ": [/color]", {"mod-setting-name.max-speed"}},
        setting_type = 'startup',
        type = 'int-setting',
        order = 'c[modules]a[speed]a[max-level]',
        default_value = 3,
        minimum_value = 3,
        maximum_value = 255
    }, {
	    name = 'speed-consumption-extrapolation',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-consumption-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]b[extrapolation]a',
        default_value = "constant_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'speed-speed-extrapolation',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-speed-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]b[extrapolation]b',
        default_value = "linear_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'speed-productivity-extrapolation',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-productivity-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]b[extrapolation]c',
        default_value = "disabled_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'speed-pollution-extrapolation',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-pollution-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]b[extrapolation]d',
        default_value = "disabled_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'speed-consumption-values',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-consumption-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]c[values]a',
        default_value = "0.50,0.60,0.70",
        allow_blank = true
    }, {
	    name = 'speed-speed-values',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-speed-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]c[values]b',
        default_value = "0.20,0.30,0.50",
        allow_blank = true
    }, {
	    name = 'speed-productivity-values',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-productivity-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]c[values]c',
        default_value = "",
        allow_blank = true
    }, {
	    name = 'speed-pollution-values',
		localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-pollution-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]a[speed]c[values]d',
        default_value = "",
        allow_blank = true
    },







    -- Efficiency Modules
    {
	    name = 'max-efficiency',
		localised_name = {"", "[color=green]", "Efficiency Module", ": [/color]", {"mod-setting-name.max-efficiency"}},
        setting_type = 'startup',
        type = 'int-setting',
        order = 'c[modules]b[efficiency]a[max-level]',
        default_value = 3,
        minimum_value = 3,
        maximum_value = 255
    }, {
	    name = 'efficiency-consumption-extrapolation',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-consumption-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]b[extrapolation]a',
        default_value = "constant_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'efficiency-speed-extrapolation',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-speed-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]b[extrapolation]b',
        default_value = "disabled_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'efficiency-productivity-extrapolation',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-productivity-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]b[extrapolation]c',
        default_value = "disabled_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'efficiency-pollution-extrapolation',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-pollution-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]b[extrapolation]d',
        default_value = "disabled_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern"
        }
    }, {
	    name = 'efficiency-consumption-values',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-consumption-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]c[values]a',
        default_value = "-0.30,-0.40,-0.50",
        allow_blank = true
    }, {
	    name = 'efficiency-speed-values',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-speed-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]c[values]b',
        default_value = "",
        allow_blank = true
    }, {
	    name = 'efficiency-productivity-values',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-productivity-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]c[values]c',
        default_value = "",
        allow_blank = true
    }, {
	    name = 'efficiency-pollution-values',
		localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-pollution-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]b[efficiency]c[values]d',
        default_value = "",
        allow_blank = true
    },


    -- Productivity Modules
    {
	    name = 'max-productivity',
		localised_name = {"", "[color=red]", "Productivity Module", ": [/color]", {"mod-setting-name.max-productivity"}},
        setting_type = 'startup',
        type = 'int-setting',
        order = 'c[modules]c[productivity]a[max-level]',
        default_value = 3,
        minimum_value = 3,
        maximum_value = 255
    }, {
	    name = 'productivity-consumption-extrapolation',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-consumption-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]b[extrapolation]a',
        default_value = "constant_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'productivity-speed-extrapolation',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-speed-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]b[extrapolation]b',
        default_value = "constant_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'productivity-productivity-extrapolation',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-productivity-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]b[extrapolation]c',
        default_value = "linear_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'productivity-pollution-extrapolation',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-pollution-extrapolation"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]b[extrapolation]d',
        default_value = "linear_pattern",
        allowed_values = {
            "disabled_pattern",
            "linear_pattern",
            "constant_pattern",
            "fibonacci_pattern",
            "exponential_pattern",
            "polynomial_pattern",
        }
    }, {
	    name = 'productivity-consumption-values',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-consumption-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]c[values]a',
        default_value = "0.40,0.60,0.80",
        allow_blank = true
    }, {
	    name = 'productivity-speed-values',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-speed-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]c[values]b',
        default_value = "-0.05,-0.10,-0.15",
        allow_blank = true
    }, {
	    name = 'productivity-productivity-values',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-productivity-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]c[values]c',
        default_value = "0.04,0.06,0.10",
        allow_blank = true
    }, {
	    name = 'productivity-pollution-values',
		localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-pollution-values"}},
        setting_type = 'startup',
        type = 'string-setting',
        order = 'c[modules]c[productivity]c[values]d',
        default_value = "0.05,0.07,0.10",
        allow_blank = true
    },



    -- Engine Effect Limits (data-stage clamps applied to recipes and machines)
    {
        name = 'productivity-limits-high',
        localised_name = {"", "[color=red]", "Productivity", ": [/color]", {"mod-setting-name.productivity-limits-high"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]a[productivity]a[high]',
        default_value = 100000,
        minimum_value = 0,
        maximum_value = 100000
    }, {
        name = 'productivity-limits-low',
        localised_name = {"", "[color=red]", "Productivity", ": [/color]", {"mod-setting-name.productivity-limits-low"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]a[productivity]b[low]',
        default_value = -80,
        minimum_value = -99.99,
        maximum_value = 100000
    }, {
        name = 'speed-limits-high',
        localised_name = {"", "[color=blue]", "Speed", ": [/color]", {"mod-setting-name.speed-limits-high"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]b[speed]a[high]',
        default_value = 100000,
        minimum_value = 0,
        maximum_value = 100000
    }, {
        name = 'speed-limits-low',
        localised_name = {"", "[color=blue]", "Speed", ": [/color]", {"mod-setting-name.speed-limits-low"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]b[speed]b[low]',
        default_value = -80,
        minimum_value = -99.99,
        maximum_value = 100000
    }, {
        name = 'consumption-limits-high',
        localised_name = {"", "[color=green]", "Consumption", ": [/color]", {"mod-setting-name.consumption-limits-high"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]c[consumption]a[high]',
        default_value = 100000,
        minimum_value = 0,
        maximum_value = 100000
    }, {
        name = 'consumption-limits-low',
        localised_name = {"", "[color=green]", "Consumption", ": [/color]", {"mod-setting-name.consumption-limits-low"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]c[consumption]b[low]',
        default_value = -80,
        minimum_value = -99.99,
        maximum_value = 100000
    }, {
        name = 'pollution-limits-high',
        localised_name = {"", "[color=yellow]", "Pollution", ": [/color]", {"mod-setting-name.pollution-limits-high"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]d[pollution]a[high]',
        default_value = 100000,
        minimum_value = 0,
        maximum_value = 100000
    }, {
        name = 'pollution-limits-low',
        localised_name = {"", "[color=yellow]", "Pollution", ": [/color]", {"mod-setting-name.pollution-limits-low"}},
        setting_type = 'startup',
        type = 'double-setting',
        order = 'c[modules]e[limits]d[pollution]b[low]',
        default_value = -80,
        minimum_value = -99.99,
        maximum_value = 100000
    }

}




-- Quality Modules
if mods["quality"] then
    data:extend{
        --{
        --    name = 'productivity-cap-recycle',
        --    setting_type = 'startup',
        --    type = 'string-setting',
        --    order = 'a[basic]a[other]f["productivity-cap]b',
        --    default_value = "less-recycled",
        --    allowed_values = {
        --        "less-recycled",
        --        "no-recycle"
        --    }
        --},
        {
            name = 'quality-in-beacon',
            setting_type = 'startup',
            type = 'bool-setting',
            order = 'b[beacons]a[allowed-effects]e',
            default_value = false
        }, {
            name = 'quality-in-all-recipes',
            setting_type = 'startup',
            type = 'string-setting',
            order = 'b[beacons]c[allowed-recipes]e',
            default_value = "unchanged",
            allowed_values = {
                "unchanged",
                "everywhere",
                "nowhere"
            }
        }, {
            name = 'vanilla-beacon-distribution-effectivity-bonus-per-quality-level',
            setting_type = 'startup',
            type = 'double-setting',
            order = 'b[beacons]b[vanilla-beacon]b',
            default_value = 0.2,
            minimum_value = 0,
            maximum_value = 65535
        }, {
            name = 'speed-quality-extrapolation',
            localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-quality-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]a[speed]b[extrapolation]e',
            default_value = "constant_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        },

        {
            name = 'efficiency-quality-extrapolation',
            localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-quality-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]b[efficiency]b[extrapolation]e',
            default_value = "disabled_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        },

        {
            name = 'productivity-quality-extrapolation',
            localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-quality-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]c[productivity]b[extrapolation]e',
            default_value = "disabled_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        },



        -- Values
        {
            name = 'speed-quality-values',
            localised_name = {"", "[color=blue]", "          Speed Module", ": [/color]", {"mod-setting-name.speed-quality-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]a[speed]c[values]e',
            default_value = "-0.01,-0.02,-0.025",
            allow_blank = true
        }, {
            name = 'efficiency-quality-values',
            localised_name = {"", "[color=green]", "          Efficiency Module", ": [/color]", {"mod-setting-name.efficiency-quality-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]b[efficiency]c[values]e',
            default_value = "",
            allow_blank = true
        }, {
            name = 'productivity-quality-values',
            localised_name = {"", "[color=red]", "          Productivity Module", ": [/color]", {"mod-setting-name.productivity-quality-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]c[productivity]c[values]e',
            default_value = "",
            allow_blank = true
        },




        {
            name = 'max-quality',
            localised_name = {"", "[color=white]", "Quality Module", ": [/color]", {"mod-setting-name.max-quality"}},
            setting_type = 'startup',
            type = 'int-setting',
            order = 'c[modules]d[quality]a[max-level]',
            default_value = 3,
            minimum_value = 3,
            maximum_value = 255
        }, {
            name = 'quality-consumption-extrapolation',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-consumption-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]b[extrapolation]a',
            default_value = "disabled_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        }, {
            name = 'quality-speed-extrapolation',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-speed-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]b[extrapolation]b',
            default_value = "constant_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        }, {
            name = 'quality-productivity-extrapolation',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-productivity-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]b[extrapolation]c',
            default_value = "disabled_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        }, {
            name = 'quality-pollution-extrapolation',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-pollution-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]b[extrapolation]d',
            default_value = "disabled_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        }, {
            name = 'quality-quality-extrapolation',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-quality-extrapolation"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]b[extrapolation]e',
            default_value = "constant_pattern",
            allowed_values = {
                "disabled_pattern",
                "linear_pattern",
                "constant_pattern",
                "fibonacci_pattern",
                "exponential_pattern",
                "polynomial_pattern"
            }
        }, {
            name = 'quality-consumption-values',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-consumption-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]c[values]a',
            default_value = "",
            allow_blank = true
        }, {
            name = 'quality-speed-values',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-speed-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]c[values]b',
            default_value = "-0.05,-0.05,-0.05",
            allow_blank = true
        }, {
            name = 'quality-productivity-values',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-productivity-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]c[values]c',
            default_value = "",
            allow_blank = true
        }, {
            name = 'quality-pollution-values',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-pollution-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]c[values]d',
            default_value = "",
            allow_blank = true
        }, {
            name = 'quality-quality-values',
            localised_name = {"", "[color=white]", "          Quality Module", ": [/color]", {"mod-setting-name.quality-quality-values"}},
            setting_type = 'startup',
            type = 'string-setting',
            order = 'c[modules]d[quality]c[values]e',
            default_value = "0.01,0.02,0.025",
            allow_blank = true
        }, {
            name = 'quality-limits-high',
            localised_name = {"", "[color=white]", "Quality", ": [/color]", {"mod-setting-name.quality-limits-high"}},
            setting_type = 'startup',
            type = 'double-setting',
            order = 'c[modules]e[limits]e[quality]a[high]',
            default_value = 10000,
            minimum_value = 0,
            maximum_value = 10000
        }, {
            name = 'quality-limits-low',
            localised_name = {"", "[color=white]", "Quality", ": [/color]", {"mod-setting-name.quality-limits-low"}},
            setting_type = 'startup',
            type = 'double-setting',
            order = 'c[modules]e[limits]e[quality]b[low]',
            default_value = 0,
            minimum_value = -10000,
            maximum_value = 10000
        },
    }
end
