local wrule = hl.window_rule

wrule({
	name = "small",
	match = {
		class = "steam",
		title = "Steam",
	},
	float = true,
	center = true,
	size = { 1100, 700 },
})

wrule({
	name = "xtra-small",
	match = {
		class = "steam",
		title = "Friends List",
	},
	float = true,
	center = true,
	size = { 300, 500 },
})

wrule({
	name = "txtgod",
	match = {
		title = "txtgod",
	},
	size = { "(monitor_w*0.5)", "(monitor_h*0.5)" },
	pseudo = true,
	workspace = "special:magic",
})
