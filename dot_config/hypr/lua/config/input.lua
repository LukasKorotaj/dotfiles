hl.config({
	input = {
		kb_layout = "us",
		kb_options = "caps:escape",
		"compose:ralt",
		follow_mouse = 1,

		repeat_rate = 60,
		repeat_delay = 200,

		sensitivity = 0.2,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.device({
	name = "sony-interactive-entertainment-dualsense-wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = "dualsense-wireless-controller-touchpad",
	enabled = false,
})

hl.device({
	name = " telink-wireless-receiver-mouse",
	accel_profile = "flat",
})
