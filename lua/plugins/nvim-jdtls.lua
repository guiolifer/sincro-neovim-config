return {
  "mfussenegger/nvim-jdtls",
  disable = false,
  ft = "java",
  config = function()
    vim.cmd [[
      augroup jdtls_lsp
          autocmd!
          autocmd FileType java lua require'jdtls.jdtls_setup'.setup()
      augroup end
    ]]
  end,
}
