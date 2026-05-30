return {
  -- Get rid of vertical indent line
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.indent = opts.indent or {}
      opts.indent.enabled = false

      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}

      opts.picker.sources.files = opts.picker.sources.files or {}
      opts.picker.sources.files.hidden = true
      opts.picker.sources.files.ignored = false

      opts.picker.sources.grep = opts.picker.sources.grep or {}
      opts.picker.sources.grep.hidden = true
      opts.picker.sources.grep.ignored = false

      opts.picker.sources.grep_word = opts.picker.sources.grep_word or {}
      opts.picker.sources.grep_word.hidden = true
      opts.picker.sources.grep_word.ignored = false

      opts.picker.sources.explorer = opts.picker.sources.explorer or {}
      opts.picker.sources.explorer.hidden = true
      opts.picker.sources.explorer.ignored = false
    end,
  },
}
