require"lspsaga".init_lsp_saga {
    max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
    code_action_prompt = { enable = false },
    finder_action_keys = { quit = "<ESC>" },
    rename_action_keys = { quit = "<ESC>", exec = "<CR>" }
}
