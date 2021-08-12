require"lspsaga".init_lsp_saga {
    max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
    finder_action_keys = { quit = "<ESC>" },
    code_action_keys = { quit = "<ESC>", exec = { "o", "<CR>" } },
    rename_action_keys = { quit = "<ESC>", exec = "<CR>" }
}
