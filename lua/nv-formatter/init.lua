vim.api.nvim_exec( [[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.js,*jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
	augroup END
]], true )

require( "formatter" ).setup( {
    logging = false,
    filetype = {
        html = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        css = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        javascriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        typescriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = { vim.api.nvim_buf_get_name( 0 ) },
                    stdin = true
                }
            end
        },
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
