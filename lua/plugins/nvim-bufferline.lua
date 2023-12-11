return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "v1.*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}
  end,
}
