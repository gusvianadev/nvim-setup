-- Configure lua language server for neovim development
local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = "LuaJIT",
			path = vim.split(package.path, ";"),
		},
		diagnostics = { globals = { "vim" } },
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			},
		},
	},
}

-- config that enables snippet support
local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- capabilities.textDocument.completion.completionItem.resolveSupport = {
	-- 	properties = { "documentation", "detail", "additionalTextEdits" },
	-- }
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	return {
		-- enable snippet support
		capabilities = capabilities,
	}
end

-- lsp-install
local function setup_servers()
	require("lspinstall").setup()

	-- get all installed servers
	local servers = require("lspinstall").installed_servers()

	for _, server in pairs(servers) do
		local config = make_config()

		-- language specific config
		if server == "lua" then
			config.settings = lua_settings
		end
		require("lspconfig")[server].setup(config)
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
