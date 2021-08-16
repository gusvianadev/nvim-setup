vim.api.nvim_exec( [[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.html,*.css,*.js,*jsx,*.ts,*.tsx,*.json,*.lua FormatWrite
	augroup END
]], true )

local prettier = function()
    return {
        exe = "prettier",
        args = { vim.api.nvim_buf_get_name( 0 ) },
        stdin = true
    }
end

require( "formatter" ).setup( {
    logging = false,
    filetype = {
        html = { prettier },
        css = { prettier },
        javascript = { prettier },
        javascriptreact = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        json = { prettier },
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
                        "--chop-down-table",
                        "--chop-down-kv-table",
                        "--chop-down-parameter",
                        "--single-quote-to-double-quote",
                        "--spaces-inside-functiondef-parens",
                        "--spaces-inside-functioncall-parens",
                        "--spaces-inside-table-braces",
                        "--spaces-around-equals-in-field",
                        vim.api.nvim_buf_get_name( 0 )
                    },
                    stdin = true
                }
            end
        }
    }
} )
