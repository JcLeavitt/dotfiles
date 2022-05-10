-- this is the alternating tab indent coloring
-- vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
-- vim.cmd [[highlight IndentEven guifg=NONE guibg=#e2e9e9 gui=nocombine]]
-- vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
-- vim.g.indent_blankline_space_char_highlight_list = {"IndentOdd", "IndentEven"}
-- vim.g.indent_blankline_char = " "
-- vim.g.indent_blankline_space_char = " "
-- -- when using background, the trailing indent is not needed / looks wrong
-- vim.g.indent_blankline_show_trailing_blankline_indent = false
-- vim.g.indent_blankline_use_treesitter = true


vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
