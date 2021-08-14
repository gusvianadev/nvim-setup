-- lazy_load() will only snippets for the current file, so it doesn't load all
-- available snippets for all files
require( "luasnip/loaders/from_vscode" ).lazy_load()
