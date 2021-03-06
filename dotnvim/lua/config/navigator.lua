require 'navigator'.setup({
  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  icons = {
    icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
    -- Code action
    code_action_icon = 'π', -- "ο ΄",
    -- code lens
    code_lens_action_icon = 'π',
    -- Diagnostics
    diagnostic_head = 'π',
    diagnostic_err = 'π',
    diagnostic_warn = 'π',
    diagnostic_info = [[π©]],
    diagnostic_hint = [[π]],

    diagnostic_head_severity_1 = 'π²',
    diagnostic_head_severity_2 = 'β£οΈ',
    diagnostic_head_severity_3 = 'π',
    diagnostic_head_description = 'πΉ',
    diagnostic_virtual_text = 'π¦',
    diagnostic_file = 'π',
    -- Values
    value_changed = 'π',
    value_definition = 'πΆπ‘', -- it is easier to see than π¦
    -- Treesitter
    match_kinds = {
      var = 'ξ ', -- "πΉ", -- Vampaire
      method = 'Ζ ', --  "π", -- mac
      ['function'] = 'ο ', -- "π€£", -- Fun
      parameter = 'ο  ', -- Pi
      associated = 'π€',
      namespace = 'π',
      type = 'ο  ',
      field = 'π',
    },
    treesitter_defult = 'π²',
  },
})
