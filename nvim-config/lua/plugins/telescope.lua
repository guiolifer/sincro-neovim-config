local mapkey = require("util.keymapper").mapkey

local config = function()
  local telescope = require "telescope"
  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
      },
    },
  }
end

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  keys = {
    mapkey("<leader>fk", "Telescope keymaps", "n"),
    mapkey("<leader>fh", "Telescope help_tags", "n"),
    mapkey("<leader>ff", "Telescope find_files", "n"),
    mapkey("<leader>fg", "Telescope live_grep", "n"),
    mapkey("<leader>fb", "Telescope buffers", "n"),
    mapkey("<leader>fm", "<cmd>Telescope marks<cr>", "n"),
    mapkey("<leader>fr", "<cmd>Telescope lsp_references<cr>", "n"),
    mapkey("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "n"),
    mapkey("<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", "n"),
    mapkey("<leader>fo", "<cmd>Telescope lsp_outgoing_calls<cr>", "n"),
    mapkey("<leader>fi", "<cmd>Telescope lsp_implementations<cr>", "n"),
    mapkey("<leader>fx", "<cmd>Telescope diagnostics bufnr=0<cr>", "n"),
  },
}
