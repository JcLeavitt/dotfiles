require 'navigator'.setup({
  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  icons = {
    icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
    -- Code action
    code_action_icon = '🏏', -- "",
    -- code lens
    code_lens_action_icon = '👓',
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_err = '📛',
    diagnostic_warn = '👎',
    diagnostic_info = [[👩]],
    diagnostic_hint = [[💁]],

    diagnostic_head_severity_1 = '🈲',
    diagnostic_head_severity_2 = '☣️',
    diagnostic_head_severity_3 = '👎',
    diagnostic_head_description = '👹',
    diagnostic_virtual_text = '🦊',
    diagnostic_file = '🚑',
    -- Values
    value_changed = '📝',
    value_definition = '🐶🍡', -- it is easier to see than 🦕
    -- Treesitter
    match_kinds = {
      var = ' ', -- "👹", -- Vampaire
      method = 'ƒ ', --  "🍔", -- mac
      ['function'] = ' ', -- "🤣", -- Fun
      parameter = '  ', -- Pi
      associated = '🤝',
      namespace = '🚀',
      type = ' ',
      field = '🏈',
    },
    treesitter_defult = '🌲',
  },
})
