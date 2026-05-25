return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- Disable formatting from vtsls, let ESLint handle it
          on_attach = function(client, _)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        eslint = {
          -- This is needed because volta prepends resolved binary paths before launching. Then, when a node spawns another process
          -- with a different cwd (or it changes into that cwd), it doesn't matter because the resolved node binary is already
          -- at the front of PATH. This means that when launching nvim from universe, it will use univere's node version to execute
          -- the LSP even though its executing it in the server/website directory.

          -- Use default global node version. Prepends homebrew's version of node to path since login shell
          cmd = { "bash", "-lc", "exec vscode-eslint-language-server --stdio" },
          settings = {
            workingDirectory = { mode = "location" }, -- affects the process's cwd for the eslint run, not eslint walking upward for configs
          },
        },
      },
    },
  },
}
