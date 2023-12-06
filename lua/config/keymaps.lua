local mapkey = require("util.keymapper").mapkey

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer

-- Directory Navigatio}n
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally

-- Indenting
mapkey("<", "v", "<gv") -- Shift Indentation to Left
mapkey(">", "v", ">gv") -- Shift Indentation to Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

local api = vim.api

-- Zen Mode
api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })

-- Java
function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param =
      ' -Dspring.cloud.kubernetes.enabled=false -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return "mvn spring-boot:run " .. profile_param .. debug_param
end

function run_spring_boot(debug)
  vim.cmd("term " .. get_spring_boot_runner(method_name, debug))
end

vim.keymap.set("n", "<F9>", function()
  run_spring_boot()
end)
vim.keymap.set("n", "<F10>", function()
  run_spring_boot(true)
end)

-- view informations in debug
function show_dap_centered_scopes()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end

mapkey("gs", ":lua show_dap_centered_scopes()<CR>", "n")

function attach_to_debug()
  local dap = require "dap"
  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Attach to the process",
      hostName = "localhost",
      port = "5005",
    },
  }
  dap.continue()
end
mapkey("<leader>da", ":lua attach_to_debug()<CR>", "n")

mapkey("<S-F8>", ':lua require"dap".step_out()<CR>', "n")

-- move in debug
mapkey("<F5>", ':lua require"dap".continue()<CR>', "n")
mapkey("<F8>", ':lua require"dap".step_over()<CR>', "n")
mapkey("<F7>", ':lua require"dap".step_into()<CR>', "n")
mapkey("<S-F8>", ':lua require"dap".step_out()<CR>', "n")

-- nvim-dap
--

function dap_hover()
  require("dap.ui.widgets").hover()
end

function dap_centered_float()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end

mapkey("<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "n")
mapkey("<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "n")
mapkey("<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "n")
mapkey("<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", "n")
mapkey("<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", "n")

mapkey("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "n")
mapkey("<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", "n")
mapkey("<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", "n")
mapkey("<leader>do", "<cmd>lua require'dap'.step_out()<cr>", "n")
mapkey("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", "n")
mapkey("<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", "n")
mapkey("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "n")
mapkey("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", "n")
mapkey("<leader>di", ":lua dap_hover()<CR>", "n")
mapkey("<leader>d?", ":lua dap_centered_float()<CR>", "n")
mapkey("<leader>df", "<cmd>Telescope dap frames<cr>", "n")
mapkey("<leader>dh", "<cmd>Telescope dap commands<cr>", "n")

-- Symbols-outline
mapkey("<leader>o", "SymbolsOutline", "n")

-- angularls
function show_log_angularls()
  local pathLogAngular = vim.fn.expand "~/angular-log/nglangsvc.log"
  vim.cmd("view " .. pathLogAngular)
end

mapkey("<leader>al", ":lua show_log_angularls()<CR>", "n")
