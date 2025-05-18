return {
  -- Mason untuk install prettier
  {
    "williamboman/mason.nvim",
    opts = {
     ensure_installed = { "prettier", "stylua", "eslint_d" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tsserver",    -- LSP untuk TypeScript/JavaScript
        "pyright",     -- LSP untuk Python
        "lua_ls",      -- LSP untuk Lua (lua-language-server)
      },
    },
  },
  -- prettier.nvim untuk integrasi prettier CLI
  {
    "MunifTanjim/prettier.nvim",
    opts = {
      bin = "prettier",
      filetypes = {
        "css", "graphql", "html", "javascript", "javascriptreact",
        "json", "less", "markdown", "scss", "typescript",
        "typescriptreact", "yaml", "php", "blade",
      },
      cli_options = {
        arrow_parens = "always",
        bracket_spacing = true,
        single_quote = true,
        trailing_comma = "all",
        tab_width = 2,
        use_tabs = false,
      },
    },
  },

  -- none-ls.nvim sebagai pengganti null-ls
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls") -- require di dalam fungsi supaya plugin sudah ter-load
      opts.sources = opts.sources or {}
      table.insert(opts.sources, null_ls.builtins.formatting.prettier)
    end,
  },
}
