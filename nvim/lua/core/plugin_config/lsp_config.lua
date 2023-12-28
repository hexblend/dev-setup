require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'eslint', 'tailwindcss', 'gopls' }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', 'gs', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'dp', ':OrganizeImports<CR>', { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

local commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
}


require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      -- Get the language server to recognize the `vim` global
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          libaray = vim.api.nvim_get_runtime_file("", true),
        },
      }
    }
  },
  capabilities = capabilities,
  commands = commands
}

require('lspconfig').tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  commands = commands
}
require('lspconfig').eslint.setup { on_attach = on_attach, capabilities = capabilities, commands = commands }
require('lspconfig').tailwindcss.setup { on_attach = on_attach, capabilities = capabilities, commands = commands }
require('lspconfig').gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = commands,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}
