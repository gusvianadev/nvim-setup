vim.api.nvim_exec(
	[[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.html,*.css,*.js,*jsx,*.ts,*.tsx,*.json,*.lua FormatWrite
	augroup END
]],
	true
)

local prettier = function()
	return {
		exe = "prettier",
		args = { vim.api.nvim_buf_get_name(0) },
		stdin = true,
	}
end

require("formatter").setup({
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
					exe = "stylua",
					args = {
						vim.api.nvim_buf_get_name(0),
					},
					stdin = false,
				}
			end,
		},
	},
})
