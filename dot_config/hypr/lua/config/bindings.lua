local terminal = "kitty"
local browser = "firefox"
local mainMod = "SUPER"

local exec = hl.dsp.exec_cmd

-- Basic
hl.bind(mainMod .. "+ return", exec(terminal), { description = "Terminal" })
hl.bind(mainMod .. "+ T", exec(terminal .. "-e btop"), { description = "Activity" })

-- Menus
local menus = {
	{ mainMod .. " + SPACE", "Launch apps", "qs -c noctalia-shell ipc call launcher toggle" },
	{ mainMod .. " + CTRL + E", "Emoji picker", "qs -c noctalia-shell ipc call launcher emoji" },
	{ mainMod .. " + ALT + SPACE", "Control Center", "qs -c noctalia-shell ipc call controlCenter toggle" },
	{ mainMod .. " + ALT + S", "Settings", "qs -c noctalia-shell ipc call settings toggle" },
	{ mainMod .. " + V", "Clipboard Menu", "qs -c noctalia-shell ipc call launcher clipboard" },
	{ "XF86PowerOff", "Power menu", "qs -c noctalia-shell ipc call sessionMenu toggle" },
	{ "XF86Calculator", "Calculator", "qs -c noctalia-shell ipc call launcher calculator" },
}

for _, item in ipairs(menus) do
	hl.bind(item[1], exec(item[3]), { description = item[2] })
end

-- Media
hl.bind("XF86AudioRaiseVolume", exec("qs -c noctalia-shell ipc call volume increase"))
hl.bind("XF86AudioLowerVolume", exec("qs -c noctalia-shell ipc call volume decrease"))
hl.bind("XF86AudioMute", exec("qs -c noctalia-shell ipc call volume muteOutput"))

-- Brightness
hl.bind("XF86MonBrightnessUp", exec("qs -c noctalia-shell ipc call brightness increase"))
hl.bind("XF86MonBrightnessDown", exec("qs -c noctalia-shell ipc call brightness decrease"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Other
local mainShift = mainMod .. " + SHIFT"

local programs = {
	{
		mainShift .. " + F4",
		[[sh -c "flatpak run dev.vencord.Vesktop --nosocket=x11 --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"]],
	},
	{ mainShift .. " + N", "neovide" },
	{ mainShift .. " + F3", "ncspot" },
	{ mainShift .. " + F2", browser },
	{ mainShift .. " + T", ".local/bin/textGod.sh" },
	{ mainShift .. " + M", ".local/bin/screenshot.sh" },
}

for _, item in ipairs(programs) do
	hl.bind(item[1], exec(item[2]))
end

local lck = {
	{ mainShift .. " + X", "qs -c noctalia-shell ipc call lockScreen lock" },
	{ mainShift .. " + I", "qs -c noctalia-shell ipc call IdleInhibitor toggle" },
}

for _, item in ipairs(lck) do
	hl.bind(item[1], exec(item[2]))
end

hl.bind(mainShift .. " + Q", hl.dsp.window.close())

hl.bind(mainShift .. " + P", function()
	local current_monitors = hl.get_monitors()

	if current_monitors[1] and current_monitors[2] then
		hl.dsp.workspace.swap_monitors({
			monitor1 = current_monitors[1],
			monitor2 = current_monitors[2],
		})
	end
end)

hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Move and swap keys
local keys = {
	h = "l",
	l = "r",
	k = "u",
	j = "d",
}

for k, v in pairs(keys) do
	hl.bind(mainMod .. " + " .. k, hl.dsp.focus({ direction = v }))
	hl.bind(mainShift .. " + " .. k, hl.dsp.window.swap({ direction = v }))
end

-- special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainShift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
