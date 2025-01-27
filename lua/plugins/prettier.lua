-- Pastikan Prettier dan Null-ls diinstal

-- Setup Prettier
local prettier = require("prettier")
prettier.setup({
  bin = "prettier", -- atau `'prettierd'` untuk versi daemon
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
  cli_options = {
    arrow_parens = "always", -- Tambahkan tanda kurung pada panah fungsi
    bracket_spacing = true, -- Tambahkan spasi dalam objek { foo: bar }
    single_quote = true, -- Gunakan tanda kutip tunggal
    trailing_comma = "all", -- Tambahkan koma pada elemen terakhir
    tab_width = 2, -- Lebar tab 2 spasi
    use_tabs = false, -- Gunakan spasi alih-alih tab
  },
})

-- Setup Null-ls untuk menggunakan Prettier
local null_ls = require("null-ls") -- Ensure null-ls is required correctly
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- atau gunakan "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { "php", "blade" }, -- Format tambahan untuk file PHP dan Blade
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- Format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

return {
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      prettier.setup({
        bin = "prettier", -- atau `'prettierd'` untuk versi daemon
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
        cli_options = {
          arrow_parens = "always", -- Tambahkan tanda kurung pada panah fungsi
          bracket_spacing = true, -- Tambahkan spasi dalam objek { foo: bar }
          single_quote = true, -- Gunakan tanda kutip tunggal
          trailing_comma = "all", -- Tambahkan koma pada elemen terakhir
          tab_width = 2, -- Lebar tab 2 spasi
          use_tabs = false, -- Gunakan spasi alih-alih tab
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { "php", "blade" }, -- Format tambahan untuk file PHP dan Blade
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- Format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
              buffer = bufnr,
              group = group,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = async })
              end,
              desc = "[lsp] format on save",
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end,
      })
    end,
  },
}
