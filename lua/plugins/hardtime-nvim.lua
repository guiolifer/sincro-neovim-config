return {
	"m4xshen/hardtime.nvim",
	command = "Hardtime",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
	  enabled = true,
    max_time = 9999999,
    max_count = 99999,
    disable_mouse = true,
    hint = true,
    notification = true,
    allow_different_key = false,

  },
}
