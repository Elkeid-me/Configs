local main_mold = "SUPER"
local noctalia_msg = "noctalia msg"

hl.bind(main_mold .. " + Q", hl.dsp.exec_cmd(TERMINAL))
hl.bind(main_mold .. " + C", hl.dsp.window.close())
hl.bind(main_mold .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(main_mold .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(main_mold .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mold .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mold .. " + L", hl.dsp.exec_cmd(noctalia_msg .. " session lock"))
hl.bind(main_mold .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(main_mold .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mold .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mold .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mold .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind("ALT + SPACE", hl.dsp.exec_cmd(noctalia_msg .. " panel-open launcher"))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mold .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(main_mold .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(main_mold .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(main_mold .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(main_mold .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mold .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(main_mold .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mold .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(noctalia_msg .. " volume-up"),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(noctalia_msg .. " volume-down"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(noctalia_msg .. " vulume-mute"),     { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(noctalia_msg .. " brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia_msg .. " brightness-down"), { locked = true, repeating = true })
