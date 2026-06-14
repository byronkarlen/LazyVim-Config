return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  opts = {},
  keys = {
    { "<leader>gj", ":DiffviewOpen ", desc = "Diffview Open (custom)" },
    { "<leader>gk", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gl", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
