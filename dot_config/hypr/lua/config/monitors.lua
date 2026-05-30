local file = io.open("/etc/hostname", "r")
local hostname = ""
if file then
	hostname = file:read("*l"):gsub("%s+", "")
	file:close()
end

if hostname == "archlukas" then
	hl.env("GDK_SCALE", "1")

	hl.monitor({
		output = "DP-2",
		mode = "1920x1080@144",
		position = "auto",
		scale = 1.0,
	})
elseif hostname == "elitearch" then
	hl.env("GDK_SCALE", "1.2")

	hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.2 })

	hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-up", scale = 1.2 })
end
