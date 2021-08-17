local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-n>"] = false,
				["<TAB>"] = actions.move_selection_previous,
				["<C-p>"] = false,
				["<S-TAB>"] = actions.move_selection_next,
				["<ESC>"] = actions.close,
			},
		},
	},
})

require("telescope").load_extension("projects")
