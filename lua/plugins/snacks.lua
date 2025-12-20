return {
  -- Get rid of vertical indent line
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.indent = opts.indent or {}
      opts.indent.enabled = false
    end,
  },
}
