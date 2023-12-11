return {
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
		{ "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
		{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
		{ "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		{ "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon select 1" },
		{ "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon select 2" },
		{ "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon select 3" },
	},
}