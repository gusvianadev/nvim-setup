local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

require( "bufferline" ).setup {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count,
                                         level,
                                         diagnostics_dict,
                                         context )
            local s = " "
            for e, n in pairs( diagnostics_dict ) do
                local sym = e == "error" and " " or
                                (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
        offsets = {
            { filetype = "NvimTree", text = "File Tree", highlight = "Directory" }
        }
    }
}
keymap( "n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt )
keymap( "n", "<TAB>", ":BufferLineCycleNext<CR>", opt )
keymap( "n", "<LEADER><S-TAB>", ":BufferLineMovePrev<CR>", opt )
keymap( "n", "<LEADER><TAB>", ":BufferLineMoveNext<CR>", opt )
