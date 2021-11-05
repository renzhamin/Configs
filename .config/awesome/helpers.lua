local awful         =   require("awful")
local ipairs        =   ipairs
local helpers       =   {}

function helpers.checkWibarForTag(t)
    t.screen.mywibox.visible = t.barvisible
end

function helpers.toggleWibarForTag()
    local t = awful.screen.focused().selected_tag
    t.barvisible = not t.barvisible
    helpers.checkWibarForTag(t)
end

function helpers.run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end


return helpers
