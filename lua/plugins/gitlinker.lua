return {
  "ruifm/gitlinker.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("gitlinker").setup({
      opts = {
        add_current_line_on_normal_mode = true,
        action_callback = require("gitlinker.actions").open_in_browser,
        print_url = false,
      },
      mappings = nil, -- disable all default mappings
    })
  end,
  keys = {
    {
      "<leader>gg",
      '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser, add_current_line_on_normal_mode = false})<cr>',
      desc = "Open file in GitHub",
      mode = "n",
    },
    {
      "<leader>gg",
      '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
      desc = "Open selection in GitHub",
      mode = "v",
    },
  },
}
