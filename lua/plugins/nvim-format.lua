return {
  "mhartington/formatter.nvim",
  lazy = true,
  config = function()
    require("formatter").setup {
      logging = false,
      filetype = {
        javascript = {
          -- prettierd
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        -- other formatters ...
      },
    }
  end,
}
