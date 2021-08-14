local au = require "helpers/augroup"

au( "highlight_on_yank", {
    {
        events = { "TextYankPost" },
        targets = { "*" },
        modifiers = { "silent!" },
        command = function() vim.highlight.on_yank { timeout = 200 } end
    }
} )

au( "set_formatoptions", {
    {
        events = { "BufEnter" },
        targets = { "*" },
        command = "set fo-=c fo-=r fo-=o"
    }
} )
