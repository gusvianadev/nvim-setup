-- Local variables
local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Map leader to space
keymap('n', '<Space>', '<NOP>', opt)
vim.g.mapleader = " "

-- Press ii to return to normal mode in any mode
keymap('i', 'ii', '<ESC>', opt)
keymap('v', 'ii', '<ESC>', opt)
keymap('c', 'ii', '<ESC>', opt)

-- Visual mode
keymap('v', '<TAB>', '>gv', opt)
keymap('v', '<S-TAB>', '<gv', opt)
keymap('v', 'K', ':move \'<-2<CR>gv-gv\'', opt)
keymap('v', 'J', ':move \'>+1<CR>gv-gv\'', opt)

-- Terminal mode
keymap('n', '<LEADER>sh', ':terminal<CR>', opt)
keymap('t', '<ESC>', '<C-\\><C-n>:bd!<CR>', opt)

-- File management
keymap('n', '<LEADER>sf', ':w<CR>', opt)
keymap('n', '<LEADER>bd', ':bd<CR>', opt)

-- Buffer navigation
keymap('n', '<TAB>', ':bnext<CR>', opt)
keymap('n', '<S-TAB>', ':bprevious<CR>', opt)

-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opt)
keymap('n', '<C-j>', '<C-w>j', opt)
keymap('n', '<C-k>', '<C-w>k', opt)
keymap('n', '<C-l>', '<C-w>l', opt)

-- Use alt + hjkl to resize windows
keymap('n', '<M-j>', ':resize -2<CR>', opt)
keymap('n', '<M-k>', ':resize +2<CR>', opt)
keymap('n', '<M-h>', ':vertical resize -2<CR>', opt)
keymap('n', '<M-l>', ':vertical resize +2<CR>', opt)

-- Telescope
keymap('n', '<LEADER>ff', ':Telescope git_files<CR>', opt)
keymap('n', '<LEADER>fg', ':Telescope live_grep<CR>', opt)
keymap('n', '<LEADER>fb', ':Telescope buffers<CR>', opt)
keymap('n', '<LEADER>fh', ':Telescope help_tags<CR>', opt)

-- Tree Toggle
keymap('n', '<LEADER>tt', ':NvimTreeToggle<CR>', opt)

-- <TAB> for autocomplete
-- keymap('i', '<expr><TAB>', 'pumvisible() ? \'\\<C-n>\' : \'\\<TAB>\'', opt)
