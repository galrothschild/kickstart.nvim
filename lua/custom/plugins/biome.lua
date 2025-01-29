return {
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      servers = {
        biome = {
          on_attach = function(client, bufnr)
            -- Enable formatting on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false } -- Format synchronously on save
              end,
            })
          end,
        },
      },
    },
  },
}
