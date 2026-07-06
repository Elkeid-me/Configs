hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 1,
        col = {
            active_border   = "rgba(d3e4c9ff)",
            inactive_border = "rgba(2222227f)",
        },
        resize_on_border = true,
        allow_tearing = true,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 3,

        active_opacity   = 1.0,
        inactive_opacity = 0.5,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 4,
            vibrancy  = 0.1696,
        },
    },
})