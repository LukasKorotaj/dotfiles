local envs = {
	{ "XDG_CURRENT_DESKTOP", "Hyprland" },
	{ "XDG_SESSION_TYPE", "wayland" },
	{ "XDG_SESSION_DESKTOP", "Hyprland" },
	{ "XCURSOR_SIZE", "24" },
	{ "ELECTRON_OZONE_PLATFORM_HINT", "auto" },
	{ "LIBVA_DRIVER_NAME", "nvidia" },
	{ "__GLX_VENDOR_LIBRARY_NAME", "nvidia" },
}

for _, v in ipairs(envs) do
	hl.env(v[1], v[2])
end
