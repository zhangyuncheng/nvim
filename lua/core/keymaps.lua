vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set({"n","t"},"<C-j>","<C-w><C-j>")
keymap.set({"n","t"},"<C-k>","<C-w><C-k>")
keymap.set({"n","t"},"<C-h>","<C-w><C-h>")
keymap.set({"n","t"},"<C-l>","<C-w><C-l>")

keymap.set("n","s","")

-- ctrl + s 保存
keymap.set("n", "<C-s>", "<CMD>w<CR>")
keymap.set("i", "<C-s>", "<ESC><CMD>w<CR>")

-- Configure Copy Shortcuts
keymap.set("v", "<C-c>", '"+y') -- copy
keymap.set("v", "<C-x>", '"+d') -- cut

-- Windows split screen shortcuts
keymap.set("n", "sv", "<CMD>vsp<CR>")
keymap.set("n", "sh", "<CMD>sp<CR>")
-- Close current
keymap.set("n", "sc", "<C-w>c")
-- Close other
keymap.set("n", "so", "<C-w>o")


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- dap
keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", opts)
keymap("n", "<leader>dT", "<cmd>lua require('dapui').float_element('stacks', {})<cr>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>df", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dk", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<leader>de", "<cmd>lua require('dapui').eval()<cr>", opts)
keymap("n", "<leader>d<cr>", "<cmd>lua require'dap'.run_last()<cr>", opts)

-- telescope
keymap("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>",opts)
