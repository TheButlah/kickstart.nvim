-- AI bullshit
return {
  'zbirenbaum/copilot.lua',
  -- These cause the plugin to lazy load on the listed events/commands
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = {
      -- Causes the predictions in the panel to update as you type.
      -- Panel can be opened with `:Copilot panel`
      auto_refresh = true,
    },
    suggestion = {
      -- Causes suggestions to appear as you type in insert mode.
      auto_trigger = true,
      keymap = {
        accept = '<M-c>',
        next = '<M-j>',
        prev = '<M-f>',
      },
    },
  },
}
