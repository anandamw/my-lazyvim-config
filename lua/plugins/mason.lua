return {
  -- Install Prettier menggunakan Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "prettier" }, -- Pastikan Prettier diinstal
    },
  },

  -- Install prettier.nvim untuk integrasi Prettier
  {
    "MunifTanjim/prettier.nvim",
    opts = {
      bin = "prettier", -- atau 'prettierd' (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "php",
        "blade",
      },
    },
  },

  -- Install null-ls using Mason
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      ensure_installed = { "null-ls" }, -- Ensure null-ls is installed
    },
  },

  -- Gunakan Prettier dengan null-ls untuk formatting
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier) -- Tambahkan Prettier ke sumber format null-ls
    end,
  },

  -- Install Conform untuk format otomatis (optional)
  {
    "stevearc/conform.nvim",
    optional = true, -- Tandai plugin ini sebagai opsional
    opts = function(_, opts)
      local supported = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "php",
        "blade",
      }
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- Tambahkan Prettier sebagai formatter untuk filetypes yang didukung
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "prettier")
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = {
        condition = function(_, ctx)
          return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
        end,
      }
    end,
  },
}
