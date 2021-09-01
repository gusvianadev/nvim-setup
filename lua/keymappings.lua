-- Local variables
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- Map leader to space
keymap("n", "<Space>", "<NOP>", opt)
vim.g.mapleader = " "
-- Press ii to return to normal mode in any mode
keymap("i", "ii", "<ESC>", opt)
keymap("v", "ii", "<ESC>", opt)
keymap("c", "ii", "<ESC>", opt)
-- Visual mode
keymap("v", "<TAB>", ">gv", opt)
keymap("v", "<S-TAB>", "<gv", opt)
-- File management
keymap("n", "<LEADER>w", ":w<CR>", opt)
keymap("n", "<LEADER>so", ":luafile %<CR>", opt)
-- Buffer navigation
keymap("n", "<TAB>", ":bnext<CR>", opt)
keymap("n", "<S-TAB>", ":bprevious<CR>", opt)
-- Window navigation
keymap("n", "<LEADER>bd", ":bd<CR>", opt)
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-j>", "<C-w>j", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-l>", "<C-w>l", opt)
-- Use alt + (h, j, k, l) to resize windows
keymap("n", "<M-j>", ":resize -2<CR>", opt)
keymap("n", "<M-k>", ":resize +2<CR>", opt)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opt)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opt)
-- Sync all plugins
keymap("n", "<LEADER>ps", ":PackerSync<CR>", opt)
-- Find
keymap(
	"n",
	"<LEADER>ff",
	":lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
	opt
)
keymap("n", "<LEADER>fg", ":Telescope live_grep<CR>", opt)
keymap("n", "<LEADER>fh", ":Telescope help_tags<CR>", opt)
keymap("n", "<LEADER>fk", ":Telescope keymaps<CR>", opt)
keymap("n", "<LEADER>fp", ":Telescope projects<CR>", opt)
-- Tree
keymap("n", "<LEADER>tt", ":NvimTreeToggle<CR>", opt)
-- LSP
keymap("n", "<LEADER>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
-- LSP Saga
keymap("n", "<LEADER>gh", ":Lspsaga lsp_finder<CR>", opt)
keymap("n", "<LEADER>ca", ":Lspsaga code_action<CR>", opt)
keymap("n", "<LEADER>hd", ":Lspsaga hover_doc<CR>", opt)
keymap(
	"n",
	"<C-p>",
	":lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>",
	opt
)
keymap(
	"n",
	"<C-n>",
	":lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>",
	opt
)
keymap("n", "<LEADER>gs", ":Lspsaga signature_help<CR>", opt)
keymap("n", "<LEADER>rs", ":Lspsaga rename<CR>", opt)
keymap("n", "<LEADER>ld", ":Lspsaga show_line_diagnostics<CR>", opt)
keymap("n", "<LEADER>cd", ":Lspsaga show_cursor_diagnostics<CR>", opt)
keymap("n", "<C-p>", ":Lspsaga diagnostic_jump_prev<CR>", opt)
keymap("n", "<C-n>", ":Lspsaga diagnostic_jump_next<CR>", opt)
keymap("n", "<LEADER>ft", ":Lspsaga open_floaterm<CR>", opt)
keymap("t", "<ESC>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>", opt)
-- Highlight current n
keymap("n", "n", "<Plug>(highlight-current-n-n)", {})
keymap("n", "N", "<Plug>(highlight-current-n-N)", {})
