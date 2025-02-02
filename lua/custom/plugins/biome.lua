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
          autostart = true,
          settings = {
            biome = {
              config(function()
                local project_root = vim.fn.getcwd()
                local biome_config = project_root .. '/biome.json'
                local default_biome = vim.fn.expand '~/biome.json'

                if vim.fn.filereadable(biome_config) == 1 then
                  return biome_config
                elseif vim.fn.filereadable(default_biome) == 1 then
                  return default_biome
                else
                  return nil
                end
              end)(),
            },
          },
        },
      },
    },
  },
}
