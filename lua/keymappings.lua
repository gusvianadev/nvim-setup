-- Local variables
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Map leader to space
keymap( "n", "<Space>", "<NOP>", opt )
vim.g.mapleader = " "

-- Press ii to return to normal mode in any mode
keymap( "i", "ii", "<ESC>", opt )
keymap( "v", "ii", "<ESC>", opt )
keymap( "c", "ii", "<ESC>", opt )

-- Visual mode
keymap( "v", "<TAB>", ">gv", opt )
keymap( "v", "<S-TAB>", "<gv", opt )
keymap( "v", "<S-k>", ":move '<-2<CR>gv-gv'", opt )
keymap( "v", "<S-j>", ":move '>+1<CR>gv-gv'", opt )

-- File management
keymap( "n", "<LEADER>sf", ":w<CR>", opt )
keymap( "n", "<LEADER>bd", ":bd<CR>", opt )

-- Buffer navigation
keymap( "n", "<TAB>", ":bnext<CR>", opt )
keymap( "n", "<S-TAB>", ":bprevious<CR>", opt )

-- Window navigation
keymap( "n", "<C-h>", "<C-w>h", opt )
keymap( "n", "<C-j>", "<C-w>j", opt )
keymap( "n", "<C-k>", "<C-w>k", opt )
keymap( "n", "<C-l>", "<C-w>l", opt )

-- Use alt + hjkl to resize windows
keymap( "n", "<M-j>", ":resize -2<CR>", opt )
keymap( "n", "<M-k>", ":resize +2<CR>", opt )
keymap( "n", "<M-h>", ":vertical resize -2<CR>", opt )
keymap( "n", "<M-l>", ":vertical resize +2<CR>", opt )

-- Telescope
keymap( "n", "<LEADER>ff", ":Telescope git_files<CR>", opt )
keymap( "n", "<LEADER>fg", ":Telescope live_grep<CR>", opt )
keymap( "n", "<LEADER>fb", ":Telescope buffers<CR>", opt )
keymap( "n", "<LEADER>fh", ":Telescope help_tags<CR>", opt )
keymap( "n", "<LEADER>fk", ":Telescope keymaps<CR>", opt )

-- Tree Toggle
keymap( "n", "<LEADER>tt", ":NvimTreeToggle<CR>", opt )

-- LSP
keymap( "n", "<LEADER>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt )

-- LSP Saga
keymap( "n", "<LEADER>gh",
        "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opt )
keymap( "n", "<LEADER>pd",
        "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opt )
keymap( "n", "<LEADER>ca",
        "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opt )
keymap( "v", "<LEADER>ca",
        "<C-U>lua require'lspsaga.codeaction'.range_code_action()<CR>", opt )
keymap( "n", "<LEADER>hd",
        "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", opt )
keymap( "n", "<C-k>",
        "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opt )
keymap( "n", "<C-j>",
        "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opt )
keymap( "n", "<LEADER>gs",
        "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>", opt )
keymap( "n", "<LEADER>rs", "<cmd>lua require'lspsaga.rename'.rename()<CR>", opt )
keymap( "n", "<LEADER>ld",
        "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opt )
keymap( "n", "<LEADER>cd",
        "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
        opt )
keymap( "n", "<C-p>",
        "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
        opt )
keymap( "n", "<C-n>",
        "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
        opt )
keymap( "n", "<LEADER>ft",
        "<cmd>lua require'lspsaga.floaterm'.open_float_terminal()<CR>", opt )
keymap( "t", "<ESC>",
        "<cmd>lua require'lspsaga.floaterm'.close_float_terminal()<CR>", opt )
