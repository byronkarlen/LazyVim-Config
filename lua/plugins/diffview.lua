return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  opts = {},
  keys = {
    { "<leader>gk", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gl", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
