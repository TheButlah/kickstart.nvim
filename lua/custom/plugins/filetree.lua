return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    -- Removes the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require("neo-tree").setup({
      -- Open to the whole window instead of as a sidebar
      filesystem = { window = { position = "current" } },
    })

    vim.keymap.set("n", "<leader>x", ":Neotree<CR>", { desc = "File E[x]plorer" })
  end
}
