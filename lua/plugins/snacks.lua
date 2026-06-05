-- Open the explorer; if the current file is git-ignored (e.g. inside
-- node_modules), include ignored files so the explorer can reveal it.
local function explorer(opts)
  opts = opts or {}
  local file = vim.api.nvim_buf_get_name(0)
  if file ~= "" and vim.uv.fs_stat(file) then
    vim.fn.system({ "git", "-C", vim.fn.fnamemodify(file, ":h"), "check-ignore", "--quiet", file })
    if vim.v.shell_error == 0 then
      opts.ignored = true
    end
  end
  Snacks.explorer(opts)
end

return {
  -- Get rid of vertical indent line
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          explorer({ cwd = LazyVim.root() })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fE",
        function()
          explorer()
        end,
        desc = "Explorer Snacks (cwd)",
      },
    },
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

      opts.picker.sources.recent = opts.picker.sources.recent or {}
      opts.picker.sources.recent.filter = opts.picker.sources.recent.filter or {}
      local recent_filter = opts.picker.sources.recent.filter.filter
      opts.picker.sources.recent.filter.filter = function(item, filter)
        local file = item.file or ""
        local stat = vim.uv.fs_stat(file)
        return not file:find("/%.git/COMMIT_EDITMSG$")
          and stat
          and stat.type ~= "directory"
          and (not recent_filter or recent_filter(item, filter))
      end

      opts.picker.sources.explorer = opts.picker.sources.explorer or {}
      opts.picker.sources.explorer.hidden = true
      opts.picker.sources.explorer.ignored = false
    end,
  },
}
