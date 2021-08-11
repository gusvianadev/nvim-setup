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
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
